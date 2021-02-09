set -xeu

IMAGE_REPO=$1
IMAGE_TAG=$2

LOCAL_ID="$IMAGE_REPO:$IMAGE_TAG"
PUSH_ID="$AWS_ACCOUNT_ID.dkr.ecr.$DEPLOY_AWS_REGION.amazonaws.com/${LOCAL_ID}"

docker build -t $LOCAL_ID --build-arg PACKAGE_PATH="$PACKAGE_PATH" --build-arg GET_PIP_PATH="$GET_PIP_PATH" .

docker tag $LOCAL_ID $PUSH_ID
docker push $PUSH_ID
