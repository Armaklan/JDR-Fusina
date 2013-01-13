\NeedsTeXFormat{LaTeX2e}
 
\ProvidesClass{FusinaClass}[2007/09/19 Classe personnelle, V1.0]
 
% *************************************************
%                    classe de base
% *************************************************
\LoadClass[a4paper, 10pt]{report}

% *************************************************
%                    extensions
% *************************************************
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{cmbright}
\renewcommand*\familydefault{\sfdefault} 
\RequirePackage[normalem]{ulem}
\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{makeidx}
\RequirePackage[frenchb]{babel}
% ****** Pour mettre des puces à la place des tirets dans les listes
\renewcommand{\FrenchLabelItem}{\textbullet}
\RequirePackage{verbatim}
\RequirePackage{xcolor}
\RequirePackage{calc}
\RequirePackage{url}
\RequirePackage{multicol}
% ******* Définition des marges *********
\RequirePackage[margin=2.5cm]{geometry}
% ******* Entete et pied de pages *********
\RequirePackage{fancyhdr}
% ******* Bordure autour de la page *********
\RequirePackage[absolute]{textpos}
% ******* Boîtes arrondies *******
\RequirePackage{fancybox}

\setlength{\columnsep}{1cm}

%-------------PDF-------------------------------------------------------------
 
%Passage au PDF de qualité
\usepackage[pdftex, % Paramétrage de la navigation
    bookmarks = true, % Signets
    bookmarksnumbered = true, % Signets numérotés
    pdfpagemode = true, % Signets/vignettes fermé à l'ouverture
    pdfstartview = FitH, % La page prend toute la largeur
    pdfpagelayout = TwoColumn, % Vue par page
    colorlinks = false, % Liens en couleur
    urlcolor = purple, % Couleur des liens externes
    pdfborder = {0 0 0} % Style de bordure : ici, rien
    ]{hyperref}% % Utilisation de HyperTeX
 
\hypersetup{ % Information sur le document
    pdfauthor = {Lionel "Armaklan" Zuber \& Sébastien "Segle" Gélé}, % Auteurs
    pdftitle = {Fusina - Fun, Simple, Narratif}, % Titre du document
    pdfsubject = {}, % Sujet
    pdfkeywords = {}, % Mots-clefs
    pdfcreator = {PdfLatex}, % Logiciel qui a crée le document
    pdfproducer = {} % Personne/Société qui a produit le pdf
    plainpages = true}

% *************************************************
%                    Mise en forme
%                Du titre du Document
% *************************************************    
\renewcommand{\maketitle}{
  \null
  \thispagestyle{empty}%
  \vfill
  \begin{center}\leavevmode
    \normalfont
    {\LARGE \@title\par}%
    \vskip 1cm
    {\Large \@author\par}%
    \vskip 1cm
    {Version du \@date\par}%
  \end{center}%
  \vfill
  \null
  \cleardoublepage
}

% *************************************************
%             Espacement des paragraphes
%                  et interlignes
% *************************************************
\setlength{\parskip}{1.5ex plus .7ex minus .7ex}
\renewcommand{\baselinestretch}{1.2}

% *************************************************
%             Entête de Chapitre
% *************************************************
\renewcommand{\chapter} {      	   % Starts new page.
   \thispagestyle{plain}           % Page style of chapter page is 'plain'
   \global\@topnum\z@              % Prevents figures from going at top of page.
   \@afterindenttrue               % Inserts indent in first paragraph.  Change
   \secdef\@chapter\@schapter}     % to \@afterindentfalse to remove indent.

\@addtoreset{chapter}{part}
    
\renewcommand{\@makechapterhead}[1] {    
	% Heading for \chapter command
  	{ 	
  		\vskip 25pt  
  		\parindent 0pt \centering   
    	\ifnum \c@secnumdepth >\m@ne         		% IF secnumdepth > -1 THEN
      	\makebox[450pt]{
      	    \raisebox{-1.9ex}{
      	        \includegraphics[scale=0.3]{MEP/chapitre_gauche}
      	        }
      	    \hspace{0.0ex plus .1ex minus .2ex}
      		\textcolor{black}{
      			\large\bf Chapitre \thechapter
      			\hspace{0.0ex plus .3ex minus .2ex} :  % Space between number and the ":".
  				\hspace{0.0ex plus .2ex minus .2ex}  \fi    % Space between ":" and title
    			\large \bf
    			#1									% Title.
	    	}
	    	\hspace{0.0ex plus .3ex minus .2ex}
	    	\raisebox{-1.9ex}{
	    	    \includegraphics[scale=0.3]{MEP/chapitre_droite}
	        }
	    }
	    \par	
	    \nobreak 								% TeX penalty to prevent page break.
    	\vskip 25pt                          		% Space between title and text.
  	} 
}

