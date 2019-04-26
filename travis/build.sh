#!/usr/bin/env bash

set -e

#good defaults
: ${CONFIG_FILE:="./build.config"}
test -e ${CONFIG_FILE} && . ${CONFIG_FILE}


architectures="arm arm64 amd64"
images=""
platforms=""

for arch in $architectures
do
# Build for all architectures and push manifest
  platforms="linux/$arch,$platforms"
done

platforms=${platforms::-1}


# Login into docker
docker login --username $DOCKER_USER --password $DOCKER_PASS


# Push multi-arch image
buildctl build --frontend dockerfile.v0 \
      --local dockerfile=. \
      --local context=. \
      --output type=image,name=docker.io/$REPO:test-build,push=true \
      --opt platform=$platforms \
      --opt "build-arg:BASE=$BASE" \
      --opt filename=./Dockerfile.cross

# Push image for every arch with arch prefix in tag
for arch in $architectures
do
# Build for all architectures and push manifest
  buildctl build --frontend dockerfile.v0 \
      --local dockerfile=. \
      --local context=. \
      --output type=image,name=docker.io/$REPO:test-build-$arch,push=true \
      --frontend-opt platform=linux/$arch \
      --opt "build-arg:BASE=$BASE" \
      --frontend-opt filename=./Dockerfile.cross &
done

wait

docker pull $REPO:test-build-arm
docker tag $REPO:test-build-arm zeerorg/cron-connector:test-build-armhf
docker push $REPO:test-build-armhf