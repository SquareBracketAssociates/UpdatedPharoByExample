This is a test to see if it makes sense to convert PharoByExample into pier format.

I (Stef) have a log here of what I should have a look
	https://docs.google.com/document/d/1lVOTw2d5Bqv_49XPZ9MwUF6zDbsLWf8l7ev2NAgHhhg/edit?usp=drive_web
I pay attention to do it in the frnech and english version in parallel.

So if somebody changes something in the english version please add it to this log

This book is continuously built on an [Inria Jenkins server](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/).


How to write a book
-------------------

This book is written in Pillar markup. If you are not familiar with it please check the [pillar-documentation](https://github.com/pillar-markup/pillar-documentation).
See also:

* [Documenting your Project with Pillar](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/PillarChap/Pillar.pillar.html) chapter of Enterprise Pharo
* [Pillar Syntax Cheat Sheet](http://www.cheatography.com/benjaminvanryseghem/cheat-sheets/pillar/)

###Generating the book

First of all you have to run `./download.sh` to obtain the Pillar executable
that does all the job.

To generate your book execute `./compile.sh`. If you want to generate only one
chapter, pass the file's path to the script: `./compile.sh
Example/Example.pillar`. If you have `pdflatex` installed and available in your
system's `PATH`, the script will also generate pdf files.

#### Installing `pdflatex` on Mac OS X
If you're on a recent Mac OS X version, you will need to do the following:

1. Download and install
    [MacTeX](http://tug.org/mactex/) (the 2.4Gb **MacTeX.pkg** file)
2. Manually ensure that `pdftex` (and other LaTeX-related binaries) are in your
    system PATH. If, after installing the .pkg, the command `which pdftex` yields
    an empty result, run the following in your terminal:

    ```bash
    echo /usr/texbin > TeX
    sudo mv TeX /etc/paths.d
    ```

###Adding a chapter

To add a chapter create a directory for it (named, e.g., `Example`) and put
there a `.pillar` file (named, e.g., `Example.pillar`) which will contain the
chapter itself. Put images in the `figures` subdirectory of the new chapter
directory.

Add your chapter to:

* `pillar.conf` in the `inputFiles` array as: `"Example/Example.pillar"`, and
* `_support/templates/book.latex.template` in `\graphicspath` as `{Example/}`

###Caveats

* You must neither use spaces nor underscores (`_`) in file names.

Tools
-----

There are mods/bundles/packages for text editors, that provide improvements for
pillar files editing:

* Emacs: [pillar-mode](https://github.com/pillar-markup/pillar-mode)
* Vim: [vim-pillar](https://github.com/cdlm/vim-pillar)
* TextMate: [Pillar.tmbundle](https://github.com/pillar-markup/Pillar.tmbundle)
* ATOM: [language-pillar](https://github.com/pillar-markup/language-pillar)