\renewcommand{\@makeschapterhead}[1] {    
	% Heading for \chapter* command
  	{ 	
  		\vskip 25pt  
  		\parindent 0pt \centering   
 	    \huge \bf #1
	    \par	
	    \nobreak 								% TeX penalty to prevent page break.
    	\vskip 15pt                          		% Space between title and text.
  	} 
}
% *************************************************
%             Entête de Section
% *************************************************
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
             {-3.5ex \@plus -1ex \@minus -.2ex}%
             {2.3ex \@plus-.2ex}%
             {\bf\large}}

% *************************************************
%            Définition des zones exemples
% *************************************************
\definecolor{gris25}{rgb}{0.85,0.85,0.85}
\definecolor{vert15}{rgb}{0.90,0.99,0.90}
\definecolor{rouge15}{rgb}{0.99,0.90,0.90}
\definecolor{jaune15}{rgb}{0.99,0.99,0.69}
\definecolor{bleu15}{rgb}{0.79,0.89,0.99}

\newcommand{\minititre}[1] {
    \parbox{400pt}{
        \vskip -25pt
        \begin{center}
            \textbf {
                #1
            }
        \end{center}    
        \par
    }
}
             
\newcommand{\exemple}[2] {
        \vskip 15pt 
      	\ovalbox{
            \parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{MEP/exemple.png} 
                }
                % On remonte le titre de l'encadré
                \vskip -40pt 
                \minititre {
                    #1
                }
                % Et on remonte un peu le contenu, mais pas trop
                \vskip 5pt       
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
    	    }		
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones idée scénario
% *************************************************

\newcommand{\scenario}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{MEP/idee.png} 
                } 
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones notes de conceptions
% *************************************************
             
\newcommand{\note}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{MEP/note_conception.png} 
                }
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones option
% *************************************************
             
\newcommand{\option}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[400pt][r]{
                    \includegraphics[scale=0.35]{MEP/option.png} 
                }
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des zones remarque
% *************************************************
             
\newcommand{\remarque}[2] {
        \vskip 15pt 
      	\ovalbox{
      		\parbox{400pt}{
                \parindent 5pt 
                \parskip 1ex
                \makebox[390pt][r]{
                    \includegraphics[scale=0.35]{MEP/remarque.png} 
                }
                \vskip -40pt 
                \minititre {
                    #1
                }
                \vskip 5pt 
                \itshape        
                #2
                \upshape
                \vskip 20pt                      
	    	}
	    	\par	
	    	\nobreak 								% TeX penalty to prevent page break.
    	}
    	\vskip 15pt 
}

% *************************************************
%            Défintion des
%       Entête et pied de page
% *************************************************
\fancypagestyle{plain}{%
	\fancyhf{}
    \lhead{
        \begin{textblock*}{3cm}(6mm,8mm) 
        \includegraphics[scale=0.3]{MEP/fusina_haut_gauche} 
        \end{textblock*} 
    }
    \rhead{
        \begin{textblock*}{3cm}(14.7cm,8mm) 
        \includegraphics[scale=0.3]{MEP/fusina_haut_droite} 
        \end{textblock*} 
    }
    \chead{Fusina}
    \cfoot{\bfseries\thepage}     
    \lfoot{
        \begin{textblock*}{3cm}(6mm,23.2cm) 
        \includegraphics[scale=0.3]{MEP/fusina_bas_gauche} 
        \end{textblock*} 
    }
    \rfoot{
        \begin{textblock*}{3cm}(14.7cm,23.2cm) 
        \includegraphics[scale=0.3]{MEP/fusina_bas_droite} 
        \end{textblock*} 
    }
	\renewcommand{\headrulewidth}{0pt}  
	\renewcommand{\footrulewidth}{0pt}}  
  
  
  \fancypagestyle{couv}{%
    \fancyhf{}
    \lhead{
        \begin{textblock*}{3cm}(0mm,0mm)
        \includegraphics[width=21cm, height=29.7cm]{MEP/couv_fusina}
        \end{textblock*}
    }
    \cfoot{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}}
    
\pagestyle{plain}
