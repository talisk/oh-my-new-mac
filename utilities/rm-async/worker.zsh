#!/bin/zsh
emulate -LR zsh
umask 077
state_dir="$1"
finish() {
  local result=$?
  print -r -- "$result" > "$state_dir/result.tmp"
  /bin/mv -f -- "$state_dir/result.tmp" "$state_dir/result"
}
trap finish EXIT
trap 'exit 143' TERM
trap 'exit 130' INT
# zsh preserves the NUL sentinel, including any trailing newlines in the path.
# Avoid read -d: it modifies terminal settings even with redirected input.
target=$(<"$state_dir/target")
[[ "$target" == *$'\0' ]] || exit 2
target="${target%$'\0'}"
[[ -n "$target" && "$target" != / ]] || exit 2
# Do not delete a replacement created while this job was queued or scanning.
# This is a best-effort identity check, not a filesystem lock.
check_identity() {
  local expected actual
  [[ -r "$state_dir/identity" ]] || return 1
  expected=$(<"$state_dir/identity")
  actual=$(/usr/bin/stat -f '%d:%i' -- "$target" 2>/dev/null) || return 1
  [[ "$actual" == "$expected" ]]
}
check_identity || { print -u2 -- 'target missing or replaced; refusing deletion'; exit 3; }
print -r -- scanning > "$state_dir/phase"
row=$(/usr/bin/du -skP -- "$target" 2>>"$state_dir/log")
scan_rc=$?
total="${row%%[[:space:]]*}"
if (( scan_rc == 0 )) && [[ "$total" == <-> ]]; then
  print -r -- "$total" > "$state_dir/total"
fi
check_identity || { print -u2 -- 'target missing or replaced after scan; refusing deletion'; exit 3; }
print -r -- deleting > "$state_dir/phase"
# Do not resolve the final symlink: rm must remove the link, not its destination.
/bin/rm -rf -- "$target"
exit $?
