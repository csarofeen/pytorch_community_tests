

git clone https://github.com/bamos/densenet.pytorch.git
sed -i 's/pushd.*//g' run-script.sh
sed -i 's/popd.*//g' run-script.sh
pip install setproctitle
pushd densenet.pytorch
# Checkout hardcoded commit
check_commit $1 $2
git checkout $2
$CUSTOM_BASH ../install-deps.sh
$CUSTOM_BASH ../run-script.sh
popd
rm -rf densenet.pytorch

