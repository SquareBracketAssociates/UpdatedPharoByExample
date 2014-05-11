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
  pillar_file="$1"

  echo "Compiling PDF..."
  pdflatex -halt-on-error -file-line-error -interaction batchmode "$pillar_file" 2>&1 1>/dev/null
  ret=$?
  if [[ $ret -ne 0 ]]; then
    cat $pillar_file.log
    echo "Can't generate the PDF!"
    exit 1
  fi
}

function produce_pdf() {
  if hash foobar 2>/dev/null; then
    echo hello
    return
  fi

  dir="$1"
  pillar_file="$2"

  cd "$dir"         # e.g., cd Zinc/
  mypdflatex "$pillar_file" && mypdflatex "$pillar_file"
  cd ..
}

function compile_chapters() {
  chapters=$(./pillar show inputFiles 2>/dev/null)

  for chapter in $chapters; do
    echo =========================================================
    echo COMPILING $chapter
    echo =========================================================

    # e.g., chapter = Zinc/Zinc.pillar

    pillar_file=$(basename $chapter) # e.g., Zinc.pillar
    dir=$(dirname $chapter) # e.g., Zinc

    produce_pdf "${dir}" "${pillar_file}"
  done
}

function compile_latex_book() {
  echo =========================================================
  echo COMPILING Book
  echo =========================================================

  produce_pdf . PharoByExample
}

function latex_enabled() {
  hash pdflatex 2>/dev/null
}

if [[ $# -eq 1 ]]; then
  echo "Generating files based on $1"
  dir=$(dirname "$1") # e.g., Zinc
  pillar_file=$(basename "$1") # e.g., Zinc.pillar
  pillar_one "$1"
  if latex_enabled; then
    produce_pdf "${dir}" "${pillar_file}"
  fi
else
  echo 'Generating files for all chapters'
  pillar_all
  if latex_enabled; then
    compile_chapters
    compile_latex_book
  fi
fi
echo 'Done'
