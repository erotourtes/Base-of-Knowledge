---
title: "Latex"
date: 2023-07-26T11:06:49Z
draft: false
---

## Neovim shortcuts
Motions (link to GIF demonstrations)

    Move between section boundaries with [[, [], ][, and ]]
    Move between environment boundaries with [m, [M, ]m, and ]M
    Move between math environment boundaries with [n, [N, ]n, and ]N
    Move between frame environment boundaries with [r, [R, ]r, and ]R
    Move between comment boundaries with [* and ]*
    Move between matching delimiters with %

Delete \left with `tsd`
togle \frac `tsf`

Localleader is `\`

- `<localleader>ll` compile

- `<localleader>lv` <plug>(vimtex-view)

- `<localleader>lt` <plug>(vimtex-toc-open)

- `<localleader>lk` <plug>(vimtex-stop)
- `<localleader>lc` <plug>(vimtex-clean)

- `<localleader>le` <plug>(vimtex-errors)

- `<localleader>lo` <plug>(vimtex-compile-output)

- `<localleader>li` info

```
`<localleader>lI` info full
`<localleader>lr` <plug>(vimtex-reverse-search)
`<localleader>lt` <plug>(vimtex-toc-open)
`<localleader>lK` <plug>(vimtex-stop-all)
`<localleader>lT` <plug>(vimtex-toc-toggle)
`<localleader>lg` <plug>(vimtex-status)
`<localleader>lG` <plug>(vimtex-status-all)
`<localleader>lC` <plug>(vimtex-clean-full)
`<localleader>lm` <plug>(vimtex-imaps-list)
`<localleader>lx` <plug>(vimtex-reload)
`<localleader>ls` <plug>(vimtex-toggle-main)

