%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{QUST理工类模板}[2026/05/06 0.9.1 Qingdao University of Science and Technology Thesis Template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifprint
\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions\relax

\LoadClass[twoside,openany,zihao=-4,UTF8]{ctexbook}

% 【新增】强制将双面打印时的“空白占位页”替换为普通的单面换页，消灭所有顽固空白页
\let\cleardoublepage\clearpage

\RequirePackage{geometry}
\geometry{a4paper,left=2.5cm,right=2cm,top=1.8cm,bottom=2cm,headheight=14pt,headsep=1.5cm,footskip=1.75cm,includehead,includefoot}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{subcaption}
\RequirePackage{titlesec}
\RequirePackage[subfigure]{tocloft}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{caption}
\RequirePackage{diagbox}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{float}
\RequirePackage[super,square]{natbib}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage[outline]{contour}
\RequirePackage{ulem}
\RequirePackage{listings}
\RequirePackage{etoolbox}

\hypersetup{pdfencoding=auto}
\ifprint
  \hypersetup{colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,urlcolor=black}
\else
  \hypersetup{colorlinks,linkcolor=blue,anchorcolor=green,citecolor=magenta,urlcolor=blue}
\fi

\defaultfontfeatures{Ligatures=TeX}
\setmainfont[Path=字体目录/,UprightFont={Times New Roman.ttf},BoldFont={Times New Roman.ttf},BoldFeatures={FakeBold=4.5},ItalicFont={Times New Roman.ttf},BoldItalicFont={Times New Roman.ttf}]{Times New Roman}
\setCJKmainfont[Path=字体目录/,UprightFont={宋体.ttc},BoldFont={黑体.ttf},ItalicFont={宋体.ttc},AutoFakeSlant=.15]{宋体}
\setCJKsansfont[Path=字体目录/,UprightFont={黑体.ttf},BoldFont={黑体.ttf},AutoFakeBold=2.2]{黑体}
\setCJKmonofont[Path=字体目录/,UprightFont={黑体.ttf}]{黑体}
\setCJKfamilyfont{song}[Path=字体目录/,UprightFont={宋体.ttc},BoldFont={黑体.ttf},ItalicFont={宋体.ttc},AutoFakeSlant=.15]{宋体}
\setCJKfamilyfont{hei}[Path=字体目录/,UprightFont={黑体.ttf},BoldFont={黑体.ttf},AutoFakeBold=2.2]{黑体}
\setCJKfamilyfont{covertitle}[Path=字体目录/,UprightFont={华文新魏.ttf},AutoFakeBold=2.0]{华文新魏}
\renewcommand{\songti}{\CJKfamily{song}}
\renewcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\covertitlefont}{\CJKfamily{covertitle}}
\contourlength{0.06em}

\setCJKfamilyfont{coverhei}[Path=字体目录/,UprightFont={黑体.ttf},AutoFakeBold=3.0]{黑体}
\newcommand{\coverheifont}{\CJKfamily{coverhei}}

% 【新增】专门给目录定义一个“微加粗”的黑体，1.5 倍粗细刚刚好
\setCJKfamilyfont{tochei}[Path=字体目录/,UprightFont={黑体.ttf},AutoFakeBold=1.5]{黑体}
\newcommand{\tocheifont}{\CJKfamily{tochei}}

\linespread{1.3}\selectfont
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\xeCJKsetup{CJKglue=\hskip 0pt plus 0.08\baselineskip}

\ctexset{
  chapter={
    name={},
    number=\arabic{chapter},
    format+=\centering\heiti\zihao{3},
    beforeskip=-1.0cm,
    afterskip=0.75\baselineskip
  },
  section={
    format=\raggedright\heiti\zihao{4},
    number=\arabic{chapter}.\arabic{section},
    beforeskip=.5\baselineskip,
    afterskip=.5\baselineskip
  },
  subsection={
    format+=\heiti\zihao{-4},
    number=\arabic{chapter}.\arabic{section}.\arabic{subsection},
    beforeskip=.5\baselineskip,
    afterskip=.5\baselineskip
  },
  subsubsection={
    format+=\heiti\zihao{-4},
    number=\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
    runin=false,
    beforeskip=.5\baselineskip,
    afterskip=.5\baselineskip
  }
}

\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\captionsetup[figure]{font={small},labelsep=space,justification=centering}
\captionsetup[table]{font={small,bf},labelsep=space,justification=centering} % <-- 加上了 bf 强制加粗表名

\renewcommand{\contentsname}{\hspace*{\fill}\heiti\zihao{3}目\quad 录\hspace*{\fill}}
\setlength\cftbeforetoctitleskip{-1.2cm}
\setlength\cftaftertoctitleskip{18pt}
% ---- 一级标题（章）的字体加粗（黑体） ----
\renewcommand{\cftchapfont}{\tocheifont\bfseries\zihao{4}}
\renewcommand{\cftchappagefont}{\tocheifont\bfseries\zihao{4}}

