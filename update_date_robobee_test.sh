#!/bin/bash
set -x

SSH_HOST="$1"; shift

docker start bind registry apt-cacher-ng

if [ $# -eq 1 ]; then
    IP_ADDRESS=$1; shift
else
    IP_ADDRESS=$(hostname -I|hostname -I|awk 'match($0,/192\.[0-9]+\.[0-9]+\.[0-9]+/) {print substr($0,RSTART,RLENGTH)}')
fi

export DATE=$(date)
export IP_ADDRESS

ssh -i robobee_id_rsa "${SSH_HOST}" sudo bash -s <<EOF
date; echo $DATE; date --set="$DATE"
EOF
