#!/usr/bin/env bash

set -e

cd book-result
cp ../UpdatedPharoByExample.tex .
../gitinfo2.sh > gitHeadLocal.gin
texfot latexmk UpdatedPharoByExample
