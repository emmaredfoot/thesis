% Author: Christopher Goes, goesc@acm.org (Alternate: goes8945@alumni.uidaho.edu)
% Developed from Kai's UIThesis class file.

% Sets up the class
\LoadClass[oneside]{book}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UIdahoMastersThesis}[2017/04/03 University of Idaho Masters Thesis]

% We'll be changing some low-level properties in this class file (a typical thing to do). These are usually defined using the @ symbol to ensure that they are not accidentally overwritten. To do so, we need to change how @ is interpreted: https://tex.stackexchange.com/questions/8351
\makeatletter

% =========================================== SECTIONS =========================================== %
% This file contains the following sections in the following order:
  % PACKAGES - "packages" are collections of macros that add formatting and functionality
  % DOC SETUP - defines doc-wide style and settings; includes header/footer, ToC+lists, Sections
  % PAGE - creates customized pages, including the Title and Authorization pages
  % CUSTOM ENVIRONMENTS - set up and define custom environments
  % CUSTOM COMMANDS - set up and define custom LaTeX commands
  % Code listings - define style for listings. Includes example for YAML
  
% =========================================== PACKAGES =========================================== %
% Add on features. You can look up particular packages, including downloading their documentation,
  % on ctan.org. The listing below has been put in alphabetical order, and grouped in chunks for
  % easier reading. It's also a good idea to include a brief summary of a package, so that you can
  % quickly look up why you added it.

% Checks if acronyms are defined at least once, builds acronym list: https://ctan.org/pkg/acronym
% Use [nolist,nohyperlinks] to not write list of acronyms and not put hyperlinks to entries in list.
\RequirePackage{acronym}
% Additional features for modified boxes: https://ctan.org/pkg/adjustbox
\RequirePackage{adjustbox}
% Runs the given command just before going to the next page: https://ctan.org/pkg/afterpage. A 
  % useful example is to force floats (images, tables, etc) to appear on the next page by issuing 
  % \afterpage{\clearpage}
\RequirePackage{afterpage}
% Provides additional formatting options for tabular and array: https://ctan.org/pkg/array
\RequirePackage{array}
% Core math symbol and typesetting package: https://ctan.org/pkg/amsmath
\RequirePackage{amsmath}
% Extended symbol collection; loads amsfonts to provide mathematics fonts, symbols, subscript and 
  % Greek letters, etc: https://ctan.org/pkg/amsfonts
  % https://tex.stackexchange.com/questions/32100/what-does-each-ams-package-do
\RequirePackage{amssymb}
% Expands captioning style options: https://ctan.org/pkg/caption
\RequirePackage{caption}

% Greatly extends flexibility for header/footer formatting: https://ctan.org/pkg/fancyhdr
\RequirePackage{fancyhdr}
% Displays value of LaTeX counters in multiple formats: https://ctan.org/pkg/fmtcount
\RequirePackage{fmtcount}
% Provides some symbols (degree, etc) in multiple environments: https://ctan.org/pkg/gensymb
\RequirePackage{gensymb}
% Simplifies setting up page geometry: https://ctan.org/pkg/geometry
\RequirePackage{geometry}
% Allows placement of graphics: https://ctan.org/pkg/graphicx
\RequirePackage{graphicx}

% Indents first paragraph after section header: https://ctan.org/pkg/indentfirst
\RequirePackage{indentfirst}
% An environment to style code blocks: https://ctan.org/pkg/listings
\RequirePackage{listings}
% Provides formatting for chemical elements: https://ctan.org/pkg/mhchem
\RequirePackage[version=4]{mhchem}
% Create tabular (table) cells spanning multiple rows: https://ctan.org/pkg/multirow
\RequirePackage{multirow}

