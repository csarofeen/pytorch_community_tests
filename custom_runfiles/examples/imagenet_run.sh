source $HOMEBASE/check_commit.sh
BASEDIR=$(dirname $0)
pushd $BASEDIR
ln -sf /data/imagenet/val-jpeg/ val
ln -sf /data/imagenet/train-jpeg-256x256/ train
export IMAGENET_ROOT=../..
git clone https://github.com/pytorch/examples.git
pushd examples
# Checkout hardcoded commit
check_commit $1 $2
git checkout $2
popd
./download-data.sh
./install-deps.sh
./run-script.sh
RETURN=$?
# rm -rf examples
popd
exit $RETURN
