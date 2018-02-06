yes | pip install block
yes | pip install nose

TMPDIR=$RANDOM
mkdir /tmp/$TMPDIR
git clone https://github.com/bamos/block /tmp/$TMPDIR
pushd /tmp/$TMPDIR
# Checkout hardcoded commit
check_commit $1 $2
git checkout $2
nosetests test.py
popd
rm -rf /tmp/$TMPDIR
