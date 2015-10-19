#!/usr/bin/env bash

set -e

rm -rf book-result
./pillar export --to="HTML by chapter" $1
