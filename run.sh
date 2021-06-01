#!/bin/sh

SOURCE_DIR=${HOME}/projects/opencog
DOCKER_HOME=/home/vital
POSTGRES_CONTAINER=opencog-postgres

docker run --name "${POSTGRES_CONTAINER}" --rm --detach opencog/postgres

docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
	--name opencog \
	--runtime=nvidia \
	-u `id -u`:`id -g` \
    --mount="type=bind,src=${SOURCE_DIR},dst=${SOURCE_DIR}" \
    --mount="type=bind,src=${HOME}/.stack,dst=${DOCKER_HOME}/.stack" \
    --network="container:${POSTGRES_CONTAINER}" \
    --mount="type=bind,src=/mnt/fileserver,dst=/mnt/fileserver" \
    -ti opencog  bash
