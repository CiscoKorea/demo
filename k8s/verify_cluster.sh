#!/bin/bash
USAGE="verify_cluster.sh <ssh_username>"
if [ $# -lt 1 ]; then
    echo $USAGE
    exit 1
fi

username=$1

ansible-playbook --inventory-file=.contiv_k8s_inventory verify.yml --private-key=~/$username.key -u $username  
