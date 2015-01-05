#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

PILLAR_COMMAND="./pillar"

if hash "pillar" 2>/dev/null; then
  PILLAR_COMMAND="pillar"
fi

rm -fr .DS_Store Pharo.changes Pharo.image pharo-vm pharo-ui vm.sh vm-ui.sh pharo pillar package-cache stderr stdout book-result texput.log

for chapter in `$PILLAR_COMMAND show inputFiles`; do
	dir=$(dirname $chapter)
	# cd "${dir}"
	rm -vf ${dir}/*.{aux,glo,idx,log,out,toc,url,synctex.gz,pier.pdf,pier.md,pier.tex,pier.html,pillar.pdf,pillar.md,pillar.tex,pillar.html,~}
	# cd ..
done