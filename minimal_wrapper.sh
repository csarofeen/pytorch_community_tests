#!/bin/bash

# Usage:  If builder is present, go to 
# builder/test_community_repos/<reponame> and run
# cp ../../../custom_runfiles/<reponame>_run.sh .
# ../../../minimal_wrapper.sh reponame.

set -ex

HOMEBASE="/opt/pytorch/qa/L3_community"

source $HOMEBASE/list_scripts.sh
source $HOMEBASE/check_commit.sh

SCRIPT=$1_run.sh
CUSTOM_BASH="bash -e"

pushd $HOMEBASE/builder/test_community_repos/$1

set +e
(
  set -e
  source "./$SCRIPT" $1 ${repo_commits[$1]}
)
# echo `pwd`

popd
