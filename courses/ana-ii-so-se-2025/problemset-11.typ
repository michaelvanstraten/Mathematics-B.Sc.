#import "common.typ": *

#show: problemset(11)

#exercise([20])[
  Wir betrachten die Quadrik
  $
    Q := {(x, y) in RR^2 : x y = 1}.
  $

  Berechnen Sie den Abstand von $(0, 0)$ zu $Q$ bzgl. der
  #smallcaps[Euklid]ischen Norm.
]

=== Lösung:

Defineieren wir die funktionen $f : RR^2 & -> RR$ und $g : RR^2 -> RR$ wiefolgt
$
  (x_1, x_2) mapsto x_1^2 + x_2^2 #h(2em) "sowie" #h(2em) (x_1, x_2) mapsto x_1 x_2.
$
Da $f$ differenzierbar ist hat es ein minimum auf $Q$.

Mit Satz 19.1 folgt nun für ein minimum $x in RR^2$ das folgende gleichungsystem
$
  T_x f = (2x_1, 2x_2) & = lambda T_x g = (lambda x_2, lambda x_1) \
                 "und"                                             \
               x_1 x_2 & = 1.
$
Aus welchem folgt mit
$
        x_1 x_2 = 1 & => x_1 != 0            && => x_2 = 1/x_1      \
  2x_1 = lambda x_2 & => 2x_1 = lambda 1/x_1 && => lambda = 2 x_1^2 \
  2x_2 = lambda x_1 & => 2 = 2 x_1^4         && => x_1 = plus.minus 1
                                                and x_2 = plus.minus 1
                                                and lambda = 2.
$
Da $sqrt(dot)$ monoton ist, ist $x = (plus.minus 1, plus.minus 1)$ das minimum
von $norm(dot)_2$ auf $Q$ mit abstand $sqrt(2)$.

#pagebreak()

#exercise([20])[
  Für jedes $(x, y, z) in RR^3$ sind die 8 Punkte
  $
    (plus.minus x, plus.minus y, plus.minus z) in RR^3
  $
  die Eckpunkte eines achsenparallelen Quaders mit Volumen
  $
    V(x, y, z) = 8 abs(x) abs(y) abs(z).
  $

  Für gegebene $a, b, c > 0$ betrachten wir das Ellipsoid
  $
    E := {(x, y, z) in RR^3 : x^2 / a^2 + y^2 / b^2 + z^2 / c^2 = 1}.
  $

  Bestimmen Sie
  $
    max_((x,y,z) in E) V(x, y, z),
  $
  das heißt das maximale Volumen eines achsenparallelen Quaders mit Eckpunkten
  in $E$.
]

=== Lösung:

Definerien wir die funktionen $f : RR^3 -> RR$ und $g : RR^3 -> RR$ wiefolgt
$
  (x, y, z) mapsto x y z #h(2em) "sowie" #h(2em) (x, y, z) mapsto x^2 / a^2 + y^2 / b^2 + z^2 / c^2.
$
Da $f$ differenzierbar ist hat es ein maximum auf $E$.

Mit Satz 19.1 folgt nun für ein maximum $x in RR^3$ das folgende gleichungsystem
$
  T_(x,y,z) f = (y z, x z, x y) = lambda T_(x,y,z) g = (lambda x / a^2, lambda y / b^2, lambda z / c^2) \
  "und" \
  x^2 / a^2 + y^2 / b^2 + z^2 / c^2 = 1.
$
Aus welchem folgt
$
  x = a / sqrt(3), y = b / sqrt(3), z = c / sqrt(3) \
  "sowie" \
  lambda = (b c) / (3 sqrt(3) a).
$
Da $f$ symmetrisch ist, ist $x = (a / sqrt(3), b / sqrt(3), c / sqrt(3))$ das
maximum von $f$ auf $E$ mit volumen
$8 (a / sqrt(3)) (b / sqrt(3)) (c / sqrt(3)) = 8 (a b c) / (3 sqrt(3))$.

#pagebreak()

#exercise([20])[
  Seien $n in NN$ und $p, q >= 1$. Wir definieren
  $f, g : RR^n without {0} -> (0, infinity)$ durch
  $
    f(x) = (sum_(i=1)^n abs(x_i)^p)^(1\/p) quad "und" quad g(x) = (sum_(i=1)^n abs(x_i)^q)^(1\/q).
  $

  Bestimmen Sie
  $
    c(p, q) := min_(x in f^(-1)(1)) g(x) quad "und" quad C(p, q) := max_(x in f^(-1)(1)) g(x).
  $
]


=== Lösung:

Bemerken wir zunächst das
$
  f^(-1)(1)
  = lr({ x in RR^n : (sum_(i=1)^n abs(x_i)^p)^(1/p) = 1 }, size: #50%)
  = lr({ x in RR^n : sum_(i=1)^n abs(x_i)^p = 1 }, size: #50%)
$
ist.

Definieren wir
$
  tilde(g) : RR^n -> RR, x mapsto sum_(i=1)^n x_i^q \
  tilde(f) : RR^n -> RR, x mapsto sum_(i=1)^n x_i^p,
$
so liefert Satz 19.1 für ein Extremum $x$ auf der Menge ${x in RR^n, f(x)=1}$
das Gleichungssystem
$
  q x_i^(q-1) = lambda p x_i^(p-1)
  quad "und" quad
  sum_(i=1)^n x_i^p = 1.
$

Sei nun $k$ die Anzahl der von Null verschiedenen Koordinaten von $x$. Für jede
dieser Koordinaten gilt
$
  x_i^(q-p) = lambda p/q
  => x_i = (lambda p/q)^(1/(q-p)).
$
Aus der Nebenbedingung folgt:
$
  sum_(i=1)^n x_i^p
  = k · (lambda p/q)^(p/(q-p))
  = 1
  => (lambda p/q)^(p/(q-p)) = 1/k
  => lambda = q/p · k^(-(q-p)/p)
$
und daher
$
  x_i = k^(-1/p).
$

Damit ist
$
  g(x)
  = (sum_(i=1)^n x_i^q)^(1/q)
  = (k · (k^(-1/p))^q)^(1/q)
  = k^(1/q - 1/p).
$

Da $k in {1,2,…,n}$ läuft der Wert $k^(1/q -1/p)$ zwischen
$
  k=1 => 1^(1/q -1/p) = 1
  "und"
  k=n => n^(1/q -1/p).
$
Somit erhält man allgemein
$
  c(p,q) = min_(1<=k<=n) k^(1/q -1/p) = min{1, n^(1/q -1/p)}
  quad "und" quad
  C(p,q) = max_(1<=k<=n) k^(1/q -1/p) = max{1, n^(1/q -1/p)}.
$

