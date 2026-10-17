%% Copyright 2026 Petr Socha
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   https://www.latex-project.org/lppl.txt
%% and version 1.3c is part of all distributions of LaTeX
%% version 2008 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% The Current Maintainer of this work is Petr Socha.
%% Maintenance and bug reports: https://github.com/petrsocha/pslib-latex/issues
%%
%% The components of this work are listed in MANIFEST.txt.
%% The school logo is a separately licensed third-party asset.

% SPŠ a VOŠ Liberec -- jednoduchá třída pro odborné práce
% Verze 1.0beta (pdfLaTeX, oboustranný tisk).
% Samostatná implementace inspirovaná odbornou typografií a školní předlohou.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spslib}[2026/10/17 v1.0beta sablona odbornych praci SPS a VOS Liberec]
\LoadClass[a4paper,11pt,twoside,openright]{report}

\RequirePackage{iftex}
\ifPDFTeX\else
  \ClassError{spslib}{Pouzijte prekladac pdfLaTeX}{V Overleafu zvolte Settings -> Compiler -> pdfLaTeX.}
\fi
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[main=czech,english]{babel}
% Libertinus v pdfLaTeXu pouziva Type 1 fonty (serif/sans/mono).
% Zachovava typograficky charakter predchozi XeLaTeX verze.
\RequirePackage[ScaleTT=1]{libertinus}
\RequirePackage{microtype}
\RequirePackage{geometry}
\geometry{inner=30mm,outer=25mm,top=25mm,bottom=25mm,headheight=15pt}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{truncate} % Jednoradkova zahlavi i pri velmi dlouhem nazvu.
\RequirePackage{pdfpages}
\RequirePackage{float}
\RequirePackage{caption}
\captionsetup{font=small,labelfont=bf}
\captionsetup[figure]{position=bottom}
\captionsetup[table]{position=top}
\floatplacement{figure}{tbp}
\floatplacement{table}{tbp}
\RequirePackage{enumitem}
\setlist{nosep,topsep=4pt}
\RequirePackage{listings}
% Český název automaticky číslovaného výpisu zdrojového kódu.
\renewcommand{\lstlistingname}{Výpis}
\lstset{basicstyle=\small\ttfamily,breaklines=true,frame=single,
  numbers=left,numberstyle=\tiny,numbersep=9pt,
  xleftmargin=15pt,framexleftmargin=15pt,showstringspaces=false}
