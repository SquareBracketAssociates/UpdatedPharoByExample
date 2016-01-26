#!/usr/bin/env bash

VM_INSTALL_URL="http://get.pharo.org/vm"
IMAGE_URL="https://ci.inria.fr/pharo-contribution/job/Pillar/PHARO=40,VERSION=development,VM=vm/lastSuccessfulBuild/artifact/Pillar.zip"
PHARO_VM=${PHARO_VM:-./pharo}

usage() {
    cat <<HELP
Usage: $0 [-h|--help] [vm] [image]

Downloads the latest image and virtual machine (edit the script to set from where).  By default, only the image will be downloaded.

image: $IMAGE_URL
   VM: $VM_INSTALL_URL
HELP
}

get_vm() {
    if [ -d pharo-vm ]; then
        rm -rf pharo-vm
    fi
    wget ${CERTCHECK} --output-document - "$VM_INSTALL_URL" | bash
}

get_image() {
    local tempzip="$(mktemp imageXXXXX.zip)"
    trap "rm '$tempzip'" EXIT

    wget ${CERTCHECK} --progress=bar:force --output-document="$tempzip" "$IMAGE_URL"
    for f in $(zipinfo -1 "$tempzip"); do
        ext="${f##*.}"
        file=$(basename $f)
        if [ "$ext" == image -o "$ext" == changes ]; then
            echo "Pharo.$ext"
            unzip -qp  "$tempzip" "$f" > "Pharo.$ext"
        elif [ $(basename $f) == "pillar" ]; then
            echo pillar
            unzip -qp  "$tempzip" "$f" > "pillar"
            chmod +x pillar
        fi
    done
}
prepare_image() {
    ${PHARO_VM} Pharo.image --no-default-preferences eval --save "StartupPreferencesLoader allowStartupScript: false."
    ${PHARO_VM} Pharo.image eval --save "Deprecation raiseWarning: false; showWarning: false. 'ok'"
}

# stop the script if a single command fails
set -e

# on mac os wget can be quite old and not recognizing --no-check-certificate
CERTCHECK="--no-check-certificate"
wget --help | grep -- "$CERTCHECK" 2>&1 > /dev/null || CERTCHECK=''

should_prepare_image=0

if [ $# -eq 0 ]; then
    get_image
    get_vm
    should_prepare_image=1
else
    while [ $# -gt 0 ]; do
        case "$1" in
            -h|--help|help)
                usage; exit 0;;
            v|vm)
                get_vm;;
            i|img|image)
                get_image;
                should_prepare_image=1;;
            *) # boom
                usage; exit 1;;
        esac
        shift
    done
fi

if [[ $should_prepare_image -eq 1 ]]; then
    echo Preparing Pillar image
    prepare_image
fi
