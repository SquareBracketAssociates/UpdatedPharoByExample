Pillar Book Skeleton
====================
This is a skeleton that can be used as a starting place to write your book. For now on this it is being used by [PharoForTheEnterprise](https://github.com/SquareBracketAssociates/PharoForTheEnterprise-english) and [UpdatedPharoByExample](https://github.com/SquareBracketAssociates/UpdatedPharoByExample) books.

_You should replace this intro and first two sections with a nice information about your book :)_

What is Skeleton
----------------
Pillar Book Skeleton provides a predefined structure for source files, as well as usefull scripts to write books with a [Pillar markup](https://github.com/pillar-markup).

How to use Skeleton
-------------------
* Fork this repository, and start writing your book (explained in next section).
* Customise `pillar.conf` with your book's title.
* Add this repository as a remote:
      git remote add skeleton https://github.com/pillar-markup/book-skeleton.git
* Then you want to get updates from this repository execute:
      git pull skeleton master
  yes, you'll have to resolve conflicts if updates occurred in the lines that you've changed.

###CI suggestions
Generally on CI you only have to run:

    ./download.sh
    ./compile.sh

Artefacts to publish:

    Book.pdf, Book.tex, **/*.pillar, **/*.pillar.tex, **/*.pillar.pdf, **/*.pillar.html,  **/*.pillar.md, **/figures/*, html/**

<!--- SKELETON-SPECIFIC DATA ENDS HERE --->

How to write a book
-------------------
This book is written in Pillar markup. If you are not familiar with it please check the [pillar-documentation](https://github.com/DamienCassou/pillar-documentation).

###Generating book
First of all you have to run `./download.sh` to obtain Pharo vm and Pillar image that does all the job.

To generate whole book execute `./compile.sh`. If you want to generate only one chapter, pass the file's path to the script: `./compile.sh Example/Example.pillar`. If you have `pdflatex` installed and available in your system's PATH, the script will also generate pdf files.

###Adding a chapter
To add a chapter create a directory for it and put there a `.pillar` file which will be the capter itself. Put images in `figures` subdirectory of your chapter.

Add your chapter to:
* `pillar.conf` in `inputFiles` array as: `"Example/Example.pillar"`.
* `_support/templates/book.latex.template` in `\graphicspath` as `{Example/}`

###Caveats
* You must neither use spaces nor underscores (`_`) in the file names.

Tools
-----
There are mods/bundles/packages for text editors, that provide improvements for pillar files editing:

Emacs: [pillar-mode](https://github.com/DamienCassou/pillar-mode)
Vim: [vim-pillar](https://github.com/cdlm/vim-pillar)
TextMate: [Pillar.tmbundle](https://github.com/pillar-markup/Pillar.tmbundle)
ATOM: [language-pillar](https://github.com/pillar-markup/language-pillar)
