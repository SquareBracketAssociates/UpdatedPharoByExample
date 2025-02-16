Pay attention this project is old and better read https://github.com/SquareBracketAssociates/PharoByExample9/. You can find a PDF in 
the releases. 

[![Build Status](https://travis-ci.org/SquareBracketAssociates/UpdatedPharoByExample.svg?branch=master)](https://travis-ci.org/SquareBracketAssociates/UpdatedPharoByExample)

## Introduction

*Pharo by Example (vol 1)* is a practical introduction for Pharo, a Smalltalk-inspired programming language, IDE and live coding enviroment. This book is an updated version of [Pharo By Example for Pharo 1.4](https://github.com/SquareBracketAssociates/PharoByExample-english).

This version focuses on the latest stable version of Pharo (Pharo 5.0, at the time of writing).
The most recent version is Pharo by Example 9 available at 

You can find more info and documentation about Pharo at [https://github.com/SquareBracketAssociates/NewPharoByExample9](https://github.com/SquareBracketAssociates/NewPharoByExample9).
[Pharo.org](http://pharo.org/).



## Contributing to Updated Pharo By Example (vol 1)
This book follows the
[fork-and-pull](https://help.github.com/articles/using-pull-requests/#fork--pull)
GitHub workflow for contributions:

1. Fork the repository

2. For each modification, create a quick topic branch named in the form of...

   * initials_ChapterName_my_topic_description

   example: `git checkout -b dz_PharoTour_update_screen_snapshots`

3. Make commits to that branch. When you're ready, make a
    [Pull Request](https://help.github.com/articles/using-pull-requests/#sending-the-pull-request)

4. The request will receive comments/corrections, and will be merged into the
    main repo.

More info about contributing to this book (including Pillar syntax, setting up
LaTeX, etc) can be found in the [CONTRIBUTING.md](CONTRIBUTING.md) file.

Please send any comments, suggestions, or questions to the [pharo-dev](http://lists.pharo.org/mailman/listinfo/pharo-users_lists.pharo.org)
mailing list (see also the [Get Help](http://www.pharo.org/community) section of
[Pharo.org](http://www.pharo.org/)).

## Style Guide

This book is written in Pillar markup. If you are not familiar with it please check the [pillar-documentation](https://github.com/pillar-markup/pillar-documentation).
See also:

* [Documenting your Project with Pillar](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html) chapter of Enterprise Pharo
* [Pillar Syntax Cheat Sheet](http://www.cheatography.com/benjaminvanryseghem/cheat-sheets/pillar/)
* [CONTRIBUTING.md](CONTRIBUTING.md)

### Images
Images (screenshots and diagrams) use Pillar image syntax:

`+`Image caption`>file://figures/`filename`.png|width=80|label=fig:`label`+`

For example:

```
+A stream positioned at its beginning.>file://figures/abcde.png|width=100|label=fig:abcde+
```

* The `width` parameter is required (percentage of the screen).
* Place the files in the `figures` directory of the chapter they are in.
* The label should begin with `fig:`
* When taking screenshots (PNG format), please compress them (you can use
[TinyPNG](https://tinypng.com/) for easy and lossless compression)

To reference an image: `Figure *@fig:abcde*`  (renders to Figure 3.8, for
example).

### Scripts and Code Blocks
For scripts, method definitions and other code blocks:

```
[[[language=smalltalk|caption=Hello World in a Transcript|label=src:helloWorld
	Transcript show: 'hello world'; cr.
]]]
```

Note that the label starts with `src:`.

To reference code blocks, use `Script *@scr:helloWorld*` (similar to Figures).

### Chapter and Section Reference Links

Whenever you refer to other chapters of the book, please use the Pillar internal
link syntax and the chapter name. (The `cha:` in the id is to denote that it's
a chapter, to differentiate from a section id.) For example:

`Chapter *: A Quick Tour of Pharo>../PharoTour/PharoTour.pillar@cha:tour*`

A list of chapter ref link code is provided, to easily copy and paste, in the
Chapter Progress / table of contents above.

### General Style Guidelines
Please keep in mind the following:

* When possible, hard-wrap lines at 80 characters (e.g. `Meta-Q` in Emacs,
    `Cmd-Alt-Q` in Atom). This is a common open-source documentation convention,
    and helps with viewing GitHub-generated diffs.
    However, due to Pillar limitations, ordered and unordered list elements must
    be on a single line to be correctly parsed. Those can be left un-wrapped.
* Only *one* space between sentences.
* Avoid periods in section titles. (For example, this section is titled "Style Guide"
    and not "Style Guide.")
* All inline code mentions (objects, messages, variables, packages) should use the
    Pillar monospace notation: `==Object==`.


## License
This book is licensed under a
[Creative Commons Attribution-ShareAlike 3.0 license](http://creativecommons.org/licenses/by-sa/3.0/).

## Other Books
#### Deep Into Pharo (Pharo By Example vol 2)
[Deep into Pharo](http://www.deepintopharo.com/) ([source code](https://gforge.inria.fr/scm/viewvc.php/PharoByExampleTwo-Eng/?root=pharobooks)) is the second volume of a series of books covering Pharo. Whereas the first volume is intended for newcomers, this second volume covers deeper topics.

#### Enterprise Pharo: A Web Perspective
[Enterprise Pharo: A Web Perspective](http://files.pharo.org/books/enterprisepharo/)
([latest
PDF](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/EnterprisePharo.pdf),
[source code](https://github.com/SquareBracketAssociates/EnterprisePharo))
is the third volume of the series.  It covers enterprise libraries and
frameworks, and in particular those useful for doing web development.
