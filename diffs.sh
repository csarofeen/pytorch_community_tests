#!/bin/bash

source list_scripts.sh

for repo in "${repos[@]}"
do
  CMD="diff custom_runfiles/${repo}_run.sh builder/test_community_repos/${repo}/run.sh"
  echo "$CMD"
  $CMD 2>&1
  echo ""
done
