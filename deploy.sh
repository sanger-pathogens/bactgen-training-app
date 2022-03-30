#!/usr/bin/env bash

# Deploy a release of the Bactgen training app.

# check args count
if [ $# -ne 4 ]; then
  echo "Usage: $0 <version> <remote user> <deployment host address> <docker user>"
  exit 1
fi

VERSION=$1
REMOTE_USER=$2
REMOTE_HOST=$3
APP=bactgen-training-app
DOCKER_USER=$4
IMAGE_URL=${DOCKER_USER}/${APP}
EXPOSED_PORT=8000

# Replace the running version
ssh -o ControlMaster=yes \
    -o ControlPersist=yes \
    -o ControlPath=%C $REMOTE_USER@$REMOTE_HOST << EOF

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
EOF

# close the connection
ssh -o ControlPath=%C -O exit $REMOTE_USER@$REMOTE_HOST
