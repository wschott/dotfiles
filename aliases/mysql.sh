#!/bin/bash

# MySQL ----------------------------------------------------------------------
export PATH="/usr/local/mysql/bin:$PATH"

alias start_mysql='sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias stop_mysql='sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
