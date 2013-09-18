#!/bin/bash

VM_INSTALL_URL="http://get.pharo.org/vm"
IMAGE_URL="https://ci.inria.fr/pharo-contribution/job/Pier3BookOnPharo20/lastSuccessfulBuild/artifact/Pier3BookOnPharo20.zip"

usage() {
    cat <<HELP
Usage: $0 [-h|--help] [vm] [image]

Downloads the latest image and virtual machine (edit the script to set from where).  By default, only the image will be downloaded.

image: $IMAGE_URL
   VM: $VM_INSTALL_URL
HELP
}

get_vm() {
    wget ${CERTCHECK} --output-document - "$VM_INSTALL_URL" | bash
}

get_image() {
    local tempzip="$(mktemp imageXXXXX.zip)"
    trap "rm '$tempzip'" EXIT

    wget ${CERTCHECK} --progress=bar:force --output-document="$tempzip" "$IMAGE_URL"
    for f in $(zipinfo -1 "$tempzip"); do
        ext="${f##*.}"
        if [ "$ext" == image -o "$ext" == changes ]; then
            echo "Pharo.$ext"
            unzip -qp  "$tempzip" "$f" > "Pharo.$ext"
        fi
    done
}

# stop the script if a single command fails
set -e

# on mac os wget can be quite old and not recognizing --no-check-certificate
CERTCHECK="--no-check-certificate"
wget --help | grep -- "$CERTCHECK" 2>&1 > /dev/null || CERTCHECK=''


if [ $# -eq 0 ]; then
    get_image
    get_vm
    exit 0
else
    while [ $# -gt 0 ]; do
        case "$1" in
            -h|--help|help)
                usage; exit 0;;
            v|vm)
                get_vm;;
            i|img|image)
                get_image;;
            *) # boom
                usage; exit 1;;
        esac
        shift
    done
fi
