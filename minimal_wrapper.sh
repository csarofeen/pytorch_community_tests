#!/bin/bash

# Usage:  
# From L3_community directory:
# git clone https://github.com/pytorch/builder.git
# cd builder/test_community_repos/<reponame>
# ../../../minimal_wrapper.sh <reponame>.

set -ex


HOMEBASE="/opt/pytorch/qa/L3_community"

source $HOMEBASE/list_scripts.sh
source $HOMEBASE/check_commit.sh

SCRIPT=$1_run.sh
CUSTOM_BASH="bash -e"

cp $HOMEBASE/custom_runfiles/$1_run.sh .

pushd $HOMEBASE/builder/test_community_repos/$1

set +e
(
  set -e
  source "./$SCRIPT" $1 ${repo_commits[$1]}
)
# echo `pwd`

popd
