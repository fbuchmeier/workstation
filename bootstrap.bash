#!/bin/bash -e

function log() {
    echo $(date +%F): "$@"
}

if [ $(id -u) -ne 0 ] ; then
    log "This script must be run as root, you are runnig it as:"
    log "$(id)"
    exit 1
fi

apt-get update
apt-get install -y \
    vim \
    python-pip \
    python3 \
    python-setuptools \
    python3-setuptools

pip2 install -r requirements.txt

log "Creating default ansible hosts"
mkdir -p /etc/ansible
echo "localhost" > /etc/ansible/hosts
