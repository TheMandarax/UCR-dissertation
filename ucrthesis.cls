% This file is copyright (C) 2003 Sam Noble and has been modified by Troy R.
% Alva. 
% Redistribution permitted.
%
% 01 Jun 2021 Troy R. Alva modified for UCR dissertation/thesis
% 27 Jan 2004	Sam Noble	Removed tocbibind dependency.
% 04 Dec 2001 	Sam Noble	Class file
% 03 Sep 1995	David Perkinson	Title Page
% Acknowledgements Page, David Perkinson & Sam Noble
% May 2005 Patrick Carlisle Table of contents chapter definition
% 2004-2005 Ben Salzberg (BTS) a variety of tweaks here and in the template
% 2015 Chester Ismay (CII) modified to create R Markdown template
% 2021 Troy R. Alva modified to create R Markdown template compatible with 
% UCR standards
%
% Oddities:
%
%   We *ASSUME* that any time \cleardoublepage is called
%  we actually want a blank back side with NO page number/heading
%
%   Minor bug -- seems to be a more general LaTeX thing:
%  If you use \frontmatter \mainmatter without any chapters inbetween
%  be prepared to have the page numbering messed up. Not a big deal,
%  but I'm not sure how to fix it.
%
% Does not support accent entries for unicode without XeLaTeX, but this package
% comes with its own icompatibilites. Work around possible, but I'm lazy ;)
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucrthesis}[2021/05/01 The UCR Thesis Class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}
\RequirePackage{fancyhdr}
\RequirePackage{fancyvrb}

\usepackage{ifxetex,ifluatex}
\usepackage{fixltx2e} % provides \textsubscript
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[T1]{fontenc}
  \usepackage[utf8]{inputenc}
\else % if luatex or xelatex
  \ifxetex
    \usepackage{mathspec}
    \usepackage{xltxtra,xunicode}
  \else
    \usepackage{fontspec}
  \fi
  \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
  \newcommand{\euro}{€}
\fi
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
\IfFileExists{microtype.sty}{%
\usepackage{microtype}
\UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
\usepackage{color}
\DefineVerbatimEnvironment{verbatim}{Verbatim}{xleftmargin=-1em}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}}
\usepackage{framed}
\definecolor{shadecolor}{RGB}{248,248,248}

\setlength{\emergencystretch}{3em}  % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

