#!/usr/bin/env bash

set -e

rm -rf book-result
./pillar export --to="LaTeX by chapter" $1
bash pillarPostExport.sh