dse 	<plug>(vimtex-env-delete) 	n
dsc 	<plug>(vimtex-cmd-delete) 	n
ds$ 	<plug>(vimtex-env-delete-math) 	n
cse 	<plug>(vimtex-env-change) 	n
csc 	<plug>(vimtex-cmd-change) 	n
cs$ 	<plug>(vimtex-cmd-change-math) 	n
tse 	<plug>(vimtex-env-toggle-star) 	n
tsd 	<plug>(vimtex-delim-toggle-modifier) 	nx
]] 	<plug>(vimtex-delim-close) 	i
ac 	<plug>(vimtex-ac) 	nxo
ic 	<plug>(vimtex-ic) 	nxo
ad 	<plug>(vimtex-ad) 	nxo
id 	<plug>(vimtex-id) 	nxo
ae 	<plug>(vimtex-ae) 	nxo
ie 	<plug>(vimtex-ie) 	nxo
a$ 	<plug>(vimtex-a$) 	nxo
i$ 	<plug>(vimtex-i$) 	nxo
% 	<plug>(vimtex-%) 	nxo
]] 	<plug>(vimtex-]]) 	nxo
][ 	<plug>(vimtex-][) 	nxo
[] 	<plug>(vimtex-[]) 	nxo
[[ 	<plug>(vimtex-[[) 	nxo
```


#### Packages
```Latex
\documentclass[11pt]{article}
\usepackage[]{amsfonts, amssymb, amsmath}
\usepackage[]{float}
\usepackage[]{enumerate}
\usepackage[]{hyperref}
\usepackage[left=1in, right=1in, top=1in, bottom=1in, paperwidth=8.5in, paperheight=11in]{geometry}
\usepackage[]{graphicx}
```

#### Define new command
```Latex
\newcommand{\mycommnad}[1]{\setlength\itemsep{#1em}}

% usage
\mycommnad{10}

```


#### Define document info
```Latex
\title{\LaTeX\ Document} % \maketitle after \begin{document} should be added
\author{Me}
\date{\today}

\pagestyle{empty} % no page number
```

#### Begin document
```Latex
\begin{document}
\maketitle
\tableofcontents
```

#### Section
```Latex
\section{Hello \LaTeX\ World}

Hello! \LaTeX\ World\\
Rectangle a = $(x+1)$, b = $(x+2)$ \\
The equation is ${a^2 + b^2 = c^2}$. (\$\{\}\$ to keep the equation in the same line)

Display math mode $$a^2 + b^2 = c^2$$ continues here.


```

#### Common Math Notation
```Latex 
\section{Common Math Notation}
$2x^3$ % inline math mode
$$2x^{34}$$ % display math mode
$$2x^{3x^{2y+4}+5}+10$$
$$x_1$$
$$x_{1_3}$$

$$ a_0, a_1, \dots, a_n $$

$$ \pi\ \Pi \alpha \alpha $$
$$A=\pi r^2$$

Trig functions
$$y=\sin x$$
$$y=\sin^{-1} x$$
$$y=\arcsin x$$

Log functions
$$y=\log x$$
$$y=\log_5 x$$

Roots
$$\sqrt[number]{2}$$
$$ \frac{2}{3} $$

About $\displaystyle \frac{2}{3}$ $\frac{2}{3}$.\\[6pt]
What?

$a, b, c \in \mathbb{R}$
```

#### Brackets
```Latex

\section{Brackets}

$$\left(\frac{1}{x-1}\right)$$
$$ \left( 1234 \right) $$
$$\left.\frac{dy}{dx}\right|_{x=1} = \sigma $$


\vspace{1cm}


\begin{table}[H]
	\def\arraystretch{1.5}
	\centering


	\begin{tabular}{|c|r|l|p{17pt}|c|c|}
		\hline
		x & 1 & 2 & 34 & 5 \\ \hline
		% f(x) & what & another & is here & 5 \\ \hline
	\end{tabular}

	\caption{A table}

\end{table}
```


#### Equation Arrays
```Latex
\section{Equation Arrays}

\begin{align}
	5x^2\ \text{words} \\
	5x^3               \\
	5x+3 & =2x+7       \\
	3x   & =4          \\
	     & = 3x
\end{align}

$$ hello there  $$
```

#### lists
```Latex
\section{lists}

% \begin{itemize}
% 	\item penci
% 	\item what
%
% 	      \begin{enumerate}
% 		      \item hello
% 		      \item world
% 		            \begin{enumerate}
% 			            \item grossery
% 		            \end{enumerate}
% 	      \end{enumerate}
%
% \end{itemize}

\begin{enumerate}[A.]
	\item what
	\item what
\end{enumerate}

\pagebreak

\begin{enumerate} \setcounter{enumi}{4}
	\item what
	\item what
\end{enumerate}

\vspace{1cm}
\begin{enumerate}
	\item[] what
	\item[] what

\end{enumerate}
```

#### Formatting
```Latex
\section{Formatting}
This will produce \textit{italicized} text. \\
This will produce \textbf{italicized} text. \\
\texttt{monospace} \\
\url{https://www.google.com} \\
\href{https://www.google.com}{website}

$\hat{wat}\ \hat{what} $

\begin{Huge}
	What?
\end{Huge}

\begin{huge}
	What?
\end{huge}

\begin{large}
	hello?
\end{large}

\begin{scriptsize}
	hello?
\end{scriptsize}

\begin{tiny}
	hello?
\end{tiny}

\begin{center}
	centered line
\end{center}

\begin{flushright}
	right aligned
\end{flushright}

\subsection{Paragraphs}
another paragraph
\subsubsection{hello}

$\mathbb{Z}$

\section{Macros}

$y=\left(\frac{x}{x^2+1}   \right) $


\def\eq1{y=\left(\frac{x}{x^2+1}   \right) }
$\eq1$

\mycommnad{10}

what?

\section{Images}

\includegraphics[scale=0.3]{1}

\includegraphics[width=1cm]{1}

\includegraphics[width=0.5\textwidth]{1}

\begin{figure}[H]
	\centering
	\includegraphics[width=0.5\textwidth]{1}
	\caption{A figure}
\end{figure}

\section{Calculas}
\begin{align}
	\frac{hello}{world}                                  & =   \\
	\text{category}                                      & \pm \\
	\sqrt{  \frac{2}{3}  }                               & =   \\
	\sum_{n=3}^{10} \left( 3x^2_3 + 5 \right)            & =   \\
	\int_{-3}^{3} \frac{1}{x} \,dx                       & =   \\
	\sum_{n=10}^{\infty} \mathrm{helloworld}             & =   \\
	\lim_{10 \to -\infty - 0} \left( \frac{10}{x}\right) & =   \\
	\int_{10}^{100} \sum_{n=1}^{\infty} a_n z^n
\end{align}

$\displaystyle{ \int_{-\infty}^{\infty} dx  }$
$\displaystyle{ \int \limits_a^b dx }$



\begin{align}
	\int x^2 dx = \frac{x^3}{3} + C \\
	\cdots                          \\
	\cdot                           \\
	\delta x                        \label{sec:1}
	\Delta x
	\vec{v}=v_1 + \vec{v_2} + \dots + \vec{v_n}
\end{align}

Spaces \
\vspace{10cm}
\pagebreak

\hyperref[sec:1]{Text}
\ref{sec:1}
```

#### End document


#### Luasnip
```Latex
\begin{enumerate}
  \item d+m - dispaly math
  
\end{enumerate}

Math mode
\begin{enumerate}
  \item asec|atan|arctan|etc
  % \item [aA]lpha|[bB]eta|[cC]hi|[dD]elta|[eE]psilon|[gG]amma|[iI]ota|[kK]appa|[lL]ambda|[mM]u|[nN]u|[oO]mega|[pP]hi|[pP]i|[rR]ho|[sS]igma|[tT]au|[tT]heta|[zZ]eta|[eE]ta
  \item "sin|cos|tan|csc|sec|cot|ln|log|exp|star|perp|int"
  \item inf|inn|SI
  \item trig = "(%a)bar",
  \item trig = "(%a+)hat",
  \item trig = "td" !exponent
  \item trig = "rd" 
  \item trig = "cb"
  \item trig = "sr"
  \item trig = "EE" !exists
  \item trig = "AA" !forall
  \item trig = "xnn
  \item trig = "ynn
  \item trig = "xii
  \item trig = "yii
  \item trig = "xjj
  \item trig = "yjj
  \item trig = "xp1
  \item trig = "xmm
  \item trig = "R0+
  \item trig = "notin"
  \item trig = "cc"
  \item trig = "<->" 
  \item trig = "..." !dots
  \item trig = "!>", 
  \item trig = "iff",
  \item trig = "nabl"
  \item trig = "<!", 
  \item trig = "floor"
  \item trig = "mcal", 
  \item trig = "//", !frac
  % \item trig = "\\\\\\"
  \item trig = "->"
  \item trig = "letw"
  \item trig = "nnn", 
  \item trig = "norm",
  \item trig = "<>",
  \item trig = ">>",
  \item trig = "<<",
  \item trig = "stt", 
  \item trig = "tt",
  \item trig = "xx",
  \item trig = "**"
  \item trig = ":="
  \item trig = "cvec"
  \item trig = "ceil"
  \item trig = "OO", 
  \item trig = "RR", 
  \item trig = "QQ", 
  \item trig = "ZZ", 
  \item trig = "UU", 
  \item trig = "NN", 
  \item trig = "||", 
  \item trig = "Nn", 
  \item trig = "bmat"
  \item trig = "uuu", 
  \item trig = "DD", 
  \item trig = "HH",
  \item trig = "lll", 
  \item trig = "dint"
  \item trig = "==",
  \item trig = "!=",
  \item trig = "compl",
  % \item trig = "__",
  % \item trig = "=>",
  \item trig = "=<",
  \item trig = "<<",
  \item trig = "<=",
  \item trig = ">=",
  \item trig = "invs"
  \item trig = "~~", !important
  \item trig = "conj",
  \item trig = "sum", 
  \item trig = "taylor", 
  \item trig = "lim", 
  \item trig = "limsup", 
  \item trig = "prod", 
  \item trig = "part", 
  \item trig = "ddx", 
  \item trig = "pmat", 
  \item trig = "lr", 
  \item trig = "lr(", 
  \item trig = "lr|", 
  \item trig = "lr{", 
  \item trig = "lr[", 
  \item trig = "lra", 
  \item trig = "lrb", 
  \item trig = "sequence"
  % etc.
\end{enumerate}

```

`\end{document}`