\fancypagestyle{newchapter}{
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% This gives us rules below the headers
\AtBeginDocument{%
  \fancyhf{}
  \fancyfoot[C]{\thepage}
	% \fancyhead[LO]{\slshape \nouppercase \leftmark}
	\fancyhead[RO]{\slshape \nouppercase \rightmark}
	\renewcommand{\headrulewidth}{0pt}
	
  \pagestyle{fancy}

% Psych majors: You do not need the following six lines, as it conflicts with apacite, so comment them out.
  \let\oldthebibliography=\thebibliography
  \let\endoldthebibliography=\endthebibliography
  \renewenvironment{thebibliography}[1]{
    \oldthebibliography{#1}
    \addcontentsline{toc}{chapter}{\bibname}
  }{\endoldthebibliography}
 %%%%%% end of things for psych majors to comment out

  \let\oldtheindex=\theindex
  \let\endoldtheindex=\endtheindex
  \renewenvironment{theindex}{
    \oldtheindex
    \addcontentsline{toc}{chapter}{\indexname}
  }{\endoldtheindex}
}

% Stolen from book.cls and modified
\let\RToldchapter\chapter
\renewcommand{\chapter}{\if@openright\RTcleardoublepage
		    \else\clearpage\fi
		    \thispagestyle{newchapter}%
		    \global\@topnum\z@
		    \@afterindentfalse
		    \secdef\@chapter\@schapter}

% Stolen from book.cls PBC 5/12/05
% Using this to actually show "Chapter 1" in TOC instead of "1"
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                         {\@chapapp\space\thechapter:\space#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\newcommand{\RTcleardoublepage}{
	\clearpage\if@twoside \ifodd\c@page\else
	\thispagestyle{empty}\hbox{}\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\let\RToldcleardoublepage\cleardoublepage
\renewcommand{\cleardoublepage}{\RTcleardoublepage}

% UCR margins
\usepackage[left=1.5in,top=1.5in,right=1in,bottom=1in, headheight=14.49998pt]{geometry}

% % adjust margins for binding  (changed 2007-04-24 tgp)
% \setlength{\oddsidemargin}{1.5in}
% \setlength{\evensidemargin}{1in}
% \setlength{\textwidth}{6.0in}
% \setlength{\textheight}{9.0in}
% \setlength\topmargin{1.5in}
% \addtolength\topmargin{-\headheight}
% \addtolength\topmargin{-\headsep}
% 
% %\setlength{\oddsidemargin}{.6in}
% %\setlength{\evensidemargin}{0in}
% %\setlength{\textwidth}{5.9in}
% \addtolength\headheight{2.5pt}
% %\addtolength\topmargin{-\headheight}
% %\addtolength\topmargin{-\headsep}
% %\addtolength\textheight{1in}
% %\addtolength\textheight{\headheight}
% %\addtolength\textheight{\headsep}

\def\degree#1{\gdef \@degree{#1}}
\def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
\def\institution#1{\gdef \@institution{#1}}
\def\@institution{\@latex@warning@no@line{No \noexpand\institution given}}
\def\division#1{\gdef \@division{#1}}
\def\@division{\@latex@warning@no@line{No \noexpand\division given}}
\def\department#1{\gdef \@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\thedivisionof#1{\gdef \@thedivisionof{#1}}
\def\@thedivisionof{The Division of}
\def\approvedforthe#1{\gdef \@approvedforthe{#1}}
\def\@approvedforthe{Division}
\def\advisor#1{\gdef \@advisor{#1}}
\def\doctype#1{\gdef \@doctype{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}
\def\altadvisor#1{\gdef \@altadvisor{#1} \@altadvisortrue}
\global\let\@altadvisor\@empty
\newif\if@altadvisor
\@altadvisorfalse

% Added for UCR
\def\degreemonth#1{\gdef \@degreemonth{#1}}
\def\degreeyear#1{\gdef \@degreeyear{#1}}
\def\degreesemester#1{\gdef \@degreesemester{#1}}
\def\othermembertwo#1{\gdef \@othermembertwo{#1}}
\def\othermemberthree#1{\gdef \@othermemberthree{#1}}
\def\campus#1{\gdef \@campus{#1}}

\def\@approvalspace{.75in}

\renewcommand\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\normalfont
      \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\bfseries \hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

%%% Added by CII
\newenvironment{acknowledgements}{%
  \setcounter{page}{4}
  \begin{center}
  \large\bfseries{Acknowledgements}
  \end{center}
  % \chapter*{Acknowledgements}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%

% End of CII add

\newenvironment{abstract}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%

\newenvironment{dedication}{%
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%


\ifx\@pdfoutput\@undefined
  \newcommand{\RTpercent}{\@percentchar\space}
  \AtBeginDvi{\special{!\RTpercent Reed College LaTeX Thesis Class 2001/12/04 SN}}
  \AtBeginDvi{\special{rawpostscript \RTpercent Reed College LaTeX Thesis Class 2001/12/04 SN}}
\else
  \AtEndDocument{\pdfinfo{/Creator	(Reed College LaTeX Thesis Class 2001/12/04 SN)}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Title Pages %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
  {\thispagestyle{empty}
  \fontsize{12}{14}\selectfont
  \begin{titlepage}
  \newpage
  \let\footnotesize\small
  \let\footnoterule\relax
  \baselineskip = 1.4\baselineskip

  \begin{center}
    \null\vfil
    \singlespace
    UNIVERSITY OF CALIFORNIA \par {\expandafter\uppercase\expandafter{\@campus}} \par
    \vspace{6ex}
    \bigskip \medskip
    {\@title} \par
    \vspace{6ex}
    \bigskip \medskip
    A {\@doctype} submitted in partial satisfaction \par
    of the requirements for the degree of \par
    \vspace{6ex}
    {\@degree} \par
    \medskip
    in \par
    \medskip
    {\@department} \par
    \bigskip \medskip
    by \par
    \bigskip \medskip
    {\@author} \par
    \bigskip \medskip
    {\@degreemonth} {\@degreeyear} \par
  \end{center}
  \vfil
  \singlespace
  Dissertation Committee:
  \begin{quote}
    {\@advisor}, Chairperson\newline
    {\@othermembertwo}\newline
  { \@othermemberthree}
  \end{quote}
  \null\vfil
  \end{titlepage}
  
%%%%%%%%%%%%%%%%% CopyRight %%%%%%%%%%%%%%%%%%%
  \cleardoublepage
  {\fontsize{12}{14}
  \thispagestyle{empty}
  \begin{singlespace}
  \null\vfill
  \begin{center}
    Copyright by\par
    {\@author}\par
    {\@degreeyear}
  \end{center}
  \end{singlespace}}
  

%%%%%%%%%%%%%%%%% Approval %%%%%%%%%%%%%%%%%%%%
  \cleardoublepage
  {\fontsize{12}{14}
  \thispagestyle{empty}
  \null\vfil		% just below center of page
  \begin{singlespace}
    The {\@doctype} of {\@author} is approved:\\
    \vspace{.25in}
    \vspace{\@approvalspace}
    \begin{center}
      $\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{3.5in}  }}\:$ \\
      \vspace{\@approvalspace}
      $\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{3.5in}  }}\:$ \\
      \vspace{\@approvalspace}
      $\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{2.03in} Committee Chairperson }}\:$ \\
      \vspace{\@approvalspace}

      \vspace{-.25in}
      \vspace{\@approvalspace}
      {\@institution}, {\@campus} \\
    \end{center}
  \end{singlespace}
  }
  \cleardoublepage
}

}

% From JSS
% Added by CII
\renewcommand{\title}[1]{\def\@title{#1}}
%\newcommand{\Shorttitle}[1]{\def\@Shorttitle{#1}}
\newcommand{\Plainauthor}[1]{\def\@Plainauthor{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
%\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
%\newcommand{\Plainkeywords}[1]{\def\@Plainkeywords{#1}}
\newcommand{\Acknowledgements}[1]{\def\@Acknowledgements{#1}}
\newcommand{\Dedication}[1]{\def\@Dedication{#1}}
% End of CII add


