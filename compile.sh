#!/usr/bin/env bash

# This script is meant for the EnterprisePharo book. You can use it for other projects

# Exit immediately if a command exits with a non-zero status
set -e

LATEX_COMPILER="pdflatex"
# LATEX_COMPILER="lualatex"

PILLAR_COMMAND="./pillar"

if hash "pillar" 2>/dev/null; then
  PILLAR_COMMAND="pillar"
fi

function pillar_all() {
  $PILLAR_COMMAND export --to='LaTeX whole book'
  $PILLAR_COMMAND export --to='LaTeX by chapter'
  $PILLAR_COMMAND export --to='HTML by chapter'
  $PILLAR_COMMAND export --to='Markdown by chapter'
}

function pillar_one() {
  input="$1"
  $PILLAR_COMMAND export --to='LaTeX by chapter' "$input"
  $PILLAR_COMMAND export --to='HTML by chapter' "$input"
  $PILLAR_COMMAND export --to='Markdown by chapter' "$input"
}

function mypdflatex() {
  pillar_file="$1"
  basename=${pillar_file%.*}

  echo "Compiling PDF from $pillar_file..."
  ${LATEX_COMPILER} -halt-on-error -file-line-error -interaction batchmode "$basename" 2>&1 1>/dev/null
  ret=$?
  if [[ $ret -ne 0 ]]; then
    cat $basename.log
    echo "Can't generate the PDF!"
    exit 1
  fi
}

function produce_pdf() {
  dir="$1"
  pillar_file="$2"

  cd "$dir"         # e.g., cd Zinc/
  mypdflatex "$pillar_file" && mypdflatex "$pillar_file"
  cd ..
}

function compile_chapters() {
  chapters=$($PILLAR_COMMAND show inputFiles 2>/dev/null)

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
  cd book-result
  produce_pdf . *.tex
}

function latex_enabled() {
  hash ${LATEX_COMPILER} 2>/dev/null
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
  mkdir -p book-result
  pillar_all
  if latex_enabled; then
    compile_chapters
    compile_latex_book
  fi
fi
echo 'Done'
