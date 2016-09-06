#!/bin/bash
ansible-playbook --inventory-file=.contiv_k8s_inventory verify.yml -u cloud --private-key=~/hyungsok.key
