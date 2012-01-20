#!/bin/bash

if [[ -z "$PS1" ]]; then
    return
fi

# Fallback to .bashrc --------------------------------------------------------
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi
