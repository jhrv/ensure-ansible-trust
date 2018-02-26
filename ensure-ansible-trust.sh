#!/bin/bash

INVENTORY=${1}
USER=${2}

for HOST in $(ansible all -i ${INVENTORY} --list-hosts | tail -n+2 | tr -d " "); do
	ssh-copy-id ${USER}@${HOST}
done
