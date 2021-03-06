#!/bin/sh

SOURCE_DIR=${HOME}/projects
DOCKER_HOME=/home/opencog
POSTGRES_CONTAINER=opencog-postgres

docker run --name "${POSTGRES_CONTAINER}" --rm --detach opencog/postgres

docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
	--name opencog \
	-u `id -u`:`id -g` \
    --mount="type=bind,src=${SOURCE_DIR},dst=${DOCKER_HOME}/projects" \
    --mount="type=bind,src=${HOME}/.stack,dst=${DOCKER_HOME}/.stack" \
    --network="container:${POSTGRES_CONTAINER}" \
    -ti opencog bash
