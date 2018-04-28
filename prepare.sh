#!/usr/bin/env bash
#
# prepare.sh - prepare recent versions of Pillar (and Pharo VM) for book
#              compilation.
#

DEPENDENCIES=(wget)

check_dependencies() {
    for app in ${DEPENDENCIES[*]}; do
        if ! type "${app}" &> /dev/null; then
            echo "Cannot find: ${app}"
            echo "Install it to continue..."
            exit 127 # command not found
        fi
    done
}

check_dependencies

wget https://raw.githubusercontent.com/pillar-markup/pillar/master/download.sh
chmod +x download.sh
./download.sh
