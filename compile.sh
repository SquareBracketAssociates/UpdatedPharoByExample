#!/usr/bin/env bash

set -e

rm -rf book-result
./pillar export
bash pillarPostExport.sh
