\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbabook}[2013/03/08]

% \ExecuteOptions{a4paper,11pt,twoside}
\ProcessOptions*
\LoadClassWithOptions{memoir}

\RequirePackage{graphicx}
\RequirePackage{xcolor}
\renewcommand{\trimmarkscolor}{\color{cyan}}

%%%
%%% Page layout
%%%
\newcommand{\stockustrade}{\setstocksize{9in}{6in}}% Lulu final book proportions
\newcommand{\stockaivus}{\setstocksize{11in}{210mm}}% intersection of A4 and US Letter
\newcommand{\setbleed}[1]{%
    \settrimmedsize{\stockheight}{\stockwidth}{*}%
    \settrims{#1}{#1}%
    \advance\stockheight 2\trimtop
    \advance\stockwidth  2\trimedge}
\newcommand{\paperbackpage}{
  \stockustrade
  \setbleed{.125in}
  % \setbinding{5mm}
  \setlrmarginsandblock{.85in}{.65in}{*}
  \setulmarginsandblock{.75in}{.75in}{*}}
\newcommand{\spiralboundpage}{
  \stockaivus
  \setbleed{0pt}% trims not required (unless we deliver this via Lulu as well?)
  \setlrmarginsandblock{1.25in}{1.25in}{*}
  \setulmarginsandblock{.75in}{1in}{*}}
\newcommand{\pagelayout}[1]{
  \providecommand{\setuppage}{#1}% set default page layout
  \setuppage\checkandfixthelayout
  \typeoutlayout}

\settypeoutlayoutunit{mm}

\raggedbottom

%%%
%%% Fonts & paragraph typography
%%%
\RequirePackage{fontspec}

\setmainfont[
  Ligatures=TeX, % supposed to replace Mapping=tex-text
  UprightFont = {Gentium Book Basic},
  ItalicFont = {Gentium Book Basic Italic}
]{Gentium Basic}
\setsansfont[
  Scale=MatchLowercase,
  BoldFont = {* Bold},
  Ligatures=TeX,
  Numbers=OldStyle
]{Open Sans}
\setmonofont[
  Scale=MatchLowercase
]{Fira Mono}%{Hack}
\let\codefamily\ttfamily
\newcommand\textcode[1]{\texttt{#1}}

\noindentafterchapter
\setlength{\parindent}{1.5em}
\nonzeroparskip

\firmlists
\renewcommand*{\descriptionlabel}[1]{%
  \hspace\labelsep
  \normalfont\sffamily #1}

\RequirePackage{ragged2e}
\RaggedRight
\RequirePackage{varwidth}
\newenvironment{balanced}[1]{%
    \CenteringLeftskip    0pt plus 6em%
    \CenteringRightskip   0pt plus 6em%
    \RaggedLeftLeftskip   0pt plus 12em%
    \RaggedRightRightskip 0pt plus 12em%
    \begin{varwidth}{#1}%
}{\end{varwidth}}

%% margin content
\sideparmargin{outer}
\renewcommand\sideparfont{\footnotesize\sffamily}
\renewcommand\sideparform{\ifmemtortm\RaggedRight\else\RaggedLeft\fi}
% \setmpjustification{\RaggedLeft}{\RaggedRight} % this is for margin floats

% footnotes at bottom of page instead of below text (which is ragged bottom)
% also moves footnotes below bottom-of-page floats
\RequirePackage[bottom]{footmisc}


%%%
%%% Title page
%%%

% similar to \title, \author, \date from latex.ltx
\def\series#1{\gdef\@series{#1}}
\let\@series\@empty

\setlength\droptitle{5cm}
\pretitle{\begin{flushright}\HUGE\sffamily}
\posttitle{\par\end{flushright}\vskip 1cm}
\preauthor{\begin{flushright}
    \large\sffamily
    \begin{tabular}[t]{r@{}}}
\postauthor{\end{tabular}\par\end{flushright}}
\predate{\begin{flushright}\large\sffamily}
\postdate{\par\end{flushright}}

% place authors on separate lines
% memoir provides \andnext, and normally \\ is used to add data under the
% author's name, like affiliation, email…
\renewcommand\and{\\}

% line break in title, hopefully without polluting PDF metadata etc
\newcommand\titlebreak[2][]{\texorpdfstring{#1\protect\\}{#2}}

%%%
%%% Sectioning
%%%

%% chapter heading
\newlength{\chapnumheight}\setlength{\chapnumheight}{18mm}
\makechapterstyle{sba}{%
    \renewcommand{\chapnamefont}{%
        \LARGE\sffamily\bfseries
        \addfontfeature{LetterSpace=20}%
        \flushright\MakeUppercase}
    \renewcommand{\chapnumfont}{%
        \HUGE\sffamily\bfseries
        \addfontfeature{Numbers={Proportional,Lining}}}
    \renewcommand{\chaptitlefont}{\HUGE\sffamily\mdseries\flushright}
    \renewcommand*{\chapterheadstart}{}
    \renewcommand*{\chapternamenum}{}
    \renewcommand*{\afterchapternum}{\par\nobreak\vskip 25pt}
    \renewcommand*{\printchapternum}{%
        \resizebox{!}{\chapnumheight}{\chapnumfont \,\thechapter}%
        \rlap{%
          \kern .3\chapnumheight
          \rule{\foremargin}{\chapnumheight}}}
    \setlength{\afterchapskip}{8\baselineskip}
    %% chapter precis
    \renewcommand\precisfont{\normalfont\sffamily\RaggedLeft\small}
    \newlength{\postchapterprecisskip}
    \setlength{\prechapterprecisshift}{-4\baselineskip}
    \setlength{\postchapterprecisskip}{\baselineskip}
    \renewcommand\prechapterprecis{%
      \precisfont
      \vspace*{-\postchapterprecisskip}%
      \vspace*{-4\baselineskip}}
    \renewcommand\postchapterprecis{\vspace*{\postchapterprecisskip}}
    %%% fix indentation of 1st paragraph after \chapterprecis
    %% cf https://groups.google.com/forum/#!msg/comp.text.tex/yj4ZoVlbSKE/5hJXO-2jG5EJ
  %  \addtoiargdef\chapterprecis{}{%
  %   \par\@afterheading\m@mindentafterchapter}
  }

% \renewcommand\chapterprecishere[1]{%
%     \prevgraf0
%     \prechapterprecis #1\postchapterprecis
%     {\count0 \numexpr3-\prevgraf\relax
%         \precisfont% just needed in case this did a size change so get right baseline
%         \ifnum\count0 >0 \vspace{\count0 \baselineskip}\fi}}
\renewcommand\chapterprecishere[1]{%
  {\prechapterprecis
    \begin{minipage}[t]{\linewidth}%
      \flushright
      \begin{balanced}{\linewidth}%
        \prevgraf0
        \strut#1\strut\par
        \xdef\precistmp{\noexpand\precisskip{\the\prevgraf}{\the\baselineskip}}%
      \end{balanced}\par%
    \end{minipage}%
    \precistmp
    \postchapterprecis
  }%
  \par
  \@afterheading
}
\def\precisskip#1#2{{%
    \count0 \numexpr4-#1\relax
    \dimen0=#2 %
    \ifnum\count0 >0 \vspace*{\count0 \dimen0}\fi}}


\makeheadstyles{sba}{%
  \renewcommand*{\booknamefont} {\normalfont\huge\sffamily}
  \renewcommand*{\booknumfont}  {\normalfont\huge\sffamily}
  \renewcommand*{\booktitlefont}{\normalfont\Huge\sffamily}
  \renewcommand*{\partnamefont} {\normalfont\huge\sffamily}
  \renewcommand*{\partnumfont}  {\normalfont\huge\sffamily}
  \renewcommand*{\parttitlefont}{\normalfont\Huge\sffamily}
  \chapterstyle{sba}
  \setsecheadstyle      {\LARGE\sffamily\bfseries}
  \setsubsecheadstyle   {\Large\sffamily\bfseries}
  \setsubsubsecheadstyle{\Large\sffamily}
  \setparaheadstyle     {\sffamily\bfseries}
  \setsubparaheadstyle  {\sffamily}
  \setsecnumformat{%
    \llap{\mdseries
      \csname the##1\endcsname
      \quad}}
}

\headstyles{sba}
\setsecnumdepth{section}
\settocdepth{section}


%%%
%%% Page styles & folios
%%%
\def\headfootfont{\small\sffamily}
%% main page style variant
\makepagestyle{sba-headings}
\makeevenhead{sba-headings}{}{}{\ifonlyfloats{}{\headfootfont\leftmark}}
\makeoddhead {sba-headings}{\ifonlyfloats{}{\headfootfont\rightmark}}{}{}
\makeevenfoot{sba-headings}{\headfootfont\bfseries\thepage}{}{}
\makeoddfoot {sba-headings}{}{}{\headfootfont\bfseries\thepage}
\makepsmarks{sba-headings}{\nouppercaseheads
    \createmark{chapter}{left}{nonumber}{}{}
    \createmark{section}{right}{shownumber}{}{\quad}}
%% page style variant without headings
\makepagestyle{sba-plain}
\makeevenfoot{sba-plain}{\headfootfont\bfseries\thepage}{}{}
\makeoddfoot {sba-plain}{}{}{\headfootfont\bfseries\thepage}
%% no folio on float-only pages
\mergepagefloatstyle{sba}{sba-headings}{empty}

\aliaspagestyle{plain}{sba}
\aliaspagestyle{book}{empty}
\aliaspagestyle{part}{empty}
\aliaspagestyle{chapter}{sba-plain}

%%%
%%% Floats
%%%
\captionnamefont{\sffamily\bfseries}
\captiontitlefont{\sffamily}
\renewcommand\sidecapfloatwidth{.5\linewidth}% ahould adjust \sidecapwidth accordingly
\captionstyle[\RaggedRight]{\RaggedRight}
\captiondelim{\quad}

\setfloatadjustment{figure}{\small\sffamily\centering}
\setfloatadjustment{table} {\small\sffamily\centering}

%%%
%%% Graphics
%%%
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{decorations.pathmorphing}
\definecolor{shadecolor}{gray}{0.9} % FIXME really needed?

% dash pattern for margin brackets that cross pages
% last dash is supposed to be infinite but in practice the page height is enough
\tikzstyle{dashfade}=[
  dash pattern = on 0.5pt off 1pt on 1pt off 1pt on 2pt off 1pt on \paperheight]

\RequirePackage[listings,breakable,skins]{tcolorbox}

%%%
%%% Source code
%%%
\RequirePackage{listings}

% \renewcommand{\lstlistlistingname}{Code examples}
\lstdefinestyle{sbabook}{
    inputencoding=utf8,
    aboveskip=0pt, belowskip=0pt,
    columns=fullflexible,
    keepspaces,
    breaklines,
    breakatwhitespace,
    showstringspaces=false,
    mathescape=false,
    tabsize=2,
    keywordstyle={},
    stringstyle={},
    commentstyle={},
}
\lstset{style = sbabook}


\lstdefinelanguage{plain}{}% verbatim, plain text

% inline code
\let\code\lstinline

\tcbset{
  sba/.style = {
    empty, size = minimal,
    blend before title code = {\begingroup\@contnfont ##1\@contdelim\endgroup},
    floatplacement = tb,
    fonttitle=\@conttfont,
    coltitle = black,
    listing only,
    listing options = {
      style = sbabook,
      basicstyle = \small\codefamily,
      language = {#1}
    },
    breakable,
    frame code = {\draw
      ([xshift=-2pt]interior.south west)
      --([xshift=-4pt]interior.south west)
      --([xshift=-4pt]interior.north west)
      --([xshift=-2pt]interior.north west);
    },
    skin first is subskin of = {emptyfirst}{%
      frame code = {
        \draw[dashfade] ([xshift=-4pt]interior.south west) |- ([xshift=-2pt]interior.north west);
      }},
    skin middle is subskin of = {emptymiddle}{%
      frame code = {
        \draw[dashfade] ([xshift=-4pt]interior.south west)
        --($([xshift=-4pt]interior.south west)!.5!([xshift=-4pt]interior.north west)$);
        \draw[dashfade] ([xshift=-4pt]frame.north west)
        --($([xshift=-4pt]interior.south west)!.5!([xshift=-4pt]interior.north west)$);
      }},
    skin last is subskin of = {emptylast}{%
      frame code = {
        \draw[dashfade] ([xshift=-4pt]interior.north west) |- ([xshift=-2pt]interior.south west);
      }}
  }
}

% Block-level listings, breakable across multiple pages, with a bracket in the
% left margin
\newtcblisting{displaycode}[2][]{sba={#2}, #1}

\newtcblisting[
  % nearly identical to what "blend into=figures" would do, except for /tcb/code
  use counter* = figure,
  list inside = lof,
  list type = listing,
  /tcb/code = {\appto\tcb@new@colopt{,before title={\tcb@blend@beforetitle{\lstlistingname~\thefigure}}}}
  % crefname={listing}{listings},
  % Crefname={Listing}{Listings}
]{listing}[3][]{
  sba={#2},
  title={#3},
  bottomtitle = 1ex,
  list entry = {\protect\numberline{\thefigure}{\ignorespaces #3}},
  #1
}

%%%
%%% Table of contents appearance
%%%
\cftpagenumbersoff{part}
\setlength{\cftbeforepartskip}{2em plus 1.5em minus .75em}

\addtodef\tableofcontents{\clearforchapter}{}
\renewcommand\cftpartfont{\sffamily\large\bfseries}
\let\cftpartpagefont\cftpartfont% unused, but for coherence
\renewcommand\cftpartleader{}
\renewcommand\cftpartafterpnum{\cftparfillskip}
\setlength{\cftbeforechapterskip}{1em plus .5em minus .2em}
\renewcommand{\cftchapterbreak}{\pagebreak[2]}

\renewcommand\cftchapterfont{\sffamily\bfseries}
\let\cftchapterpagefont\cftchapterfont
\renewcommand\precistocfont{\normalfont\sffamily\itshape\small}
\renewcommand\precistocformat{% discourage hyphenation
    \hyphenpenalty=5000
    \tolerance=1000
    \noindent\narrowragged}

% TODO balance precis in TOC
\renewcommand\cftsectionfont{\sffamily}
\let\cftsectionpagefont\cftsectionfont
\renewcommand\cftsubsectionfont{\sffamily\itshape}
\let\cftsubsectionpagefont\cftsectionfont
\cftsetindents{part}{0pt}{0em}
\renewcommand{\cftpartpresnum}{\hspace{-4em}\hfill}
\renewcommand{\cftpartaftersnum}{\quad}
\cftsetindents{chapter}{0pt}{0em}
\renewcommand{\cftchapterpresnum}{\hspace{-4em}\hfill}
\renewcommand{\cftchapteraftersnum}{\quad}
\cftsetindents{section}{0pt}{0em}
\renewcommand{\cftsectionpresnum}{\hspace{-4em}\hfill}
\renewcommand{\cftsectionaftersnum}{\quad}
\cftsetindents{subsection}{0pt}{3em}
\setrmarg{3.55em plus 1fil}% help avoid hyphenation

%% Combine figures, tables, listings into a single list. We redirect everything
%% to the list of figures
\renewcommand\listfigurename{Illustrations}
\renewcommand\ext@table{lof}

%% figures & tables, like sections
\cftsetindents{figure}{0pt}{0em}
\let\cftfigurefont\cftsectionfont
\let\cftfigurepagefont\cftfigurefont
\renewcommand\cftfigurepresnum{\hspace{-4em}\hfill}
\renewcommand\cftfigureaftersnum{\quad}

\let\c@table\c@figure
\let\l@table\l@figure

% redefining the counter it taken care of by \newtcblisting
% \let\c@listing\c@figure
\let\l@listing\l@figure

%% counter appearance is reset at front/main/back matter
\renewcommand\@memmain@floats{%
  \counterwithin{figure}{chapter}
  \renewcommand\thefigure{\thechapter-\arabic{figure}}
  \let\thetable\thefigure}

%% verbatim setup
\bvtopandtail % \bvsides
\setlength{\bvboxsep}{.25em}
\tabson[4]
\setverbatimfont{\normalfont\codefamily\small}

\DeclareRobustCommand{\LaTeX}{%
  {% copied from Grzegorz Murzynowski's article in TUGboat 29(1)
    L%
    \setbox\z@\hbox{\check@mathfonts
      \fontsize\sf@size\z@
      \math@fontsfalse\selectfont
      A}%
    \kern-.57\wd\z@
    \sbox\tw@ T%
    \vbox to\ht\tw@{\copy\z@ \vss}%
    \kern-.2\wd\z@}%
  {%
    \ifdim\fontdimen1\font=\z@
    \else
      \count\z@=\fontdimen5\font
      \multiply\count\z@ by 64\relax
      \divide\count\z@ by\p@
      \count\tw@=\fontdimen1\font
      \multiply\count\tw@ by\count\z@
      \divide\count\tw@ by 64\relax
      \divide\count\tw@ by\tw@
      \kern-\the\count\tw@ sp\relax
    \fi}%
  \TeX}

%%%
%%% Language, localizations, hyphenation
%%%
\RequirePackage{polyglossia}

