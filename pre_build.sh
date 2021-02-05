# reinstall aws cli
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
# pip uninstall -yq awscli

mkdir build
pushd build
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
git clone git@github.com:alexhnguyen/python-project-skeleton.git

popd build