% Provides options for line spacing: https://ctan.org/pkg/setspace
\RequirePackage{setspace}
% Allows captions for subfigures and the like: https://ctan.org/pkg/subcaption
\RequirePackage{subcaption}
% An extremely powerful graphic element tool: https://www.sharelatex.com/learn/TikZ_package
\RequirePackage{tikz}
% More flexible styling for sections, titles, etc: https://ctan.org/pkg/titlesec
\RequirePackage{titlesec}
% Works with titlesec to handle ToC/LoF/LoT entries: https://ctan.org/pkg/titletoc
\RequirePackage{titletoc}

% Makes links, emails, etc easier: https://ctan.org/pkg/url
\RequirePackage{url}
% Flexible foreground (text, rules) and background color management: https://ctan.org/pkg/xcolor
  % tex.stackexchange.com/questions/89763/when-to-use-the-xcolor-package-instead-of-the-color...
\RequirePackage{xcolor}
% Allows for some boolean logic in defining macros: https://ctan.org/pkg/xifthen
\RequirePackage{xifthen}

% ========================================== DOC SETUP =========================================== %
% This section defines some basic things about the document, including margins, paper size, header
  % and footer, table of contents, etc.
  
% Set margins
\geometry{letterpaper,
	left= 1.2in,
	right=1in,
	bottom=1in}

% ==------------------------------------- Header / Footer --------------------------------------== %
% Set page number to top right
\pagestyle{fancy}
\fancyhf{}
\fancyfoot{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}

\fancypagestyle{plain}{\fancyhf{}
\fancyfoot{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}}

% ==-------------------------------- Table of Contents / lists ---------------------------------== %
% Allows appendices to appear in the ToC: https://tex.stackexchange.com/a/231875
\g@addto@macro{\appendix}{%
  \renewcommand\chaptername{Appendix}%
  \addtocontents{toc}{\protect\renewcommand*{\protect\chaptername}{\protect\appendixname}}%
}

% Change TOC name to Table of Contents
\renewcommand{\contentsname}{Table of Contents}

% Define command to match the default dot fill for the book class in the TOC
\newcommand \Dotfill {\leavevmode \cleaders \hb@xt@ 0.9em{\hss .\hss }\hfill \kern \z@}

% Changes default indenting in list of figures from 1.5em/2.3em to 0em/2.3em.
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}
\let\l@table\l@figure

% ==----------------------------------------- Sections -----------------------------------------== %
% Configure the section / subsection numbering and format
\titleformat{\chapter}[block]{\scshape\LARGE}{\centering\chaptertitlename\  \thechapter:}{1ex}{\centering}{}
	\titlespacing{\chapter}{0pt}{-40pt}{20pt}

\titleformat{\section}[hang]{\scshape\Large}{\thesection}{1ex}{}
    \titlespacing{\section}{0pt}{0pt}{10pt}
	%\titlespacing*{\section}{0pt}{-50pt}{40pt}

\titleformat{\subsection}[hang]{\scshape\large}{\thesubsection}{1ex}{}
    \titlespacing{\subsection}{0pt}{0pt}{10pt}
	%\titlespacing*{\subsection}{0pt}{-50pt}{40pt}

% Change the chapter and section display format in the TOC
\titlecontents{chapter}                     % <section-type>
[0pt]        								% <left>
{}											% <above-code>
{\scshape\chaptername\ \thecontentslabel:\ }% <numbered-entry-format>
{}											% <numberless-entry-format>
{\Dotfill\contentspage}						% <filler-page-format>

\titlecontents{section}						% <section-type>
[10pt]										% <left>
{\scshape}									% <above-code>
{}											% <numbered-entry-format>
{\contentslabel}							% <numberless-entry-format>
{\Dotfill\contentspage}						% <filler-page-format>

\titlecontents{subsection}					%
[20pt]										%
{\scshape}									%
{}											%
{\contentslabel}							%
{\Dotfill\contentspage}						%

% ========================================= PAGE SETUPS ========================================== %
% This section defines some custom pages, allowing us to collect metadata in a central place (in
  % the preamble). That allows us to reference that metadata later in the document if we want.

