#!/bin/bash

source list_scripts.sh
source print_banner.sh
source check_commit.sh

set -ex

# Lock tests to one particular commit in "builder" repo.
builder_commit=e0ebfdb

HOMEBASE=`pwd`
# not really necessary if we source *_run.sh in subshells:
export HOMEBASE=$HOMEBASE

# Bash command used to run subscripts like run-script.sh, download_data.sh, etc.
# within each custom_runfiles/*_run.sh:
CUSTOM_BASH="bash -ex"

git clone https://github.com/pytorch/builder.git 
pushd builder

check_commit builder $builder_commit

git checkout $builder_commit

pushd test_community_repos

for repo in "${repos[@]}"
do
  if [[ ${enabled[$repo]} == true ]];
  then
    print_banner "    TESTING REPOSITORY $repo    "
    printf "\n\n\n"
    pushd $repo
    printf "\n\n\n"
    cp $HOMEBASE/custom_runfiles/${repo}_run.sh .
    # Strip leading "examples/" if present to get this run script's actual filename:
    basename=`echo ${repo}_run.sh | sed s%^.*/%%g`
    # We'd like to collect an approximate measure of each repo's runtime.
    # I could say something like t1=$(time (...) >juggle stdout and stderr) 
    # but it's simpler to use date:
    t1=$(date +%s)
    # Don't let the main script quit on error if the subshell errors:
    set +e
    ( 
      # Subshell should still quit on error, so we can see where it errored,
      # and main script can collect the last error code.
      set -e; 
      # Supplying variables as arguments isn't really necessary 
      # if we "source" the run scripts, but it doesn't hurt.
      source ./$basename $repo ${repo_commits[$repo]} 
    )
    # Collect the error code for this repo
    failures[$repo]=$? 
    # ...and resume "safe" execution
    set -e 
    t2=$(date +%s)
    timings[$repo]=$((t2-t1))
    printf "\n\n\n"
    popd
    printf "\n\n\n"
  fi
done
popd
popd

# temporarily disable -x for pretty-print
set +x
print_banner "Testing complete, subshell exit codes:  (At least some of the community run scripts are set up to forward exit codes from the actual python command, but I'm not sure how reliable this is.)"

for repo in "${repos[@]}"
do
  printf "%-10s : %s\n" ${failures[$repo]} $repo
done 

print_banner "Approximate total runtimes of each test, including any data downloads.  Computed using date, so ~1 sec resolution."

for repo in "${repos[@]}"
do
  printf "%-10s sec : %s\n" ${timings[$repo]} $repo
done 
set -x

RETURN=0
for repo in "${repos[@]}"
do
  if [[ ( "${failures[$repo]}" != "disabled" ) && 
        ( "${failures[$repo]}" != "0" ) ]]
  then
    RETURN=1 
  fi
done 

rm -rf builder

exit $RETURN
