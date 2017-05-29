#!/bin/bash
set -x

docker start bind registry apt-cacher-ng

export DATE=$(date); export IP_ADDRESS=$(hostname -I|awk '{match($2,"192\\.[0-9]+\\.[0-9]+\\.[0-9]+",a)}END{print a[0]}'); ssh -i robobee_id_rsa robobee@robobee-test sudo bash -s <<EOF
date; echo $DATE; date --set="$DATE"
sed -ri 's:[0-9]+.[0-9]+.[0-9]+.[0-9]+:$IP_ADDRESS:g' /etc/apt/apt.conf.d/80proxy
EOF
