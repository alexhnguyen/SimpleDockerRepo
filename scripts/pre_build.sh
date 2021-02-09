set -xeu

HOME_PATH=$(pwd)

mkdir build
cd build

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
GET_PIP_PATH="./build/get-pip.py"

git clone https://github.com/alexhnguyen/SkeletonPythonPkg.git
PACKAGE_PATH="./build/SkeletonPythonPkg"


curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

aws ecr get-login-password --region $AWS_REGION | \
    docker login \
        --username AWS \
        --password-stdin "$(aws sts get-caller-identity --query Account --output text).dkr.ecr.$DEPLOY_AWS_REGION.amazonaws.com"

cd $HOME_PATH
