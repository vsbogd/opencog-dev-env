#!/bin/sh

SOURCE_DIR=${HOME}/temp/agi
DOCKER_HOME=/home/opencog
POSTGRES_CONTAINER="priceless_elion"

docker run -u `id -u`:`id -g` \
    --mount="type=bind,src=${SOURCE_DIR},dst=${DOCKER_HOME}/projects" \
    --mount="type=bind,src=${HOME}/.stack,dst=${DOCKER_HOME}/.stack" \
    --network="container:${POSTGRES_CONTAINER}" \
    -ti opencog  bash
