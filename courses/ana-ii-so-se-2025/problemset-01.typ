#import "common.typ": *

#exercise([40 = 10 + 10 + 10 + 10])[
  Sei $n >= 2$.
  + Sei $q in (0,1)$. Zeigen Sie, das $norm(-)_(l^q) : RR^n -> [0, infinity)$
    definierst durch
    $
      norm(x)_(l^q) := (sum_(i=1)^n abs(x_i)^q)^(1 / q)
    $
    keine Norm ist.

  + Beweisen Sie die Ungleichung
    $
      norm(x)_(l^infinity) <= norm(x)_(l^2) <= norm(x)_(l^1)
    $
    für alle $x in RR^n$.

  + Beweisen Sie die Ungleichung
    $
      1 / sqrt(n) norm(x)_(l^1) <= norm(x)_(l^2) <= sqrt(n) norm(x)_(l^infinity)
    $
    für alle $x in RR^n$.

    _Tipp._ Denken Sie an die #csu

  + Zeigen Sie, dass für alle $x in RR^n$ gilt
    $
      lim_(p -> infinity) norm(x)_(l^p) = norm(x)_(l^infinity).
    $
]

_Beweis:_

Für ein beliebiges $x in RR^n$ setzen wir
$
  x_max := max{abs(x_1), ..., abs(x_n)}.
$

+ Wähle $x := e_1 + e_2 in RR^n$. Dann
  $
    norm(x)_(l^q) & = (sum_(i=1)^n abs(x_i)^q)^(1 / q) \
                  & = (1^q + 1^q)^(1 / q)              \
                  & = 2^(1 / q).                       \
  $
  Für $0 < q < 1$ gilt $2^(1 / q) > 2$. Wäre $norm(-)_(l^q)$ eine Norm, müsste
  wegen der Dreiecksungleichung
  $
    norm(x)_(l^q) <= norm(e_1)_(l^q) + norm(e_2)_(l^q) = 2
  $
  gelten --- ein Widerspruch. lso ist $norm(-)_(l^q)$ *keine* Norm.

+ *Linke Ungleichung:*
  $
    norm(x)_(l^2) = sqrt(sum_(i=1)^n abs(x_i)^2)
    >= sqrt(abs(x_max)^2) = norm(x)_(l^infinity).
  $
  *Rechte Ungleichung:*
  $
    norm(x)_(l^1)^2 & = (sum_(i=1)^n abs(x_i))^2                                  \
                    & = sum_(i=1)^n abs(x_i) sum_(i=1)^n abs(x_i)                 \
                    & = sum_(i,j=1)^n abs(x_i) abs(x_j)                           \
                    & = sum_(i=1)^n abs(x_i)^2 +
                      underbrace(sum_(1 <= i < j <= n)^n abs(x_i) abs(x_j), >= 0) \
                    & >= norm(x)_(l^2)^2.                                         \
  $
  Also
  $
    norm(x)_(l^infinity) <= norm(x)_(l^2) <= norm(x)_(l^1).
  $

+ *Linke Seite:*
  $
    norm(x)_(l^1)
    = angle.l abs(x), 1_(RR^n) angle.r
    <= norm(x)_(l^2) dot norm(1_(RR^n))_(l^2)
    = sqrt(n) dot norm(x)_(l^2),
  $
  daher
  $
    1 / sqrt(n) dot norm(x)_(l^1) <= norm(x)_(l^2).
  $

  *Rechte Seite:*
  $
    norm(x)_(l^2)^2
    = sum_(i=1)^n abs(x_i)^2
    <= sum_(i=1)^n abs(x_max)^2
    = n dot abs(x_max)^2,
  $
  also
  $
    norm(x)_(l^2) <= sqrt(n) * abs(x_max)
    = sqrt(n) dot norm(x)_(l^infinity).
  $

+ Für $p > 0$ gilt
  $
    abs(x_max)
    <= norm(x)_(l^p)
    = definitions.lpnorm
    <= (n dot abs(x_max)^p)^(1 / p)
    = n^(1 / p) dot abs(x_max).
  $
  Wegen $lim_(p -> infinity) n^(1 / p) = 1$ folgt durch das Sandwich-Theorem
  $
    lim_(p -> infinity) norm(x)_(l^p)
    = abs(x_max)
    = norm(x)_(l^infinity).
  $

