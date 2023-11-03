#!/usr/bin/env bash

# Deploy a release of the Bactgen training app.

# check args count
if [ $# -lt 2 ]; then
  echo "Usage: $0 <version> <docker user>"
  exit 1
fi

# if executed by ssh the script name may appear as first arg: ignore it
if [[ "$1" =~ $(basename $0) ]]; then
  shift
fi

VERSION=$1
DOCKER_USER=$2

APP=bactgen-training-app
IMAGE_URL=${DOCKER_USER}/${APP}
EXPOSED_PORT=8000

# Replace the running version

echo "Stopping running ${APP} docker container..."
docker stop ${APP}
docker rm ${APP}
echo "Container stopped"

docker pull ${IMAGE_URL}:${VERSION}
if [[ $? -eq 0 ]]
then
    echo "Starting ${APP}..."
    docker run -d -p ${EXPOSED_PORT}:80 -p 80:80 --name ${APP} --security-opt=no-new-privileges:true --cap-drop=ALL --cap-add=CHOWN --cap-add=NET_BIND_SERVICE --cap-add=SETUID --cap-add=SETGID --cap-add=FOWNER --restart=unless-stopped ${IMAGE_URL}:${VERSION}
    if [[ $? -ne 0 ]]
    then
    echo "ERROR: Failed to start ${APP} docker container"
    fi
else
    echo "ERROR: Failed to pull specified ${APP} image version"
fi

echo "Done."
