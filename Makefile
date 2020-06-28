SHELL=/bin/bash -O extglob -c

.PHONY: docker

# build and run development docker container
docker:
	scripts/docker_build.sh
	scripts/docker_run.sh
