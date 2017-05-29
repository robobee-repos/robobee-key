#!/bin/bash
set -x

docker start bind registry apt-cacher-ng

export DATE=$(date); export IP_ADDRESS=$(hostname -I|cut -d' ' -f1); ssh -i robobee_id_rsa robobee@robobee-test sudo bash -s <<EOF
date; echo $DATE; date --set="$DATE"
sed -ri "s:192.168.178.[0-9]+:$IP_ADDRESS:g" /etc/resolv.conf
sed -ri 's:192.168.178.[0-9]+:$IP_ADDRESS:g' /etc/dhcp/dhclient.conf
sed -ri 's:192.168.178.[0-9]+:$IP_ADDRESS:g' /etc/apt/apt.conf.d/01proxy
EOF
