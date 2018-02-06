

sed -i 's/60/180/g' run.py
git clone https://github.com/pytorch/examples.git
pushd examples
# Checkout hardcoded commit
check_commit $1 $2
git checkout $2
popd
$CUSTOM_BASH ./download-data.sh
$CUSTOM_BASH ./install-deps.sh
$CUSTOM_BASH ./run-script.sh
RETURN=$?
rm -rf examples

exit $RETURN
