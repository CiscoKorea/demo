#!/bin/bash
# contiv fwd mode - bridge or routing
: ${contivFwdMode:=bridge}
: ${contiv_bin_path:=$PWD/contiv_bin}

USAGE="clean_restart.sh <ssh_username>"
if [ $# -lt 1 ]; then
    echo $USAGE
    exit 1
fi

username=$1

ansible-playbook --inventory-file=.contiv_k8s_inventory admin.yml --tags="stop_contiv,erase_state,upgrade,start_netmaster,config_netmaster,start_all" -e "contiv_bin_path=$contiv_bin_path contiv_fwd_mode=$contivFwdMode" -u $username --private-key=~/$username.key
