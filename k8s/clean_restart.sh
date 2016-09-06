#!/bin/bash
# contiv fwd mode - bridge or routing
: ${contivFwdMode:=bridge}
: ${contiv_bin_path:=$PWD/contiv_bin}
ansible-playbook --inventory-file=.contiv_k8s_inventory admin.yml --tags="stop_contiv,erase_state,upgrade,start_netmaster,config_netmaster,start_all" -e "contiv_bin_path=$contiv_bin_path contiv_fwd_mode=$contivFwdMode" -u cloud --private-key=~/hyungsok.key
