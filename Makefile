PROJECT ?= myproject
DATADIR ?= ${PWD}/data
WORKDIR ?= ${PWD}/work_dirs
WORKSPACE ?= /workspace/$(PROJECT)
DOCKER_IMAGE ?= ${PROJECT}:latest
LOCAL_UID ?= 1000
LOCAL_GID ?= 1000

SHMSIZE ?= 100G
DOCKER_OPTS := \
			--name ${PROJECT} \
			--rm -it \
			--shm-size=${SHMSIZE} \
			-v ${PWD}:${WORKSPACE} \
			-v ${DATADIR}:${WORKSPACE}/data \
			-v ${WORKDIR}:${WORKSPACE}/work_dirs \
			-w ${WORKSPACE} \
			--ipc=host \
			--network=host \
			--gpus all \
			-e LOCAL_UID=${LOCAL_UID} \
			-e LOCAL_GID=${LOCAL_GID}

docker-build:
	docker build -f docker/Dockerfile -t ${DOCKER_IMAGE} .

docker-start-interactive: docker-build
	docker run ${DOCKER_OPTS} ${DOCKER_IMAGE} bash

docker-start-jupyter: docker-build
	docker run ${DOCKER_OPTS} ${DOCKER_IMAGE} \
		bash -c "jupyter lab --port=8888 --ip=0.0.0.0 --allow-root --no-browser"

docker-run: docker-build
	docker run ${DOCKER_OPTS} ${DOCKER_IMAGE} \
		bash -c "${COMMAND}"
