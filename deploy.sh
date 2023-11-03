#!/usr/bin/env bash

# Deploy a release of the Bactgen training app.

# check args count
if [ $# -ne 2 ]; then
  echo "Usage: $0 <remote user> <deployment host address>"
  exit 1
fi

REMOTE_USER=$1
REMOTE_HOST=$2

echo "Copying docker-deploy.sh to ${REMOTE_USER}@${REMOTE_HOST}"
scp -o ControlPath=%C docker_deploy.sh $REMOTE_USER@$REMOTE_HOST:~/docker_deploy.sh


# Replace the running version
ssh -o ControlMaster=yes \
    -o ControlPersist=yes \
    -o ControlPath=%C $REMOTE_USER@$REMOTE_HOST << EOF

    echo "Setting file permissions on server"
    chmod +x docker_deploy.sh
    chmod go-rwx docker_deploy.sh
EOF

# close the connection
ssh -o ControlPath=%C -O exit $REMOTE_USER@$REMOTE_HOST

echo "Done."
