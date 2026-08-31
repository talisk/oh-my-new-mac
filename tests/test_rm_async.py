"""macOS regression checks; delete only files created under our temporary root."""
import os
import pty
import re
import select
import shlex
import signal
import subprocess
import sys
import tempfile
import time
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FUNCTIONS = ROOT / "utilities/rm-async/functions.zsh"
WORKER = FUNCTIONS.with_name("worker.zsh")


@unittest.skipUnless(sys.platform == "darwin", "uses macOS zsh, du, stat and job control")
class RmAsyncTests(unittest.TestCase):
    def setUp(self):
        local = ROOT / ".local"
        local.mkdir(exist_ok=True)
        self.temp = tempfile.TemporaryDirectory(prefix="rm-async-test-", dir=local)
        self.root = Path(self.temp.name).resolve()
        self.state = self.root / "state"
        self.state.mkdir()
        self.env = dict(os.environ, RM_ASYNC_STATE_DIR=str(self.state))

    def tearDown(self):
        # Clean up only workers whose command contains this test's unique state path.
        for f in self.state.glob("job.*/pid"):
            try:
                pid = int(f.read_text())
                command = subprocess.run(
                    ["/bin/ps", "-p", str(pid), "-o", "command="],
                    capture_output=True, text=True, check=False,
                ).stdout
                if str(self.state) in command and "worker.zsh" in command:
                    os.kill(pid, signal.SIGKILL)
            except (ValueError, ProcessLookupError):
                pass
        self.temp.cleanup()

    def shell(self, code, *args):
        return subprocess.run(
            ["/bin/zsh", "-df", "-c", f'source {shlex.quote(str(FUNCTIONS))}\n{code}',
             "test", *map(str, args)],
            env=self.env, cwd=ROOT, capture_output=True, text=True, timeout=10,
        )

    def target(self, name):
        folder = self.root / name
        folder.mkdir()
        (folder / "file").write_text("disposable test data")
        return folder

    def wait_job(self, job):
        result = self.state / job / "result"
        until = time.monotonic() + 10
        while not result.exists() and time.monotonic() < until:
            time.sleep(0.02)
        self.assertTrue(result.exists(), f"job did not finish: {job}")
        self.assertEqual(result.read_text().strip(), "0")

    def test_interactive_background_and_shell_exit(self):
        """A real controlling TTY is essential: pipes missed the original SIGTTOU bug."""
        targets = [self.target("first space"), self.target("second\n")]
        keep = self.target("keep")
        link = self.root / "link"
        link.symlink_to(keep, target_is_directory=True)
        targets.append(link)
        pid, fd = pty.fork()
        if pid == 0:
            os.chdir(ROOT)
            os.execve("/bin/zsh", ["/bin/zsh", "-df"], self.env)
        output = b""
        exited = False
        try:
            command = (
                f"source {shlex.quote(str(FUNCTIONS))}\n"
                "rm_async " + " ".join(shlex.quote(str(p)) for p in targets) + "\n"
            )
            os.write(fd, command.encode())
            deadline = time.monotonic() + 10
            jobs = []
            while time.monotonic() < deadline:
                if select.select([fd], [], [], 0.1)[0]:
                    output += os.read(fd, 65536)
                jobs = re.findall(rb"job\.[A-Za-z0-9]+", output)
                if len(set(jobs)) == 3:
                    break
            self.assertEqual(len(set(jobs)), 3, output.decode(errors="replace"))
            # Close the initiating shell; nohup/disown workers must still finish.
            os.write(fd, b"exit\n")
            for job in dict.fromkeys(jobs):
                self.wait_job(job.decode())
                r = self.shell('rm_progress "$1"', job.decode())
                self.assertIn("status: succeeded", r.stdout)
            self.assertTrue((keep / "file").exists())
            self.assertTrue(all(not os.path.lexists(p) for p in targets))
            until = time.monotonic() + 5
            while time.monotonic() < until:
                if os.waitpid(pid, os.WNOHANG)[0]:
                    exited = True
                    break
                time.sleep(0.02)
        finally:
            # macOS can wait for the PTY master to close during session teardown.
            # Close it before blocking in waitpid, even when the shell has exited.
            os.close(fd)
            if not exited:
                try:
                    os.kill(pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
                os.waitpid(pid, 0)

    def test_all_arguments_checked_before_start(self):
        keep = self.target("keep")
        for bad in ["", "/", str(Path.home()), str(ROOT), str(self.root / "missing"), str(self.state)]:
            with self.subTest(path=bad):
                r = self.shell('rm_async "$@"', keep, bad)
                self.assertEqual(r.returncode, 2, r.stderr)
                self.assertTrue((keep / "file").exists())
                self.assertEqual(list(self.state.iterdir()), [])

    def test_single_target_output_and_umask(self):
        target = self.target("single")
        r = self.shell('before=$(umask)\nrm_async -- "$1"\n[[ "$before" == "$(umask)" ]]', target)
        self.assertEqual(r.returncode, 0, r.stderr)
        self.assertRegex(r.stdout, r"^job\.[A-Za-z0-9]+\n$")
        self.wait_job(r.stdout.strip())
        self.assertFalse(target.exists())
        self.assertEqual(self.shell("rm_async").returncode, 2)
        self.assertEqual(self.shell("rm_progress ../bad").returncode, 2)

    def test_replaced_target_is_not_deleted(self):
        target = self.target("replacement")
        state = self.state / "job.Replaced"
        state.mkdir()
        (state / "target").write_bytes(os.fsencode(target) + b"\0")
        (state / "identity").write_text("0:0\n")
        with (state / "log").open("w") as log:
            r = subprocess.run(["/bin/zsh", "-df", str(WORKER), str(state)],
                               stdout=log, stderr=log, timeout=10)
        self.assertEqual(r.returncode, 3)
        self.assertEqual((state / "result").read_text().strip(), "3")
        self.assertTrue((target / "file").exists())

    def test_suspended_and_reused_pid_are_not_reported_running(self):
        target = self.target("untouched")
        state = self.state / "job.Stopped"
        state.mkdir()
        (state / "target").write_bytes(os.fsencode(target) + b"\0")
        (state / "phase").write_text("queued\n")
        # Stops before exec; after continuing, this deliberately invalid job fails safely.
        child = subprocess.Popen(
            ["/bin/zsh", "-df", "-c", 'kill -STOP $$\nexec /bin/zsh -f "$1" "$2"',
             "test", str(WORKER), str(state)],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
        )
        try:
            os.waitpid(child.pid, os.WUNTRACED)
            # ps command still contains our worker path and state; the state must show stopped.
            (state / "pid").write_text(str(child.pid) + "\n")
            r = self.shell('rm_progress "$1"', state.name)
            self.assertIn("status: stopped", r.stdout)
        finally:
            child.kill()
            child.wait()
        (state / "pid").write_text(str(os.getpid()) + "\n")
        r = self.shell('rm_progress "$1"', state.name)
        self.assertIn("status: interrupted", r.stdout)
        self.assertTrue((target / "file").exists())


if __name__ == "__main__":
    unittest.main()