% ---- 二三级标题字体保持不变（普通细体） ----
\renewcommand{\cftsecfont}{\zihao{-4}}
\renewcommand{\cftsubsecfont}{\zihao{-4}}
\renewcommand{\cftsecpagefont}{\zihao{-4}}
\renewcommand{\cftsubsecpagefont}{\zihao{-4}}

% ---- 引导点（虚线）设置 ----
% \cftdotfill{数字}：数字越小，点越密。默认是 4.5。这里改为 1.2 显著加密。
\renewcommand{\cftchapleader}{\bfseries\cftdotfill{1.2}} % 一级标题虚线：加粗、加密
\renewcommand{\cftsecleader}{\cftdotfill{1.2}}           % 二级标题虚线：不加粗、加密
\renewcommand{\cftsubsecleader}{\cftdotfill{1.2}}        % 三级标题虚线：不加粗、加密
% ---- 2. 序号数字和文字间隔变小（把数字占用的隐藏盒子变窄） ----
\setlength{\cftchapnumwidth}{1.2em}   % 1 绪论（原来是 2em）
\setlength{\cftsecnumwidth}{1.6em}    % 1.1 半导体...（原来是 3.2em）
\setlength{\cftsubsecnumwidth}{2.2em} % 1.1.1 半导体...（原来是 4.6em）
% 缩进也稍微配合调小一点，保持阶梯感
\setlength{\cftchapindent}{0pt}
\setlength{\cftsecindent}{1.2em}
\setlength{\cftsubsecindent}{2.8em}
% ---- 3. 每行之间间隔变小（消除一级大章上方的巨大空隙） ----
\setlength{\cftbeforechapskip}{4pt}   % 默认是 1em，改小就能压扁“前言”和“绪论”之间的缝隙
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\makeatletter
\newcommand\thickuuline{%
  \bgroup
  \markoverwith{%
    \lower0.7ex\hbox{%
      \vbox{%
        \hrule width .2em height \ULthickness
        \vskip 1.0pt
        \hrule width .2em height \ULthickness
      }%
    }%
  }%
  \ULon
}

\newtoks\title
\newtoks\titleEn
\newtoks\titleEng % <-- 这是新增的“真正的英文题目”变量
\newtoks\school
\newtoks\major
\newtoks\classinfo
\newtoks\name
\newtoks\studentid
\newtoks\supervisor
\newtoks\cosupervisor
\newtoks\date

