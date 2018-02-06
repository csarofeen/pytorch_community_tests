

source activate pytorch-py3.6
apt-get update
apt-get install libgtk2.0-0 -y
git clone https://github.com/szagoruyko/diracnets
pushd diracnets
# Checkout hardcoded commit
check_commit $1 $2
git checkout $2
# ../download_data.sh
$CUSTOM_BASH ../install-deps.sh
$CUSTOM_BASH ../run-script.sh
source deactivate pytorch-py3.6
