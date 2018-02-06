source $HOMEBASE/check_commit.sh
BASEDIR=$(dirname $0)
export IMAGENET_ROOT=..
ln -sf /data/imagenet/val-jpeg/ val
ln -sf /data/imagenet/train-jpeg-256x256/ train
pushd $BASEDIR
git clone https://github.com/fyu/drn.git
# Checkout hardcoded commit
check_commit $1 $2
git checkout $2
./download-data.sh
./install-deps.sh
./run-script.sh
RETURN=$?
rm -rf drn
popd
exit $RETURN

