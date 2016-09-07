#!/bin/bash

USAGE="prepare.sh <ssh_username>"
if [ $# -lt 1 ]; then
    echo $USAGE
    exit 1
fi

username=$1
top_dir=$PWD

# generate inventory
./parse_cluster.py $username

# run ansible
ansible-playbook -i .contiv_k8s_inventory $top_dir/prepare.yml --skip-tags "docker_mnt_fix,ssh_key" -u $username --private-key=~/$username.key
