# Background permanent deletion for interactive zsh.
rm_async() {
  emulate -L zsh
  [[ "$1" == -- ]] && shift
  if (( $# == 0 )); then
    print -u2 -- 'usage: rm_async [--] "path" ["another path" ...]'
    return 2
  fi
  # %x is the file defining this function, including when it is sourced elsewhere.
  local worker="${${(%):-%x}:A:h}/worker.zsh"
  local base="${RM_ASYNC_STATE_DIR:-$HOME/.local/state/rm-async}"
  base="${base:a}"
  local arg target resolved identity
  local -a targets
  local home_real="${HOME:A}" cwd_real="${PWD:A}"
  # Validate every argument before launching any deletion.
  for arg in "$@"; do
    if [[ -z "$arg" ]]; then
      print -u2 -- 'refusing empty path'
      return 2
    fi
    target="${arg:a}"
    resolved="${arg:A}"
    # Protect root, home, the working directory, and their ancestors.
    if [[ "$target" == / || "$target" == "$HOME" ||
          "$resolved" == / || "$home_real" == "$resolved" ||
          "$home_real" == "$resolved"/* || "$cwd_real" == "$resolved" ||
          "$cwd_real" == "$resolved"/* ||
          "${worker:A}" == "$resolved"/* || "${base:A}" == "$resolved" ||
          "${base:A}" == "$resolved"/* ]]; then
      print -u2 -- "refusing protected path: $target"
      return 2
    fi
    if [[ ! -e "$target" && ! -L "$target" ]]; then
      print -u2 -- "path does not exist: $target"
      return 2
    fi
    targets+=("$target")
  done
  [[ -r "$worker" ]] || { print -u2 -- "missing worker: $worker"; return 1; }
  local state_dir
  (umask 077; /bin/mkdir -p -- "$base") || return 1
  for target in "${targets[@]}"; do
    identity=$(/usr/bin/stat -f '%d:%i' -- "$target") || return 1
    state_dir=$(/usr/bin/mktemp -d "$base/job.XXXXXXXX") || return 1
    print -rn -- "$target"$'\0' > "$state_dir/target" || return 1
    print -r -- "$identity" > "$state_dir/identity" || return 1
    print -r -- queued > "$state_dir/phase" || return 1
    /usr/bin/nohup /bin/zsh -f "$worker" "$state_dir" </dev/null >"$state_dir/log" 2>&1 &!
    print -r -- "$!" > "$state_dir/pid"
    if (( ${#targets} == 1 )); then
      print -r -- "${state_dir:t}"
    else
      print -r -- "${state_dir:t}"$'\t'"${(q)target}"
    fi
  done
}

rm_progress() {
  emulate -L zsh
  if (( $# != 1 )) || [[ "$1" != job.* || "$1" == *[^a-zA-Z0-9.]* ]]; then
    print -u2 -- 'usage: rm_progress job.XXXXXXXX'
    return 2
  fi
  local base="${RM_ASYNC_STATE_DIR:-$HOME/.local/state/rm-async}"
  local state_dir="${base:a}/$1"
  [[ -r "$state_dir/target" ]] || { print -u2 -- "unknown job: $1"; return 1; }
  local target pid phase total remain row result process_state process_command
  target=$(<"$state_dir/target")
  target="${target%$'\0'}"
  pid=$(<"$state_dir/pid")
  phase=$(<"$state_dir/phase")
  print -r -- "target: ${(q)target}"
  if [[ -r "$state_dir/result" ]]; then
    result=$(<"$state_dir/result")
    if [[ "$result" == 0 ]]; then
      print -r -- 'status: succeeded  progress: 100%'
    else
      print -r -- "status: failed  exit: $result"
      print -r -- "log: $state_dir/log"
      /usr/bin/tail -n 8 "$state_dir/log"
    fi
    return 0
  fi
  if [[ -n "$pid" ]] && ! kill -0 "$pid" 2>/dev/null; then
    print -r -- "status: interrupted (no exit result)  log: $state_dir/log"
    return 1
  fi
  process_state=$(/bin/ps -p "$pid" -o stat= 2>/dev/null)
  process_command=$(/bin/ps -p "$pid" -o command= 2>/dev/null)
  if [[ -z "$process_state" || "$process_state" == *Z* ||
        "$process_command" != *"/worker.zsh $state_dir" ]]; then
    # The worker may have just finished between checks.
    if [[ -r "$state_dir/result" ]]; then
      rm_progress "$1"
      return $?
    fi
    print -r -- 'status: interrupted (worker missing or PID reused; no exit result)'
    return 1
  fi
  if [[ "$process_state" == *T* ]]; then
    print -r -- "status: stopped (process suspended; no progress)  pid: $pid"
    return 1
  fi
  print -r -- "status: $phase  pid: $pid"
  [[ "$phase" == deleting && -r "$state_dir/total" ]] || return 0
  total=$(<"$state_dir/total")
  [[ "$total" == <-> && "$total" -gt 0 ]] || { print -- 'progress: unavailable'; return 0; }
  # Read-only estimate; scanning a large directory can take time.
  remain=0
  if [[ -e "$target" || -L "$target" ]]; then
    print -r -- 'estimating remaining size (large directories may take time)...'
    row=$(/usr/bin/du -skP -- "$target" 2>/dev/null)
    remain="${row%%[[:space:]]*}"
    [[ "$remain" == <-> ]] || { print -- 'progress: unavailable (directory is changing)'; return 0; }
  fi
  /usr/bin/awk -v t="$total" -v r="$remain" 'BEGIN {
    p=(t-r)*100/t; if(p<0)p=0; if(p>99.9)p=99.9;
    printf "estimated progress: %.1f%%  remaining: %.2f GiB\n", p, r/1024/1024
  }'
}
