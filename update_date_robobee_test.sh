#!/bin/bash
set -x

docker start bind registry apt-cacher-ng

if [ $# -eq 1 ]; then
    IP_ADDRESS=$1; shift
else
    IP_ADDRESS=$(hostname -I|awk '{match($2,"192\\.[0-9]+\\.[0-9]+\\.[0-9]+",a)}END{print a[0]}')
fi

export DATE=$(date)
export IP_ADDRESS

ssh -i robobee_id_rsa robobee@robobee-test sudo bash -s <<EOF
date; echo $DATE; date --set="$DATE"
sed -ri 's:[0-9]+.[0-9]+.[0-9]+.[0-9]+:$IP_ADDRESS:g' /etc/apt/apt.conf.d/01proxy
EOF