% ==---------------------------------------- Title Page ----------------------------------------== %
\newcommand{\thesistitlepage}{\thispagestyle{empty}
	\vspace*{0.5in}
		\begin{center}
			\textsc{\@title}\\
			\vspace{48pt}
			A Thesis\\
			Presented in Partial Fulfillment of the Requirements for the\\
			Degree of \@degree\\
			with a\\
			Major in \@major\\
			in the\\
			College of Graduate Studies\\
			University of Idaho\\
			by\\
			\@author\\
			\vspace{60pt}
			Major Professor: \@advisor\\
			Committee Members: \@cmone; \@cmtwo\\
			Department Administrator: \@deptadmin\\
			\vspace{80pt}
			\@graddate
		\end{center} }

% ==------------------------------------ Authorization Page ------------------------------------== %
\newcommand{\authorizationpage}{\begin{center}
		{\LARGE\textsc{Authorization to Submit Thesis}}
	\end{center}
	\vspace{10pt}
	
This thesis of \@author, submitted for the degree of \@degree\ with a Major in \@major\ and titled ``\@title," has been reviewed in final form. Permission, as indicated by the signatures and dates below is now granted to submit final copies for the College of Graduate Studies for approval.\par
    
	\vspace{1in}
	\begin{table}[ht]
		\centering
		\begin{tabular}{p{1.5in}ll}
			Advisor:           & \makebox[2.5in]{\hrulefill}   	& \makebox[1.5in]{\hrulefill}\\
							   & \@advisor					   	& Date\\[0.5in]
			Committee Members: & \makebox[2.5in]{\hrulefill}   	& \makebox[1.5in]{\hrulefill}\\
		                       & \@cmone						& Date\\[0.5in]
		                       & \makebox[2.5in]{\hrulefill}   	& \makebox[1.5in]{\hrulefill}\\
		                       & \@cmtwo						& Date\\[0.5in]
		    Department Chair:  & \makebox[2.5in]{\hrulefill}   	& \makebox[1.5in]{\hrulefill}\\
		                       & \@deptadmin					& Date\\
		\end{tabular}
	\end{table}}

% ====================================== CUSTOM ENVIRONMENTS ===================================== %
% Environments in LaTeX are macros that wrap around the code inside, and can change how that 
  % information is interpreted. For example, in a tabular environment, & have a different meaning. 
  % Generally, environments are signaled with \begin{environment} and end with \end{environment}.
  % https://www.sharelatex.com/learn/Environments

