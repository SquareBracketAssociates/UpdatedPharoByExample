## Introduction

*Pharo by Example (vol 1)* is a practical introduction for Pharo, a Smalltalk-inspired programming language, IDE and live coding enviroment. This book is an updated version of [Pharo By Example for Pharo 1.4](https://github.com/SquareBracketAssociates/PharoByExample-english).

This version focuses on the latest stable version of Pharo (Pharo 4, at the time of writing).

You can find more info and documentation about Pharo at [Pharo.org](http://pharo.org/).

#### Chapter Progress

Chapter | Status | Latest
:-------|:-------|:------
**[Preface](Preface/)** | Revised, copyedited | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Preface/Preface.pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Preface/Preface.pillar.pdf)
1 - [Pharo Tour](PharoTour) | Needs revision (from 3.0 to 4.0) | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/PharoTour/PharoTour.pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/PharoTour/PharoTour.pillar.pdf)
2 - [A First Application](FirstApplication/) | Needs revision | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/FirstApplication/FirstApplication.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/FirstApplication/FirstApplication.pier.pdf)
3 - **[Syntax in a Nutshell](SyntaxNutshell/)** | Revised | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/SyntaxNutshell/SyntaxNutshell.pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/SyntaxNutshell/SyntaxNutshell.pillar.pdf)
4 - **[Understanding Messages](UnderstandingMessage/)** | Revised | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/UnderstandingMessage/UnderstandingMessage.pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/UnderstandingMessage/UnderstandingMessage.pillar.pdf)
5 - [The Smalltalk Object Model](SmalltalkObjectModel/) | In Progress | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/SmalltalkObjectModel/SmalltalkObjectModel.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/SmalltalkObjectModel/SmalltalkObjectModel.pier.pdf)
6 - Environment | ? |
7 - **[SUnit](SUnit/)** | Revised | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/SUnit/SUnit.pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/SUnit/SUnit.pillar.pdf)
8 - [Basic Classes](BasicClasses/) | Needs revision | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/BasicClasses/BasicClasses.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/BasicClasses/BasicClasses.pier.pdf)
9 - [Collections](Collections/) | Needs revision | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Collections/Collections.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Collections/Collections.pier.pdf)
10 - **[Streams](Streams/)** | Revised | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Streams/Streams.pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Streams/Streams.pillar.pdf)
11 - [Morphic](Morphic/) | Needs revision | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Morphic/Morphic.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Morphic/Morphic.pier.pdf)
12 - [Seaside](Seaside/) | Needs revision | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Seaside/Seaside.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Seaside/Seaside.pier.pdf)
13 - **[Metaclasses](Metaclasses/)** | Revised | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Metaclasses/Metaclasses.pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Metaclasses/Metaclasses.pillar.pdf)
14 - [Reflection](Reflection/) | Needs revision | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Reflection/Reflection.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Reflection/Reflection.pier.pdf)
15 - [Regular Expressions](Regex/) | Needs revision | [html](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Regex/Regex.pier.html) [pdf](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/Regex/Regex.pier.pdf)

## Contributing to Updated Pharo By Example (vol 1)
This book follows the
[fork-and-pull](https://help.github.com/articles/using-pull-requests/#fork--pull)
GitHub workflow for contributions:

1. Fork the repository
2. For each addition, create a quick branch, prefixed with your initials. For
    example: `git checkout -b dz_streams_syntax_fix`
3. Make commits to that branch. When you're ready, make a
    [Pull Request](https://help.github.com/articles/using-pull-requests/#sending-the-pull-request)
4. The request will receive comments/corrections, and will be merged into the
    main repo.

More info about contributing to this book (including Pillar syntax, setting up
LaTeX, etc) can be found in the [CONTRIBUTING.md](CONTRIBUTING.md) file.

Please send any comments, suggestions, or questions to the [pharo-dev](http://lists.pharo.org/mailman/listinfo/pharo-users_lists.pharo.org) mailing list (see also the [Get Help](http://www.pharo.org/community) section of [Pharo.org](http://www.pharo.org/)).

### Style Guide
Please keep in mind the following:

* When possible, hard-wrap lines at 80 characters (e.g. `Meta-Q` in Emacs,
    `Cmd-Alt-Q` in Atom). This is a common open-source documentation convention,
    and helps with viewing GitHub-generated diffs.
    However, due to Pillar limitations, ordered and unordered list elements must
    be on a single line to be correctly parsed. Those can be left un-wrapped.
* Only *one* space between sentences.
* Avoid periods in section titles. (For example, this section is titled "Style Guide"
    and not "Style Guide.")

## Latest Builds

The latest versions of *Updated Pharo by Example* can be found at the following sites:

* Jenkins ![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=UpdatedPharoByExample)
    Latest PDF: [UpdatedPharoByExample.pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/book-result/UpdatedPharoByExample.pdf). All Chapters: [UpdatedPharoByExample build artifacts](https://ci.inria.fr/pharo-contribution/job/UpdatedPharoByExample/lastSuccessfulBuild/artifact/)
* Travis ![Build Status](https://travis-ci.org/SquareBracketAssociates/UpdatedPharoByExample.svg?branch=master)(https://travis-ci.org/SquareBracketAssociates/UpdatedPharoByExample)

## Other Books
#### Deep Into Pharo (Pharo By Example vol 2)
[Deep into Pharo](http://www.deepintopharo.com/) ([source code](https://gforge.inria.fr/scm/viewvc.php/PharoByExampleTwo-Eng/?root=pharobooks)) is the second volume of a series of books covering Pharo. Whereas the first volume is intended for newcomers, this second volume covers deeper topics.

#### Enterprise Pharo
[Enterprise Pharo](https://github.com/SquareBracketAssociates/EnterprisePharo) ([latest PDF](https://ci.inria.fr/pharo-contribution/job/PharoForTheEnterprise/lastSuccessfulBuild/artifact/EnterprisePharo.pdf)) is a new book that describes Enterprise-related libraries for Pharo.
