#!/bin/bash
cd $2
for file in $1.*; do target=${file#$1.}; mv $file Ibook/$target; done
cd ..