% Define an environment that vertically centers text inside
\newenvironment{vplace}[1][1]{%
	\par
	\vspace*{\stretch{#1}}
	}{%
	\par
	\vspace{\stretch{1}}%
	}
    
% ======================================== CUSTOM COMMANDS ======================================= %
% Commands in LaTeX are macros that do perform some action. Everything with a \ in front (other than
  % escaped characters) are commands. You can do a lot with these.
  % https://www.sharelatex.com/learn/Defining_your_own_commands

% Define the metadata that we're collecting for the title page via commands.
\newcommand{\thesisdegree}[1]{
	\def\@degree{#1}}

\newcommand{\advisor}[1]{
	\def\@advisor{#1}}

\newcommand{\major}[1]{
	\def\@major{#1}}

\newcommand{\cmone}[1]{
	\def\@cmone{#1}}

\newcommand{\cmtwo}[1]{
	\def\@cmtwo{#1}}

\newcommand{\deptadmin}[1]{
	\def\@deptadmin{#1}}

\newcommand{\graddate}[1]{
	\def\@graddate{#1}}

\newcommand*{\SignatureAndDate}[1]{%
	\noindent\hspace{1in}\makebox[2.5in]{\hrulefill} \hfill\makebox[1.5in]{\hrulefill}\\%
	\noindent\hspace{1in}\makebox[2.5in][l]{#1}      \hfill\makebox[1.5in][l]{Date}%
}%

% Define a front matter section, so we include them in the ToC, but number the pages differently.
\newcommand\frontmattersection[1]{%
	\addcontentsline{toc}{chapter}{\scshape#1}%
	\chaptermark{#1}}

% Unknown what this is for.
\newcommand\immediateaddcontentsline[3]{%
	\begingroup
	\let\origwrite\write
	\def\write{\immediate\origwrite}%
	\addcontentsline{#1}{#2}{#3}%
	\endgroup
}

% More custom commands to add niceties
\newcommand{\etal}{\textit{et al}.\ }		% Makes sure all et al's are formatted the same
\newcommand{\ie}{\textit{i}.\textit{e}.\ }  % Makes sure all i.e.'s are formatted the same
\newcommand{\eg}{\textit{e}.\textit{g}.\ }  % Makes sure all e.g.'s are formatted the same
\newcommand{\type}[1]{\texttt{#1}}			% Provides typewritter font
\newcommand{\tbf}[1]{\textbf{#1}}			% Shortens the bold macro

% Easy equations. Usage: \eq{ <equation> }
\newcommand{\eq}[1]{\begin{align*}#1\end{align*}}

% Short isotope macro. Usage: \iso{Elem}{A}. Designed to be typed as read (i.e. \iso{C}{14} as 
  % "Carbon-14"), but presented in proper notation. To type in correct notation (ie \iso{14}{C}, 
  % switch the positions of #1 and #2 below.
\newcommand{\iso}[2]{\textsuperscript{#2}#1}

% Long isotope macro. Usage: \isotope{Elem}{A}{Z}{Charge}{ShowNeutrons?(y/n)}
\newcommand{\isotope}[5]{
    % Uses both the mhchem package and the xifthen package.
    % If{test} {true case} {else case}
    \ifthenelse{ \equal{#5}{y} \OR \equal{#5}{Y} } {
    	% Use pgfmathparse, from tikz package, twice. First time to catch negative values (- symbol 
          % otherwise not printed), second time to compute N = A-Z.
        \pgfmathparse{int(#4)}
        \ce{ ^{#2}_{#3}#1^{\pgfmathresult}_{\pgfmathparse{int(#2-#3)}\pgfmathresult} }
    } {
    	\ce{ ^{#2}_{#3}#1^{#4} }
    }
}

% ======================================== Code Listings ========================================= %
% This allows you to put in code written for your project, and have LaTeX format it for easy reading.
  % You can define multiple languages, and have uniform colors for it as well. It's non-trivial to
  % get going, but pretty powerful after that.
  
% Rename list of listings to list of code listings, per handbook requirements
\renewcommand{\lstlistlistingname}{List of Code Listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% Listing's style for highlighting code
\lstdefinestyle{code}{
	backgroundcolor=\color{backcolour},
	commentstyle=\color{codegreen},
	keywordstyle=\color{magenta},
	numberstyle=\tiny\color{codegray},
	stringstyle=\color{codepurple},
	basicstyle=\ttfamily\singlespacing,
	breakatwhitespace=false,
	breaklines=true,
	captionpos=b,
	keepspaces=true,
	numbers=left,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2,
	postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\color{red}\hookrightarrow\space}}
}

% ==------------------------------------------- YAML -------------------------------------------== %
% Ref:  http://tex.stackexchange.com/a/145583 and http://tex.stackexchange.com/a/152856
  % Example usage: \lstinputlisting[firstline=1, firstnumber=1, language=yaml, caption=Invoice]{Code/example.yaml}
\newcommand\YAMLkeystyle{\color{black}\bfseries}
\newcommand\YAMLvaluestyle{\color{blue}\mdseries}

\lstdefinelanguage{yaml}
{
  keywords={true,false,null,y,n},
  sensitive=false,
  comment=[l]{\#},
  morecomment=[s]{/*}{*/},
  moredelim=[l][\color{orange}]{\&},
  moredelim=[l][\color{magenta}]{*},
  morestring=[b]',
  morestring=[b]"
}

% ==------------------------------------------- LANG -------------------------------------------== %
% Put some other language definition here!


% End the document by resetting the @ symbol back to a special character
\makeatother