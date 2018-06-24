SBAbook — A LaTeX class for technical books
===========================================

This is a set of layout, typography, and markup definitions for LaTeX books based on the [memoir][] document class.
It is intended for use by [Square Bracket Associates (SBA)][sba], and heavily customized in this direction — by this I mean it's made to setup specific semantic markup and typographic style, rather than to be flexible.

[![Build Status](https://travis-ci.org/cdlm/sbabook.svg?branch=master)](https://travis-ci.org/cdlm/sbabook)
[![Flattr this git repo](https://button.flattr.com/flattr-badge-large.png)](https://flattr.com/submit/auto?url=https%3A%2F%2Fgithub.com%2Fcdlm%2Fsbabook)


## Usage (nearly there)

The preamble is limited to the minimum:

```latex
\documentclass{sbabook}
\setmainlanguage{english} % this is polyglossia, not babel
\begin{document}

...and off you go!

\end{document}
```

The class requires LuaLaTeX to load nice fonts; just use `lualatex` instead of `pdflatex` to compile.


## Showcase

It looks nice, I promise!
Check the [manual / example file](https://github.com/cdlm/sbabook/blob/master/sbabook.tex); a compiled version is attached to the [latest release](https://github.com/cdlm/sbabook/releases/latest/).


## Install

Clone or otherwise download the contents of this repo, and put the files somewhere LaTeX can find them.
Run `kpsexpand '$TEXMFHOME'` for a suggestion.


## Requirements

You need a pretty up-to-date and complete LaTeX distribution, because the class requires LuaLaTeX and some associated packages to compile.
Just get a full install of the latest [TeXlive release][tl] and you should be good.

Fonts: the class uses [Gentium Book Basic][gentium], [Open Sans][], and [Fira mono][fira].
Those are now distributed as part of TeXlive.

On Linux distributions that maintain their own packaging instead of using the system provided by TeXlive, you will probably need to install several packages; e.g. on Ubuntu 15.04, since `texlive-full` doesn't seem to be a full install, you will additionally need:
- `texlive-luatex`, for `luaotfload.sty`,
- `texlive-xetex`, for `xunicode.sty`,
- `texlive-generic-extra`, for `tracklang.sty`,
- `texlive-fonts-extra`, for the Gentium fonts…

[memoir]: http://www.ctan.org/pkg/memoir
[sba]: https://github.com/SquareBracketAssociates
[tl]: http://www.tug.org/texlive/acquire-netinstall.html
[gentium]: http://www.google.com/webfonts/specimen/Gentium+Book+Basic
[open sans]: http://www.google.com/webfonts/specimen/Open+Sans
[fira]: https://mozilla.github.io/Fira/
[inconsolata]: http://www.google.com/webfonts/specimen/Inconsolata
