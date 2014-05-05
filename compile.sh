#!/bin/bash

# This script is meant for the EnterprisePharo book. You can use it for other projects

# Exit immediately if a command exits with a non-zero status
set -e

function pillar_all() {
    ./pillar export --to='LaTeX whole book'
    ./pillar export --to='LaTeX by chapter'
    ./pillar export --to='HTML by chapter'
    ./pillar export --to='Markdown by chapter'
}

function pillar_one() {
    input="$1"
    ./pillar export --to='LaTeX whole book' "$input"
    ./pillar export --to='LaTeX by chapter' "$input"
    ./pillar export --to='HTML by chapter' "$input"
    ./pillar export --to='Markdown by chapter' "$input"
}

function mypdflatex() {
    pier_file="$1"

    echo "Compiling PDF..."
    pdflatex -halt-on-error -file-line-error -interaction batchmode "$pier_file" 2>&1 1>/dev/null
    ret=$?
    if [[ $ret -ne 0 ]]; then
        cat $pier_file.log
        echo "Can't generate the PDF!"
        exit 1
    fi
}

function produce_pdf() {
    dir="$1"
    pier_file="$2"

    cd "$dir"         # e.g., cd Zinc/
    mypdflatex "$pier_file" && mypdflatex "$pier_file"
    cd ..
}

function compile_chapters() {
    chapters=$(./pillar show inputFiles 2>/dev/null)

    for chapter in $chapters; do
        echo =========================================================
        echo COMPILING $chapter
        echo =========================================================

        # e.g., chapter = Zinc/Zinc.pier

        pier_file=$(basename $chapter) # e.g., Zinc.pier
        dir=$(dirname $chapter) # e.g., Zinc

        produce_pdf "${dir}" "${pier_file}"
    done
}

function compile_latex_book() {
       echo =========================================================
       echo COMPILING Book
       echo =========================================================

       produce_pdf . PharoByExample
}

if [[ $# -eq 1 ]]; then
    dir=$(dirname "$1") # e.g., Zinc
    pier_file=$(basename "$1") # e.g., Zinc.pier
    pillar_one "$1"
    produce_pdf "${dir}" "${pier_file}"
else
    pillar_all
    compile_chapters
    compile_latex_book
fi
