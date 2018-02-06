

git clone https://github.com/facebookresearch/fairseq-py.git
pushd fairseq-py
# Checkout hardcoded commit
check_commit $repo ${repo_commits[$repo]}
git checkout ${repo_commits[$repo]}
$CUSTOM_BASH ../download_data.sh
$CUSTOM_BASH ../install-deps.sh
$CUSTOM_BASH ../run-script.sh
popd
rm -rf fairseq-py


