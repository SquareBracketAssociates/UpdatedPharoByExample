Pillar Book Skeleton [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=UpdatedPharoByExample)](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/) [![Build Status](https://travis-ci.org/SquareBracketAssociates/UpdatedPharoByExample.svg?branch=master)](https://travis-ci.org/SquareBracketAssociates/UpdatedPharoByExample)
====================

This is a test to see if it makes sense to convert PharoByExample into pier format.

I (Stef) have a log here of what I should have a look
	https://docs.google.com/document/d/1lVOTw2d5Bqv_49XPZ9MwUF6zDbsLWf8l7ev2NAgHhhg/edit?usp=drive_web
I pay attention to do it in the frnech and english version in parallel.

So if somebody changes something in the english version please add it to this log

This book is continuously built on an [Inria Jenkins server](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/).


How to write a book
-------------------

This book is written in Pillar markup. If you are not familiar with it please check the [pillar-documentation](https://github.com/pillar-markup/pillar-documentation).

###Generating the book

First of all you have to run `./download.sh` to obtain the Pillar executable that does all the job.

To generate your book execute `./compile.sh`. If you want to generate only one chapter, pass the file's path to the script: `./compile.sh Example/Example.pillar`. If you have `pdflatex` installed and available in your system's `PATH`, the script will also generate pdf files.

###Adding a chapter

To add a chapter create a directory for it (named, e.g., `Example`) and put there a `.pillar` file (named, e.g., `Example.pillar`) which will contain the chapter itself. Put images in the `figures` subdirectory of the new chapter directory.

Add your chapter to:

* `pillar.conf` in the `inputFiles` array as: `"Example/Example.pillar"`, and
* `_support/templates/book.latex.template` in `\graphicspath` as `{Example/}`

###Caveats

* You must neither use spaces nor underscores (`_`) in file names.

Tools
-----

There are mods/bundles/packages for text editors, that provide improvements for pillar files editing:

* Emacs: [pillar-mode](https://github.com/pillar-markup/pillar-mode)
* Vim: [vim-pillar](https://github.com/cdlm/vim-pillar)
* TextMate: [Pillar.tmbundle](https://github.com/pillar-markup/Pillar.tmbundle)
* ATOM: [language-pillar](https://github.com/pillar-markup/language-pillar)