#pagebreak()

#exercise([10])[
  Beweisen Sie, dass die Abbildung $f : RR^2 -> RR^2$ definiert durch
  $
    f(x,y) := (x - y, x + y)
  $
  eine Isometrie von $(RR^2, d_(l^1))$ nach $(RR^2, d_(l^infinity))$ ist.
]

_Beweis:_

Zunächst erinnern wir daran, dass $f$ linear ist. In der Standardbasis lautet
die darstellende Matrix
$
  A_f := mat(1, -1; 1, 1),
$
womit
$
  det(A_f) = 1 dot 1 - (-1) dot 1 = 2 != 0.
$
Damit ist $f$ ein Isomorphismus von $RR^2$ auf $RR^2$.

Seien nun $x, y in RR^2$ beliebig und setze
$
  h := x - y = (h_1, h_2).
$
Dann besitzt die $l^1$-Metrik die Gestalt
$
  d_(l^1)(x, y)
  = norm(h)_(l^1)
  = abs(h_1) + abs(h_2).
$

Für die Bilder erhalten wir
$
  f(h) = (h_1 - h_2, h_1 + h_2),
$
sodass
$
  d_(l^infinity)(f(x), f(y))
  &= norm(f(h))_(l^infinity) \
  &= max{abs(h_1 - h_2), abs(h_1 + h_2)}. #h(1em) star
$

Wir betrachten zwei Fälle.

*Fall 1: $h_1 dot h_2 >= 0$.*
Die Koordinaten haben dasselbe Vorzeichen, also
$
  abs(h_1 + h_2) = abs(h_1) + abs(h_2).
$
Da $abs(h_1 - h_2) <= abs(h_1) + abs(h_2)$ gilt, liefert (#math.star)
$
  d_(l^infinity)(f(x), f(y))
  = abs(h_1) + abs(h_2)
  = d_(l^1)(x, y).
$

*Fall 2: $h_1 dot h_2 <= 0$.*
Die Koordinaten besitzen entgegengesetztes Vorzeichen. Dann
$
  abs(h_1 - h_2) = abs(h_1) + abs(h_2),
$
während $abs(h_1 + h_2) <= abs(h_1) + abs(h_2)$. Also wiederum
$
  d_(l^infinity)(f(x), f(y))
  = abs(h_1) + abs(h_2)
  = d_(l^1)(x, y).
$

#pagebreak()

#exercise([10])[
  Zeigen Sie, dass $d: RR^n times RR^n -> [0, infinity)$ definiert duch
  $
    d(x,y) := sqrt(d_(#smallcaps[Euklid]))(x,y))
  $
  tatsächlich eine Metrik auf $RR^n$ ist.
]

Die Eigenschaften M1 (Definitheit) und M2 (Symmetrie) sind trivialerweise
erfüllt, da sie direkt von der euklidischen Metrik vererbt werden. Für die
Dreiecksungleichung (M3) betrachten wir zunächst eine hilfreiche Ungleichung für
positive reelle Zahlen.

Seien $x,y in RR^+_0$, dann gilt:
$
      & x + y <= x + 2 sqrt(x) sqrt(y) + y = (sqrt(x) + sqrt(y))^2 \
  <=> & sqrt(x + y) <= sqrt(x) + sqrt(y).                          \
$

Diese Ungleichung werden wir nun auf die Metrik anwenden. Seien $x,y,z in RR^n$
beliebig. Unter Verwendung der Dreiecksungleichung für $d_(#smallcaps[Euklid])$
und der soeben bewiesenen Ungleichung erhalten wir:

$
  d(x,z) & = sqrt(d_(#smallcaps[Euklid])(x,z)) \
  & <= sqrt(d_(#smallcaps[Euklid])(x,y) + d_(#smallcaps[Euklid])(y,z)) \
  & <= sqrt(d_(#smallcaps[Euklid])(x,y)) + sqrt(d_(#smallcaps[Euklid])(y,z)) \
  & = d(x,y) + d(y,z)
$

Damit ist die Dreiecksungleichung für $d$ gezeigt und alle drei
Metrikeigenschaften sind nachgewiesen.
