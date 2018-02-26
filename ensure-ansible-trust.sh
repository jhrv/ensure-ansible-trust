#!/bin/bash

function ensure-ansible-trust {
	if [[ "${#}" -eq 0 || "${1}" == "-h" || "${1}" == "--help" ]]; then
        cat <<EOF 
ensure-ansible-trust

Usage: ensure-ansible-trust [-h | --help] inventory-file username 

Ensure ssh-trust with all hosts in provided inventory file with username

  -h --help    print this message

EOF
		return
    fi

    INVENTORY=${1}
    USER=${2}
    
    for HOST in $(ansible all -i ${INVENTORY} --list-hosts | tail -n+2 | tr -d " "); do
    	ssh-copy-id ${USER}@${HOST}
    done
}