\newcommand{\@@dateY}{}\newcommand{\@@dateM}{}\newcommand{\@@dateD}{}
\newcommand{\dateymd}[3]{%
  \renewcommand{\@@dateY}{#1}%
  \renewcommand{\@@dateM}{#2}%
  \renewcommand{\@@dateD}{#3}%
  \date={#1\,年\,#2\,月\,#3\,日}}

\newcommand{\class}[1]{\classinfo={#1}}
\newcommand{\studentnumber}[1]{\studentid={#1}}
\newcommand{\tutor}[1]{\cosupervisor={#1}}
\newcommand{\qkusttitleboth}{\the\title\the\titleEn}
\newcommand{\englishtitle}[1]{\titleEng={#1}} % <-- 方便在封面填写的命令

\newcommand{\qkust@headerline}[1]{%
  \fancyhf{}
  \fancyhead[C]{\zihao{5}\songti #1}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand\headrulewidth{0.4pt}
  \renewcommand\footrulewidth{0pt}}

\fancypagestyle{qkustmain-odd}{%
  \qkust@headerline{青岛科技大学本科毕业设计（论文）}}

\fancypagestyle{qkustmain-even}{%
  \qkust@headerline{\qkusttitleboth}}

\fancypagestyle{qkustcnabstract}{%
  \qkust@headerline{中文摘要}}

\fancypagestyle{qkustenabstract}{%
  \qkust@headerline{ABSTRACT}}

\fancypagestyle{qkustreference}{%
  \qkust@headerline{参考文献}}

\fancypagestyle{qkustappendix}{%
  \qkust@headerline{附录}}

\fancypagestyle{qkustthanks}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand\headrulewidth{0pt}
  \renewcommand\footrulewidth{0pt}}

\fancypagestyle{qkustblankheader}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand\headrulewidth{0pt}
  \renewcommand\footrulewidth{0pt}}

% 【新增】强行接管默认的 plain 样式。自动判断奇偶页，奇数页显示校名，偶数页显示标题。
% 这将彻底修复所有正文大章（如：结论、第一章）第一页没有页眉的问题！
\fancypagestyle{plain}{%
  \qkust@headerline{\ifodd\value{page}青岛科技大学本科毕业设计（论文）\else\qkusttitleboth\fi}
}

\newcommand{\qkust@applymainpagestyle}{%
  \ifodd\value{page}
    \thispagestyle{qkustmain-odd}%
  \else
    \thispagestyle{qkustmain-even}%
  \fi}

\pretocmd{\chapter}{\clearpage\qkust@applymainpagestyle}{}{}
\pretocmd{\section}{\qkust@applymainpagestyle}{}{}
\pretocmd{\subsection}{\qkust@applymainpagestyle}{}{}

\newcommand{\qkust@coverline}[2]{%
  \noindent\hspace*{5.5cm}%
  \makebox[4em][l]{\coverheifont\bfseries\zihao{4}#1}% 这里用了超粗黑体
  \hspace{0.2em}\uline{\makebox[4.5cm][c]{\heiti\zihao{4}#2}}\par
  \vspace{0.7cm}}

\newcommand{\qkust@covercenterline}[1]{%
  \begin{center}
    \coverheifont\bfseries\zihao{4}#1 % 这里用了超粗黑体
  \end{center}}

\def\maketitle{%
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{center}
      {\covertitlefont\bfseries\zihao{1} 青\hspace{0.4em}岛\hspace{0.4em}科\hspace{0.4em}技\hspace{0.4em}大\hspace{0.4em}学\par}
      \vspace{0.2cm}
      {\begingroup\renewcommand{\ULthickness}{1.2pt}\coverheifont\bfseries\zihao{2}\thickuuline{\strut 本\hspace{0.3em}科\hspace{0.3em}毕\hspace{0.3em}业\hspace{0.3em}设\hspace{0.3em}计（论文）}\par\endgroup}
    \end{center}
    \vspace{1.6cm}
    \begingroup
    \setstretch{1.3}
    \noindent\hspace*{2.5cm}%
    \makebox[4em][l]{\coverheifont\bfseries\zihao{4}题\hspace{1em}目}%
    \hspace{0.2em}\uline{\makebox[8.5cm][c]{\heiti\zihao{4}\the\title}}\par
    \vspace{0.55cm}
    \noindent\hspace*{2.5cm}\makebox[4em][l]{}%
    \hspace{0.2em}\uline{\makebox[8.5cm][c]{\heiti\zihao{4}\the\titleEn}}\par
    \vspace{2.8cm}
    \qkust@coverline{指导教师}{\the\supervisor}
    \qkust@coverline{辅导教师}{\the\cosupervisor}
    \qkust@coverline{学生姓名}{\the\name}
    \qkust@coverline{学生学号}{\the\studentid}
    \vspace{1.4cm}
    \qkust@covercenterline{%
      \uline{\makebox[6.0cm][c]{\mdseries\heiti\zihao{4}\the\school}}\hspace{0.18em}学院\hspace{0.6em}%
      \uline{\makebox[4.0cm][c]{\mdseries\heiti\zihao{4}\the\major}}\hspace{0.18em}专业\hspace{0.6em}%
      \uline{\makebox[1.4cm][c]{\mdseries\heiti\zihao{4}\the\classinfo}}\hspace{0.18em}班}
    \vspace{1.4cm}
    \qkust@covercenterline{%
      \uline{\makebox[1.6cm][c]{\mdseries\heiti\zihao{4}\@@dateY}}\hspace{0.1em}年%
      \hspace{0.4em}\uline{\makebox[0.9cm][c]{\mdseries\heiti\zihao{4}\@@dateM}}\hspace{0.1em}月%
      \hspace{0.4em}\uline{\makebox[0.9cm][c]{\mdseries\heiti\zihao{4}\@@dateD}}\hspace{0.1em}日}
    \endgroup
\end{titlepage}}

\def\declaration{}

\newcommand{\varKeyword}{}
\newcommand{\keyword}[1]{\renewcommand{\varKeyword}{#1}}

\newenvironment{abstract}[1]{%
  \clearpage
  \pagestyle{qkustcnabstract}
  \thispagestyle{qkustcnabstract}
  \pagenumbering{Roman}
  \setcounter{page}{1}
  \keyword{#1}
  \begin{center}
    % 【新增】自动调取封面填写的中文题目：三号( \zihao{3} )、黑体( \heiti )、居中
    {\heiti\zihao{3}\the\title\par}
    \vspace{0.8cm}
    % 【新增】把你写在英文变量里的“第二行中文题目”也打印出来
    {\heiti\zihao{3}\the\titleEn\par}
    \vspace{0.8cm} % 题目与“摘要”二字之间的垂直间距

    % 摘要标题：三号、黑体、中间空两个半角（\quad）
    {\heiti\zihao{3} 摘\quad 要\par}
  \end{center}
  \vspace{0.4cm} % “摘要”二字与正文之间的垂直间距

  % 正文：小四( \zihao{-4} )、宋体( \songti )
  \zihao{-4}\songti
}{%
  \par\vspace{1.5em} % 正文结束与关键词之间的间距
  % 关键词标签：四号( \zihao{4} )、黑体( \heiti )，顶格不缩进( \noindent )
  % 关键词内容：小四( \zihao{-4} )、宋体( \songti )
  \noindent{\heiti\zihao{4} 关键词：}{\zihao{-4}\songti\varKeyword}\par
  \clearpage}

\newenvironment{abstractEn}[1]{%
  \clearpage
  \setcounter{page}{1} % 【新增】强制页码重新从 1 (罗马数字 I) 开始
  \pagestyle{qkustenabstract}
  \thispagestyle{qkustenabstract}
  \keyword{#1}
  \begin{center}
    % 【新增】自动调取你填写的真正英文题目：三号、加粗、居中
    % 增加了 \setstretch{1.5} 稍微拉开多行英文题目的行距，更美观
    {\begingroup\setstretch{1.5}\bfseries\zihao{3}\the\titleEng\par\endgroup}
    \vspace{1.5cm} % 英文题目与 ABSTRACT 之间的距离

    {\bfseries\zihao{3} ABSTRACT\par}
  \end{center}

  %ABSTRACT 和 正文 之间的距离
  \vspace{1.0cm}

  % 【修改】英文正文字号改为小四 (\zihao{-4})
  \zihao{5}
}{%
  %正文 和 KEY WORDS 之间的距离
  \par\vspace{1.5cm}
  \noindent{\bfseries\zihao{4} KEY WORDS: }{\zihao{-4}\varKeyword}\par
  \clearpage}

\renewenvironment{thanks}{%
  \clearpage
  \pagestyle{empty} % 【修改】去掉页码
  \chapter*{致谢}
  \thispagestyle{empty} % 【修改】强行洗掉本页所有的页眉和页码
  \addcontentsline{toc}{chapter}{致谢}
}{\clearpage}

% ---- 顺手修复附录也会缺失页眉的潜在 Bug ----
\renewenvironment{appendix}{%
  \clearpage
  \pagestyle{qkustappendix}
  \chapter*{附录}
  \thispagestyle{qkustappendix} % 【修改点】：同样移到了 chapter 后面
  \addcontentsline{toc}{chapter}{附录}
}{\clearpage}

% ---- 修复前言缺失页眉 ----
\newcommand{\preface}{%
  \clearpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \pagestyle{qkustmain-odd}
  \chapter*{前言}
  \thispagestyle{qkustmain-odd} % 【修改点】：移到了 chapter 后面，强行恢复页眉！
  \addcontentsline{toc}{chapter}{前言}}

\newcommand{\qkusttableofcontents}{%
  \clearpage
  \pagestyle{empty} % 【修改】全局空样式，去掉页码
  \ctexset{chapter={pagestyle=empty}} % 【修改】章标题页空样式，去掉页码
  \tocloftpagestyle{empty} % 【关键】废掉 tocloft 宏包强加的样式，去掉页码和页眉

  \tableofcontents
  \clearpage
  \ctexset{chapter={pagestyle=plain}} % 恢复后续正文默认样式
}

\newcommand{\qkustmainmatter}{%
  \mainmatter
  \pagestyle{qkustmain-odd}}

\newcommand{\reference}[1]{%
  \clearpage
  \pagestyle{qkustreference}
  % 【关键修改】：不再使用 \thispagestyle，而是强制规定接下来的 chapter 必须使用参考文献的页眉！
  \ctexset{chapter={pagestyle=qkustreference}}
  \nocite{*}
  \bibliographystyle{参考文献样式}
  \phantomsection
  \addcontentsline{toc}{chapter}{参考文献}
  \zihao{-4}\songti
  \bibliography{#1}}

\makeatother

\lstset{
  tabsize=4,
  frame=single,
  keywordstyle=\bfseries,
  showstringspaces=false,
  keepspaces=true,
  numbers=left,
  stepnumber=1,
  numberstyle=\tiny,
  basicstyle=\footnotesize,
  showspaces=false,
  flexiblecolumns=true,
  breaklines=true,
  breakautoindent=true,
  breakindent=4em,
  aboveskip=1em,
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,
  framexbottommargin=2pt,
  abovecaptionskip=-3pt,
  belowcaptionskip=3pt,
  xleftmargin=4em,
  xrightmargin=4em,
  extendedchars=false,
  columns=flexible
}
