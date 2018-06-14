#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-paymeal/paymeald-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/paymeald docker/bin/
cp $BUILD_DIR/src/paymeal-cli docker/bin/
cp $BUILD_DIR/src/paymeal-tx docker/bin/
strip docker/bin/paymeald
strip docker/bin/paymeal-cli
strip docker/bin/paymeal-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
