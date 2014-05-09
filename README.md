Updated version of Pharo by Example [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=UpdatedPharoByExample)](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/)
==========================================
This is a test to see if it makes sense to convert PharoByExample into pier format.

I (Stef) have a log here of what I should have a look
	https://docs.google.com/document/d/1lVOTw2d5Bqv_49XPZ9MwUF6zDbsLWf8l7ev2NAgHhhg/edit?usp=drive_web
I pay attention to do it in the frnech and english version in parallel.

So if somebody changes something in the english version please add it to this log

From here down nothing is correct
==========================================


This book is continuously built on an [Inria Jenkins server](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/).

The [engine used](http://www.smalltalkhub.com/#!/~DamienCassou/Pier-Gutemberg) to build PDF and HTML outputs is hosted on
SmalltalkHub.

There is an [Emacs plugin](https://github.com/DamienCassou/pier-cl) to help you write Pier file within Emacs.

Documentation about Pillar can be found [here](https://github.com/DamienCassou/pillar-documentation)

How to
======

You first have to download this project

```bash
# if you have commit access:
git clone git@github.com:SquareBracketAssociates/UpdatedPharoByExample.git
# if you don't
git clone git://github.com/SquareBracketAssociates/UpdatedPharoByExample.git
```

Then you must download the Pharo VM and image

```bash
./download.sh
```

Finally, to build the book

```bash
./compile.sh
```

The `compile.sh` script will only compile the files that are included
from the `PFTE.tex` file. If you write a new chapter, don't forget to
reference it in the `PFTE.tex` file to have it compiled:

```latex
\input{MyChapter/MyChapter.pier.tex}
```

You can also compile just one chapter by doing:

```bash
./compile.sh DSL/DSL.pier
```

Samples
=======

Besides the pier files that can be found in this repository more examples can be also found in [ Pharo for the Enterprise](https://github.com/SquareBracketAssociates/PharoForTheEnterprise-english)
