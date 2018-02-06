#!/bin/bash

check_commit() {
  current=$(git branch -v | awk '{print $3}')
  printf "\n\e[30m\e[41mChecking cloned commit for repo $1\e[0m\n"
  if [ "$current" != "$2" ]; then
    printf "\e[30m\e[41mWarning: Initial cloned commit for repo \"$1\" differs from stored value.\e[0m\n"
    printf "\e[30m\e[41mCloned commit:  $current\e[0m\n"
    printf "\e[30m\e[41mStored commit:  $2\e[0m\n\n"
  else
    printf "\e[30m\e[41mOK:  Initial cloned commit $current matches stored commit $2\e[0m\n\n"
  fi
}
