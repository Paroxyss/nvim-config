# Latex snippets :

## I - Normal snippets (other.lua)

Aligned equation : `alignedequation`
```tex
\begin{equation*} \label{eq1}
\begin{split}
    <val> & = <expr> <rec>
\end{split}
\end{equation*} 
```

List : `list`
```tex
\begin{itemize}
	\bi <val> <rec>
\end{itemize}
```

## II - Automatic snippets

### II.1 Global (auto.lua)

Math zone : `$`
```tex
2 choices :

$ <expression> $

\[
    <expression>
\]
```

Custom environment : `bg(%w+)` (defined in lua/utils/latexContexts)
```tex
\begin{<type>}[<title>]
    <content>
\end{<type>}
```

### II.2 Only in math (auto.lua)
Fraction : `fra` \
Produit : `prod` \
Somme : `sum` \
Intégrale : `int`
```tex
\frac{<num>}{<denum>}
\prod_{<start>}^{<endi>} <corpus>
\sum_{<start>}^{<endi>} <corpus>
\int_{<start>}^{<endi>} <corpus>
```

### III.3 Custom (automath.lua)

#### Everywhere replacements ($ are addeds when not in math zone)
```tex
    ";a" -> "\\alpha"
    ";b" -> "\\beta"
    ";g" -> "\\gamma"
    ";e" -> "\\epsilon"
    ";t" -> "\\tau"
    "<" -> "<"
    ">" -> ">"
    "=" -> "="
```

#### Math replacement (replacements made only in math zone)
```tex
	"fa" = "\\forall"
	"ex" = "\\exists"
	"in " = "\\in " -- spaces used to make diffence between in and inc
	"inc " = "\\subset "
	"imp" = "\\implies"
	"equ" = "\\equiv"
	"leq" = "\\leq"
	"geq" = "\\geq"
```

#### Completed replacements (regex matched group is appended, inside {}, after the expression)
```tex
	"ens(.)" = "\\mathbb"
	"cal(.)" = "\\mathcal"
```
