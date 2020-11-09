\ProvidesClass{ldr}[2020/05/30 v1.00 yuh]
\NeedsTeXFormat{LaTeX2e}

\LoadClass{ctexbeamer}


% \setCJKfamilyfont{yahei}{MicrosoftYaHei}
% \newcommand{\yahei}{\CJKfamily{yahei}}

% 坐标轴
\RequirePackage{tikz}

% 分步动画
\RequirePackage{arev}

% 连续参考文献横杠连接
\RequirePackage{cite}

\RequirePackage{ifthen}
\RequirePackage{array}
\RequirePackage{fontspec}

% 数学
\RequirePackage{amsmath,amsfonts,amssymb,mathrsfs}

% 图
\RequirePackage{graphicx}
\graphicspath{{figures/}{figure/}{pictures/}
      {picture/}{pic/}{pics/}{image/}{images/}{../paper/figures/}}

% 图并排
\RequirePackage{subfig}

% 三线表格
\RequirePackage{tabularx}
\RequirePackage{booktabs}


%============================ 我自己用的一些小命令 =========%
% 
% 针对那些使用mendeley这一类软件的，直接复制（导出）过来的参考文献，可以在参考文献处点击跳转到文献所在网址
\providecommand \doibase [0]{http://dx.doi.org/}%

% 正文中有些下角标等公式，我们并不想让它斜体，公式不斜体:如 \eqrm{MoS_2}
\newcommand{\eqrm}[1]{
    $\rm #1 $
}

% 表格文字居中，其实就是相当于表格合并
% 用法 \tabincell{c}{物理//量//单位}
\newcommand{\tabincell}[2]{ \begin{tabular}{ #1 } #2 \end{tabular}}


% 物理单位埃，已经加了 $ $， 不要再放在$$环境里面
\newcommand{\angstrom}{
    $\mathring{\text{A}}$
}


% 右上角的参考文献  \upcite{}
\newcommand{\upcite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}



%============================ 我自己用的一些小命令 =========%

\RequirePackage{tasks}%选择题宏包，tasks环境
\RequirePackage{cases,tabularx}

% 带圈的序号
\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
    circle (.5em) node {\makebox[1em][c]{\small #1}};}}

\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Times New Roman}


\renewcommand{\(}{\begin{columns}}
\renewcommand{\)}{\end{columns}}
\newcommand{\<}[1]{\begin{column}{#1}}
\renewcommand{\>}{\end{column}}



\useoutertheme[subsection=false]{smoothbars}
\useinnertheme[shadow=false]{rounded}
\usecolortheme{orchid}
\usecolortheme{whale}

\setbeamerfont{block title}{size={}}

%%%
%%% Tweak definitions of inner theme to match personal preferences (MODIFY THESE)
%%%

% 列表前面的点点自定义，现在用的是circle，你也可以用 square、ball、
% Itemize items: default (triangle), circle, square, ball
\setbeamertemplate{itemize items}[circle]

% Enumerate items: default, circle, square, ball
\setbeamertemplate{enumerate items}[circle]

% Outline: default, sections numbered, subsections numbered, circle, square, ball, ball unnumbered
\setbeamertemplate{sections/subsections in toc}[square]

% General blocks: 
\setbeamertemplate{blocks}[rounded=false]

% Title page:
% \setbeamertemplate{title page}[default][colsep=-4bp,rounded=false]

% Part page:
\setbeamertemplate{part page}[default][colsep=-4bp,rounded=false]

% Navigation symbols:
\setbeamertemplate{navigation symbols}{}
% 图序号
\setbeamertemplate{caption}[numbered]


% Colors
% \definecolor{sapred}{RGB}{130,36,51}
\definecolor{sapblue}{RGB}{0,103,120}

% Material Colors 0068b7
\definecolor{matred}{HTML}{F44336}
\definecolor{matblue}{HTML}{0068b7}%兰大色
% \definecolor{matblue}{HTML}{2196F3}
\definecolor{matbluelight}{HTML}{BBDEFB}
\definecolor{matbluedark}{HTML}{1976D2}

\setbeamercolor{structure}{fg = matbluedark}
%\setbeamercolor{frametitle}{parent=subsection in head/foot}
%\setbeamercolor{frametitle right}{parent=section in head/foot}
\definecolor{grey}{HTML}{51504A}
\setbeamercolor{section in head/foot}{ bg=matbluedark, fg=white}
\setbeamercolor{footline}{ bg=matbluedark}
\setbeamercolor{title in head/foot}{bg=matbluedark, fg=white}

%\pgfdeclarehorizontalshading[frametitle.bg,frametitle right.bg]{beamer@frametitleshade}{\paperheight}{%
%  color(0pt)=(sapblue);
%  color(\paperwidth)=(sapblue)}

%shadowing
\AtBeginDocument{
    \pgfdeclareverticalshading{b@matshade}{\the\paperwidth}
        {rgb(0pt)=(1,1,1); rgb(3pt)=(0.8,0.8,0.8);rgb(5pt)=(0.75,0.75,0.75)}
}

% Footline: AUTHOR | TITLE | DATE FRAMENUMBER

\defbeamertemplate*{footline}{mat theme}{%
    \begin{beamercolorbox}[wd=\paperwidth,ht=4ex,dp=2.25ex]{title in head/foot}%
        \begin{minipage}[t]{0.48\textwidth}%
            \hskip10pt\insertshortsubtitle%
        \end{minipage}%
        \begin{minipage}[t]{0.48\textwidth}%
            \hfill\insertframenumber{} / \inserttotalframenumber\hskip10pt\vfill%
        \end{minipage}%
    \end{beamercolorbox}%
    \vfill%
}


\RequirePackage{tcolorbox}  
\tcbuselibrary{skins}                                  %  preamble 
\RequirePackage{tikz}                                      %
\usetikzlibrary{shadows,shadings}                      %

\tikzset{myshadow/.style={                             % custom shadow with tikz
         opacity=.16,
         shadow xshift=0.01,
         shadow yshift=-0.02,
         shade,
         shading=axis,
         shading angle=230}
         } 
\tcbset{                                               % set a custom tcolorbox  
        skin=enhanced,                                 % enables use of shadows
        frame style={fill=matblue,drop shadow={myshadow}}, % sets the frame color and the shadow properties
        bottom=5pt,                                    % distance between the body text and the bottom frame
        top=5pt,                                      % distance between the body text and the top frame
        boxrule=0mm,                                   % frame width
        bottomtitle=2mm,                               % distance between the title text and the bottom title frame               
        toptitle=2mm,                                  % distance between the title text and the top title frame
        lefttitle=10pt                                  % title text left margin
}


\setbeamercolor{block body}{bg=matbluelight, fg=black}
\setbeamercolor{block body}{bg=matbluelight, fg=black}
\defbeamertemplate*{block begin}{mat theme}
{
    \begin{tcolorbox}[title=\large \insertblocktitle]
}
\defbeamertemplate*{block end}{mat theme}  
{\end{tcolorbox}\vskip\smallskipamount}

% 最上面的栏目
\defbeamertemplate*{headline}{mat theme}{%
    \leavevmode%
    \begin{beamercolorbox}[wd=\paperwidth]{section in head/foot}%
        \vskip5pt \hskip10pt \insertshorttitle \hfill 
        \insertsectionnavigationhorizontal{.8\textwidth}{\hskip0pt plus1filll}{}
        \vskip4pt%
        \ifx\insertframesubtitle\@empty%
        \pgfuseshading{b@matshade}
        \fi
    \end{beamercolorbox}%
  
}


\setbeamerfont{frametitle}{size=\normalsize, parent=structure}

% 自定义单个界面
\defbeamertemplate*{frametitle}{mat theme}{%
    \nointerlineskip%
    \setbeamercolor{titlebar}{fg=white,bg=matblue}%

    \begin{beamercolorbox}[wd=\paperwidth, ht=6ex]{titlebar}%

    \strut\hskip 10pt \insertframetitle\strut
    \hfill
    \raisebox{-1.8mm}{\includegraphics[width=2.8cm]{lzu-ldr}}

    \pgfuseshading{b@matshade}%
    \end{beamercolorbox}
}

% 自定义首页
\defbeamertemplate*{title page}{ru theme}[1][]
{
\nointerlineskip

\usebeamerfont{subtitle}
%\setbeamercolor{thead}{fg=white,bg=sapred}
% \begin{beamercolorbox}[sep=1em,wd=\paperwidth, ht=2.5cm, dp=0.5cm,right ]{thead}
% \usebeamerfont{author} \insertauthor\par
% \usebeamerfont{institute}
% \insertinstitute\par 
% \end{beamercolorbox}
% \nointerlineskip
\begin{beamercolorbox}[sep=0.5em,wd=\paperwidth,ht=3cm,dp=0.5cm, center]{postit}

    \begin{minipage}[c]{0.22\textwidth}
       \includegraphics[height=0.9\textwidth]{lzu_logo.png}
    \end{minipage}
    \begin{minipage}[c]{0.7\textwidth}
        \usebeamerfont{author} \insertauthor\par
        \vspace{12pt}
        \usebeamerfont{institute}
        \insertinstitute\par 
    \end{minipage}%
\end{beamercolorbox}


\setbeamercolor{postit}{fg=white, bg=matblue}
\begin{beamercolorbox}[sep=1em,wd=\paperwidth,ht=3cm,dp=3cm]{postit}
    \begin{minipage}[t]{\textwidth}
        \vspace{12pt}
        \usebeamerfont{title} {\Huge
        \inserttitle} \par
        \vspace{12pt}
        \usebeamerfont{subtitle} {
        \insertsubtitle}
    \end{minipage}%
    % \begin{minipage}[t]{0.4\textwidth}
    %     \inserttitlegraphic
    % \end{minipage}
\end{beamercolorbox}
%\setbeamercolor{postit}{fg=sapred}
}