% Podpora ceskych znaku ve vypisech kodu (komentare, retezce).
% Balicek listings s pdfLaTeXem jinak selhava na UTF-8 diakritice.
\lstset{literate=
    {á}{{\'{a}}}1
    {Á}{{\'{A}}}1
    {č}{{\v{c}}}1
    {Č}{{\v{C}}}1
    {ď}{{\v{d}}}1
    {Ď}{{\v{D}}}1
    {é}{{\'{e}}}1
    {É}{{\'{E}}}1
    {ě}{{\v{e}}}1
    {Ě}{{\v{E}}}1
    {í}{{\'{i}}}1
    {Í}{{\'{I}}}1
    {ň}{{\v{n}}}1
    {Ň}{{\v{N}}}1
    {ó}{{\'{o}}}1
    {Ó}{{\'{O}}}1
    {ř}{{\v{r}}}1
    {Ř}{{\v{R}}}1
    {š}{{\v{s}}}1
    {Š}{{\v{S}}}1
    {ť}{{\v{t}}}1
    {Ť}{{\v{T}}}1
    {ú}{{\'{u}}}1
    {Ú}{{\'{U}}}1
    {ů}{{\r{u}}}1
    {Ů}{{\r{U}}}1
    {ý}{{\'{y}}}1
    {Ý}{{\'{Y}}}1
    {ž}{{\v{z}}}1
    {Ž}{{\v{Z}}}1
}
\RequirePackage{needspace}
\RequirePackage{csquotes}
\RequirePackage[backend=biber,style=iso-numeric,sorting=none]{biblatex}
\RequirePackage{zref-totpages}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\hypersetup{hidelinks,pdfcreator={pdfLaTeX / spslib}}

% České popisky při automatických odkazech přes \autoref{...}.
% Pro správné skloňování lze nadále použít ruční text a \ref{...}.
\def\chapterautorefname{kapitola}
\def\sectionautorefname{oddíl}
\def\subsectionautorefname{pododdíl}
\def\subsubsectionautorefname{pododdíl}
\def\figureautorefname{obrázek}
\def\tableautorefname{tabulka}
\def\equationautorefname{rovnice}
\def\lstlistingautorefname{výpis}

\setlength{\parindent}{1.25em}
\setlength{\parskip}{0pt}
\linespread{1.12}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand{\chaptername}{}%
\renewcommand{\contentsname}{Obsah}
\renewcommand{\listfigurename}{Seznam obrázků}
\renewcommand{\listtablename}{Seznam tabulek}

\makeatletter
% Kazda kapitola a samostatna cast zacina na prave (liche) strane.
% Automaticky vlozena suda strana nema zahlavi ani zapati.
\renewcommand{\cleardoublepage}{%
  \clearpage
  \if@twoside
    \ifodd\c@page\else
      \hbox{}\thispagestyle{empty}\newpage
    \fi
  \fi
}
% Kompaktni jednouradkove nadpisy kapitol: 1 Analýza, 2 Návrh, ...
\def\@makechapterhead#1{%
  \vspace*{2mm}%
  {\parindent\z@\raggedright\sffamily\LARGE\bfseries
   \ifnum\c@secnumdepth>\m@ne \thechapter\hspace{0.7em}\fi
   #1\par\nobreak\vskip 1.4em}}
\def\@makeschapterhead#1{%
  \vspace*{2mm}%
  {\parindent\z@\raggedright\sffamily\LARGE\bfseries
   #1\par\nobreak\vskip 1.4em}}
\newcommand{\@nazevprace}{Název práce}
\newcommand{\@kratkynazevprace}{Název práce}
\newif\ifsps@kratkyzadan
\sps@kratkyzadanfalse
\newcommand{\@typprace}{Maturitní práce}
\newcommand{\@autorprace}{Jméno Příjmení}
\newcommand{\@oborprace}{Informační technologie}
\newcommand{\@vedouciprace}{Jméno vedoucího}
\newcommand{\@skolnirok}{2026/2027}
\newcommand{\@datumprohlaseni}{\today}
\newcommand{\@anotace}{Stručně popište zaměření, cíl a výsledek práce.}
\newcommand{\@summary}{Briefly describe the aim, method and result of your work.}
\newcommand{\@prohlaseni}{Prohlašuji, že jsem tuto práci vypracoval/a samostatně. V práci jsem použil/a pouze zdroje uvedené v seznamu literatury a všechny převzaté části, včetně textů, obrázků, kódu a výstupů umělé inteligence, jsou řádně označeny a citovány.}
\let\@zadanipdf\@empty
\newcommand{\nazevprace}[1]{%
  \gdef\@nazevprace{#1}%
  \ifsps@kratkyzadan\else\gdef\@kratkynazevprace{#1}\fi
}
\newcommand{\kratkynazevprace}[1]{\gdef\@kratkynazevprace{#1}\sps@kratkyzadantrue}
\newcommand{\typprace}[1]{\gdef\@typprace{#1}}
\newcommand{\autorprace}[1]{\gdef\@autorprace{#1}}
\newcommand{\oborprace}[1]{\gdef\@oborprace{#1}}
\newcommand{\vedouciprace}[1]{\gdef\@vedouciprace{#1}}
\newcommand{\skolnirok}[1]{\gdef\@skolnirok{#1}}
\newcommand{\datumprohlaseni}[1]{\gdef\@datumprohlaseni{#1}}
\newcommand{\anotace}[1]{\gdef\@anotace{#1}}
\newcommand{\summary}[1]{\gdef\@summary{#1}}
\newcommand{\prohlaseni}[1]{\gdef\@prohlaseni{#1}}
\newcommand{\zadani}[1]{\gdef\@zadanipdf{#1}}

% Pocet slov pripravi latexmkrc pred prekladem, pouze jednou za sestaveni.
% Zadne shell-escape pri zpracovani dokumentu neni treba.
\newcommand{\pocetslov}{%
  \IfFileExists{pocet-slov.tex}{\input{pocet-slov.tex}}{--}%
}

% Mereni vysky nadpisu pro zachovani jediného titulniho listu.
\newcommand{\sps@zmerktitul}{%
  \setbox\sps@titlebox=\vbox{\hsize=\linewidth
    \centering\sps@titlefont\bfseries\sffamily\@nazevprace\par}%
}
% Zjistime nejdelsi hodnotu pro rozhodnuti o zalamovani udaju.
\newbox\sps@titlebox
\newlength{\sps@nejdelsiudaj}
\newlength{\sps@mereni}
\newcommand{\sps@zmerjeden}[1]{%
  \settowidth{\sps@mereni}{\textbf{#1}}%
  \ifdim\sps@mereni>\sps@nejdelsiudaj
    \setlength{\sps@nejdelsiudaj}{\sps@mereni}%
  \fi
}
\newcommand{\sps@zmerudaje}{%
  \setlength{\sps@nejdelsiudaj}{0pt}%
  \sps@zmerjeden{\@autorprace}%
  \sps@zmerjeden{\@oborprace}%
  \sps@zmerjeden{\@vedouciprace}%
}

\newcommand{\titulnistrana}{%
\begin{titlepage}
  \thispagestyle{empty}
  \begin{center}
    {\small\sffamily Střední průmyslová škola a Vyšší odborná škola, Liberec,\\ příspěvková organizace\par}
    \vspace*{3cm}
    \includegraphics[width=24mm]{obrazky/logo-skoly.png}\par
    % Běžný název se sází původní velikostí. Jen mimořádně dlouhý
    % název dostane o stupeň menší písmo a menší vertikální mezeru,
    % aby titulní list nemohl přetéct na další fyzickou stránku.
    \let\sps@titlefont\Huge
    \sps@zmerktitul
    \ifdim\ht\sps@titlebox>145pt
      \let\sps@titlefont\LARGE
      \sps@zmerktitul
    \fi
    \ifdim\ht\sps@titlebox>185pt
      \let\sps@titlefont\Large
      \sps@zmerktitul
    \fi
    \ifdim\ht\sps@titlebox>220pt
      \let\sps@titlefont\normalsize
      \sps@zmerktitul
    \fi
    \ifdim\ht\sps@titlebox>150pt
      \vspace*{0.6cm}%
    \else
      \ifdim\ht\sps@titlebox>90pt
        \vspace*{1.3cm}%
      \else
        \ifdim\ht\sps@titlebox>54pt
          \vspace*{2.5cm}%
        \else
          \vspace*{3.7cm}%
        \fi
      \fi
    \fi
    {\sps@titlefont\bfseries\sffamily\@nazevprace\par}
    \vspace{0.45cm}
    {\Large\sffamily\@typprace\par}
    \vfill
    \renewcommand{\arraystretch}{1.24}
    % Osa mezery mezi sloupci = stred textove oblasti a skolniho loga.
    % Kratke udaje maji puvodni sazbu; dlouhe hodnoty se mohou zalomit
    % uvnitr prave poloviny stranky misto presahu do okraje.
    \sps@zmerudaje
    \ifdim\sps@nejdelsiudaj>\dimexpr.5\linewidth-.45em\relax
      \noindent\begin{tabular}{@{}>{\raggedleft\arraybackslash}p{\dimexpr.5\linewidth-.45em\relax}@{\hspace{0.9em}}>{\raggedright\arraybackslash}p{\dimexpr.5\linewidth-.45em\relax}@{}}
        Autor & \textbf{\@autorprace}\\
        Obor & \textbf{\@oborprace}\\
        Vedoucí práce & \textbf{\@vedouciprace}\\
        Školní rok & \textbf{\@skolnirok}\\
        Počet stran & \textbf{\ztotpages}\\
        Počet slov & \textbf{\pocetslov}
      \end{tabular}\par
    \else
      \makebox[\linewidth][c]{%
        \makebox[0pt][r]{%
          \begin{tabular}[c]{@{}r@{}}
            Autor\\ Obor\\ Vedoucí práce\\ Školní rok\\ Počet stran\\ Počet slov
          \end{tabular}}%
        \hspace{0.9em}%
        \makebox[0pt][l]{%
          \begin{tabular}[c]{@{}l@{}}
            \textbf{\@autorprace}\\
            \textbf{\@oborprace}\\
            \textbf{\@vedouciprace}\\
            \textbf{\@skolnirok}\\
            \textbf{\ztotpages}\\
            \textbf{\pocetslov}
          \end{tabular}}%
      }%
    \fi
    \vspace*{1.3cm}
  \end{center}
\end{titlepage}
}

% Strana PDF 1: titulni list. Strana 2: prazdny rub titulniho listu.
% Strany 3 a 4: samostatny oboustranny list se zadanim.
\newcommand{\listsezadanim}{%
  \cleardoublepage % zajisti prazdnou druhou stranu titulniho listu
  \ifx\@zadanipdf\@empty
    \thispagestyle{empty}%
    \null\vfill
    \begin{center}
      {\sffamily (sem vložte podepsané zadání práce)}
    \end{center}
    \vfill\null
    \cleardoublepage % prazdny rub listu zadani
  \else
    \IfFileExists{\@zadanipdf}{%
      \includepdf[pages={1,2},pagecommand={\thispagestyle{empty}}]{\@zadanipdf}%
    }{\ClassError{spslib}{Soubor PDF se zadanim neexistuje}{Zkontrolujte cestu v prikazu \string\zadani.}}%
  \fi
}

% Vypis prohlaseni jako NEROZDELITELNEHO celku, pokud se vejde na A4.
% Je-li na stavajici strane malo mista, presuneme cele prohlaseni na
% nasledujici lici listu. U mimoradne dlouheho prohlaseni povolime
% bezne strankovani a ponechame podpis s koncem textu.
\newsavebox{\sps@prohlasenibox}
\newcommand{\sps@podpis}{%
  \par\vspace{2em}%
  \noindent V Liberci dne \@datumprohlaseni\hfill
  \begin{tabular}[t]{c}\\[-1ex]
    \rule{53mm}{0.4pt}\\ \@autorprace
  \end{tabular}\par
}
\newcommand{\sps@textprohlaseni}{%
  {\Large\bfseries\sffamily Čestné prohlášení\par}\vspace{0.75em}
  \noindent\@prohlaseni\par
  \sps@podpis
}
\newcommand{\sps@vypisprohlaseni}{%
  \par
  \sbox{\sps@prohlasenibox}{%
    \parbox{\textwidth}{\sps@textprohlaseni}%
  }%
  \ifdim\dimexpr\ht\sps@prohlasenibox+\dp\sps@prohlasenibox\relax<\textheight
    % Ochranna mala rezerva pred koncem stranky.
    \ifdim\dimexpr\pagegoal-\pagetotal\relax<\dimexpr\ht\sps@prohlasenibox+\dp\sps@prohlasenibox+\baselineskip\relax
      \cleardoublepage
    \fi
    \noindent\usebox{\sps@prohlasenibox}\par
  \else
    % I neobvykle dlouhe prohlaseni muze sahat pres vice stran.
    \Needspace{5\baselineskip}%
    {\Large\bfseries\sffamily Čestné prohlášení\par}\vspace{0.75em}
    \noindent\@prohlaseni\par
    \Needspace{6\baselineskip}%
    \sps@podpis
  \fi
}

\newcommand{\prednistrany}{%
  \hypersetup{pageanchor=false}%
  \pagestyle{empty}%
  \pagenumbering{arabic}% docasna fyzicka parita stran
  \titulnistrana
  % titlepage v tride report resetuje cislovani; obnovime fyzickou stranu 2.
  \setcounter{page}{2}%
  \listsezadanim
  \cleardoublepage
  % Bez pevneho minipage: anotace a Summary se mohou volne lamat.
  % Kratke texty i prohlaseni zustanou na jedne strane, pokud se vejdou.
  \noindent{\Large\bfseries\sffamily Anotace\par}\vspace{0.75em}
  \noindent\@anotace\par
  \vspace{1.8em}
  \noindent{\Large\bfseries\sffamily Summary\par}\vspace{0.75em}
  \begin{otherlanguage}{english}\noindent\@summary\par\end{otherlanguage}
  \vspace{1.8em}
  \sps@vypisprohlaseni
  \cleardoublepage
  \tableofcontents
  \thispagestyle{empty}% bez zahlavi a cislovani i na prvni strane obsahu
  \cleardoublepage % nasledujici Uvod bude na liche strane PDF
  \pagenumbering{arabic}% na zacatku Uvodu bude viditelne cislo 1
  \hypersetup{pageanchor=true}%
  \pagestyle{fancy}%
}

% Prvni zaverecna cast zacina na lici, ostatni seznamy pak na dalsi
% volne strane bez prazdnych rubu. Nasledujici prilohy zacinaji opet na lici.
\newcommand{\zaverecnecasti}{\cleardoublepage\@openrightfalse}
\newcommand{\zacatekpriloh}{\cleardoublepage\@openrighttrue\appendix\pagenumbering{Roman}}

% Seznamy s korektnim odkazem v obsahu, bez nucene liche strany.
% \chapter* pouziva \clearpage diky \zaverecnecasti.
\newcommand{\seznamobrazku}{%
  \chapter*{\listfigurename}%
  \phantomsection\addcontentsline{toc}{chapter}{\listfigurename}%
  \markboth{\listfigurename}{\listfigurename}%
  \@starttoc{lof}%
}
\newcommand{\seznamtabulek}{%
  \chapter*{\listtablename}%
  \phantomsection\addcontentsline{toc}{chapter}{\listtablename}%
  \markboth{\listtablename}{\listtablename}%
  \@starttoc{lot}%
}

% Necislovana kapitola, automaticky v obsahu.
\newcommand{\necislo}[1]{%
  \chapter*{#1}%
  \phantomsection\addcontentsline{toc}{chapter}{#1}%
  \markboth{#1}{#1}%
}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\small\sffamily\nouppercase{\truncate{\headwidth}{\@kratkynazevprace}}}
\fancyfoot[LE,RO]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\fancypagestyle{plain}{\fancyhf{}\fancyhead[LE,RO]{\small\sffamily\nouppercase{\truncate{\headwidth}{\@kratkynazevprace}}}\fancyfoot[LE,RO]{\thepage}\renewcommand{\headrulewidth}{0.4pt}}
\AtBeginDocument{\hypersetup{pdftitle={\@nazevprace},pdfauthor={\@autorprace}}}
\makeatother
