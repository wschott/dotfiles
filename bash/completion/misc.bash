#!/bin/bash

complete -cf sudo                   # sudo
complete -c command type which      # command, type and which


# SSH Completion of Remote Hosts ---------------------------------------------
SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | egrep -v [0123456789]) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh
