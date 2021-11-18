#!/usr/bin/env bash

function async_run() {
  {
    eval "$@" &> /dev/null
  }&
}

function we_are_on_repo() {
  if [[ -e "$(git rev-parse --git-dir 2> /dev/null)" ]]; then
    echo 1
  else
    echo 0
  fi
}

function setGitPrompt() {
  local repo=$(git rev-parse --show-toplevel 2> /dev/null)
  if [[ ! -e "${repo}" ]]; then
    # we do not permit bash-git-prompt outside git repos, so nothing to do
    return
  fi

  checkUpstream
}

# some versions of find do not have -mmin
_have_find_mmin=1

function olderThanMinutes() {
  local matches
  local find_exit_code

  if [[ -z "${_find_command+x}" ]]; then
    if command -v gfind > /dev/null; then
      _find_command="gfind"
    else
      _find_command="find"
    fi
  fi

  if [[ "${_have_find_mmin}" = 1 ]]; then
    matches=$("${_find_command}" "${1}" -mmin +"${2}" 2> /dev/null)
    find_exit_code="${?}"
    if [[ -n "${matches}" ]]; then
      return 0
    else
      if [[ "${find_exit_code}" != 0 ]]; then
        _have_find_mmin=0
      else
        return 1
      fi
    fi
  fi

  echo ${2}
  # try perl, solaris ships with perl
  if command -v perl > /dev/null; then
    perl -e '((time - (stat("'"${1}"'"))[9]) / 60) > '"${2}"' && exit(0) || exit(1)'
    return "${?}"
  else
    echo >&2
    echo "[1;31mWARNING[0m: neither a find that supports -mmin (such as GNU find) or perl is available, disabling remote status checking. Install GNU find as gfind or perl to enable this feature, or set GIT_PROMPT_FETCH_REMOTE_STATUS=0 to disable this warning." >&2
    echo >&2
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    return 1
  fi
}

function checkUpstream() {
  local FETCH_HEAD="${repo}/.git/FETCH_HEAD"
  # Fech repo if local is stale for more than $GIT_FETCH_TIMEOUT minutes
  if [[ ! -e "${FETCH_HEAD}" ]] || olderThanMinutes "${FETCH_HEAD}" 5
  then
    if [[ -n $(git remote show) ]]; then
      (
        async_run "GIT_TERMINAL_PROMPT=0 git fetch --quiet"
        disown -h
      )
    fi
  fi
}

PROMPT_COMMAND=setGitPrompt
