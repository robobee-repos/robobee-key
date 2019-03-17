#!/bin/bash
set -x

#
# Changes the work directory to the script base directory.
#
function changeWorkDir() {
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cd "$DIR"
}

SSH_HOST="$1"; shift

nodes_ssh_port="22222"

if [[ $# -gt 0 ]]; then
  nodes_ssh_port="$1"; shift
fi

changeWorkDir


export DATE=$(date -Ins)
HOST=robobee-test
PORT=22
echo "Connect to ${HOST}:${PORT}..."
ssh -f -p ${PORT} -o ControlPath=/tmp/%r@%h:%p robobee@${HOST} sudo bash -s <<EOF
date; echo $DATE; date --set="$DATE"
EOF

export DATE=$(date -Ins)
HOST=robobee-1-test
PORT=$nodes_ssh_port
echo "Connect to ${HOST}:${PORT}..."
ssh -f -p ${PORT} -o ControlPath=/tmp/%r@%h:%p robobee@${HOST} sudo bash -s <<EOF
date; echo $DATE; date --set="$DATE"
EOF

export DATE=$(date -Ins)
HOST=robobee-2-test
PORT=$nodes_ssh_port
echo "Connect to ${HOST}:${PORT}..."
ssh -f -p ${PORT} -o ControlPath=/tmp/%r@%h:%p robobee@${HOST} sudo bash -s <<EOF
date; echo $DATE; date --set="$DATE"
EOF
