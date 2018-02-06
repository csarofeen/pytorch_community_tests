

git clone https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix.git
pushd pytorch-CycleGAN-and-pix2pix
check_commit $1 $2
git checkout $2
apt-get update
apt-get install unzip
$CUSTOM_BASH ../download_data.sh
$CUSTOM_BASH ../install-deps.sh
$CUSTOM_BASH ../run-script.sh
popd
rm -rf pytorch-CycleGAN-and-pix2pix
