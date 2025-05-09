% Template Thesis Class (based on article)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template-thesis}[2024/06/10 Custom thesis class for UW template]

\LoadClass{article}

% Helper macro for centered, bold, large headers with vertical space
\newcommand{\thesissectionheader}[1]{%
  \begin{center}
    {\Large\bfseries #1}
  \end{center}
  \vspace{0.75cm}%
}

% Dedication
\def\textofDed#1{\gdef\@textofDed{#1}}  \textofDed{Dedication}
\long\def\dedication#1{\clearpage
  \thispagestyle{plain}
  \thesissectionheader{\MakeUppercase{\@textofDed}}
  \vspace{-0.25cm}
  \begin{center}#1\end{center}
  \vfill
  \let\dedication\relax}

% Acknowledgments
\def\textofAck#1{\gdef\@textofAck{#1}}  \textofAck{Acknowledgments}
\long\def\acknowledgments#1{\clearpage
  \thispagestyle{plain}
  \thesissectionheader{\MakeUppercase{\@textofAck}}
  #1\par
  \vfill
  \let\acknowledgments\relax}

% Glossary Section
\def\glossarysection{\clearpage
  \thispagestyle{plain}
  \addcontentsline{toc}{section}{Glossary}
  \thesissectionheader{GLOSSARY}
}

% List of Figures
\def\textofLoF#1{\gdef\@textofLoF{#1}}  \textofLoF{List of Figures}
\def\listoffigures{\clearpage
    \thispagestyle{plain}
    \addcontentsline{toc}{section}{\protect\@textofLoF}
    \thesissectionheader{\MakeUppercase{\@textofLoF}}
    \hbox to\textwidth{Figure Number \hfill Page}
    {\let\footnotemark\relax  % in case one is in the title
    \@starttoc{lof}
    }
    }

% List of Tables
\def\textofLoT#1{\gdef\@textofLoT{#1}}  \textofLoT{List of Tables}
\def\listoftables{\clearpage
    \thispagestyle{plain}
    \addcontentsline{toc}{section}{\protect\@textofLoT}
    \thesissectionheader{\MakeUppercase{\@textofLoT}}
    \hbox to\textwidth{Table Number \hfill Page}
    {\let\footnotemark\relax  % in case one is in the title
    \@starttoc{lot}
    }
    }

% Centered Table of Contents with correct header and 'Page' label
\def\tableofcontents{\clearpage
    \thispagestyle{plain}
    % Centered header with right-aligned 'Page' label
    {\par\noindent
      \thesissectionheader{TABLE OF CONTENTS}
      \hbox to \textwidth{\hfill \textnormal{\normalsize Page}}\par
    }
    \@starttoc{toc}
}

% Patch TOC entries to always use dotted leaders (including sections)
\makeatletter
\renewcommand{\l@section}[2]{%
  \ifnum \c@tocdepth >\z@ % Only if tocdepth > 0
    \addpenalty{\@secpenalty}%
    \addvspace{1.0em plus 1pt}%
    \@dottedtocline{1}{0em}{2.3em}{#1}{#2}%
  \fi}
\makeatother 

% Remove the patch for thebibliography environment
% Patch bibliography to add to TOC
% (REMOVE THIS SECTION) 