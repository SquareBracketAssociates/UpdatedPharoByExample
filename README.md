Pillar Book Skeleton [![Build Status](https://travis-ci.org/pillar-markup/book-skeleton.svg?branch=master)](https://travis-ci.org/pillar-markup/book-skeleton)
====================

This is a skeleton that can be used as a starting place to write your book. For now on this it is being used by [PharoForTheEnterprise](https://github.com/SquareBracketAssociates/PharoForTheEnterprise-english) and [UpdatedPharoByExample](https://github.com/SquareBracketAssociates/UpdatedPharoByExample) books.

_You should replace this intro and first two sections with a nice information about your book :)_

What is Skeleton
----------------
Pillar Book Skeleton provides a predefined structure for source files, as well as usefull scripts to write books with [Pillar markup](https://github.com/pillar-markup).

How to use Skeleton
-------------------

* Fork this repository, and start writing your book (explained in the next section).
* Customise `pillar.conf` with your book's title.
* Add this repository as a remote:

  ```shell
  git remote add skeleton https://github.com/pillar-markup/book-skeleton.git
  ```

* Then you want to get updates from this repository execute:

  ```shell
  git pull skeleton master
  ```

  You will have to resolve conflicts if updates occurred in the lines that you've changed.

### Continuous Integration suggestions

If you want your book to be built automatically (e.g., by [Jenkins](http://jenkins-ci.org/)), you have to configure the job to execute these lines:

    ./download.sh
    ./compile.sh

and then to archive these artefacts:

    Book.pdf, Book.tex, **/*.pillar, **/*.pillar.tex, **/*.pillar.pdf, **/*.pillar.html,  **/*.pillar.md, **/figures/*, html/**

Also Skeleton comes with [Travis CI](https://travis-ci.org) configuration file. This allows you to start automated testing of your book just by enabling it on Travis CI service. Finally you can follow [Sharing Travis-CI generated files](http://sleepycoders.blogspot.com/2013/03/sharing-travis-ci-generated-files.html) tutorial, to hack GitHub and Travis into storing your artefacts.

<!--- SKELETON-SPECIFIC DATA ENDS HERE --->


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
