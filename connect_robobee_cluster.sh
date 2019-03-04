#!/bin/bash
set -e

#
# Changes the work directory to the script base directory.
#
function changeWorkDir() {
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cd "$DIR"
}

nodes_ssh_port="22"

if [[ $# -gt 0 ]]; then
  nodes_ssh_port="$1"; shift
fi

changeWorkDir

TIME=12h
PRIVATE_KEY="robobee_id_rsa"

HOST=robobee-test
PORT=22
echo "Connect to ${HOST}:${PORT}..."
ssh -f -i ${PRIVATE_KEY} -p ${PORT} -o ControlMaster=auto -o ControlPersist=$TIME -o ControlPath=/tmp/%r@%h:%p robobee@${HOST} sleep $TIME

HOST=robobee-1-test
PORT=$nodes_ssh_port
echo "Connect to ${HOST}:${PORT}..."
ssh -f -F ssh_config -i ${PRIVATE_KEY} -p ${PORT} -o ControlMaster=auto -o ControlPersist=$TIME -o ControlPath=/tmp/%r@%h:%p robobee@${HOST} sleep $TIME

HOST=robobee-2-test
PORT=$nodes_ssh_port
echo "Connect to ${HOST}:${PORT}..."
ssh -f -F ssh_config -i ${PRIVATE_KEY} -p ${PORT} -o ControlMaster=auto -o ControlPersist=$TIME -o ControlPath=/tmp/%r@%h:%p robobee@${HOST} sleep $TIME
