#import "common.typ": *

#show: problemset(10)

#exercise([10])[
  Wir bezeichnen mit $norm(-)$ die #smallcaps[Euklid]ische Norm. Ist die
  Teilmenge
  $
    C := {
      (x, y, z) in RR^3 times RR^3 times RR^3 :
      norm(x) = 1,
      norm(y-x) = 1
      "und" norm(z-y) = 1
    }
  $
  eine $C^1$-Untermannigfaltigkeit von
  $RR^3 times RR^3 times RR^3 tilde.equiv RR^9$?
]

=== Beweis.

Definieren wir zunächt die Funktion
$
  f colon RR^3 times RR^3 times RR^3 & -> RR^3 \
                       "mit" (x,y,z) & mapsto (norm(x), norm(y-x), norm(y-z))^T.
$
Berechnen wir nun die totale ableitung der Funktion $f$ an der Stelle $(x,y,z)$
$
  T_(x,y,z) f = mat(
    x^T/norm(x), 0^T, 0^T;
    -(y-x)^T/norm(y-x), (y-x)^T/norm(y-x), 0^T;
    0^T, (y-z)^T/norm(y-z), -(y-z)^T/norm(y-z)
  ).
$

Bemerken wir das $C = f^(-1)((1,1,1))$ ist. Für jeden punkt $(z,y,z) in C$ ist
$T_(x,y,z) f$ Surjektiv. Also ist $(1,1,1)$ ein regulärer wert von $f$ und nit
dem Satz vom Regulären wert folgt nun das $C$ eine 6 dimensionale
Untermannigfaltigkeit ist.

#pagebreak()

#exercise([20])[
  Sei $f : U := (0, infinity) times RR -> RR^3$ definiert durch
  $
    f(r, alpha) := (r cos alpha, r sin alpha, alpha).
  $
  Zeigen Sie, dass die *Wendelfläche*
  $
    W := f(U) subset RR^3
  $
  eine 2-dimensionale $C^infinity$-Untermannigfaltigkeit von $RR^3$ ist.
]

=== Beweis.

Sei $U = (0, infinity) times RR$ offen in $RR^2$ und
$
  f: U -> RR^3, quad (r, alpha) arrow.long.r (r cos(alpha), r sin(alpha), alpha).
$
Die Abbildung $f$ ist offensichtlich $C^infinity$. Für $(r,alpha) in U$ gilt
$
  diff_r f(r,alpha) = (cos(alpha), sin(alpha), 0)^T, quad
  diff_alpha f(r,alpha) = (-r sin(alpha), r cos(alpha), 1)^T.
$
Ihr Kreuzprodukt ist
$
  diff_r f times diff_alpha f = (sin(alpha), -cos(alpha), r)^T != 0,
$
sodass ${diff_r f, diff_alpha f}$ linear unabhängig ist. Damit hat die totale
Ableitung $T_(r,alpha) f$ vollen Rang $2$ und $f$ ist ein Immersion.

Seien nun $(r_1,alpha_1),(r_2,alpha_2) in U$ mit
$f(r_1,alpha_1)=f(r_2,alpha_2)$. Aus der dritten Koordinate folgt
$alpha_1=alpha_2$, und damit aus den ersten beiden Koordinaten auch $r_1=r_2$.
Somit ist $f$ injektiv.

Definieren wir die Umkehrabbildung
$
  g: W := f(U) -> U, quad (x,y,z) arrow.long.r (sqrt(x^2+y^2), z).
$
Wegen $r>0$ ist $g$ glatt (die Wurzel ist auf $(0,infinity)$ glatt) und erfüllt
$g compose f = id_U$ sowie $f compose g = id_W$. Also ist $f$ ein
Diffeomorphismus zwischen der offenen Menge $U subset RR^2$ und $W$ mit der
Teilraumtopologie von $RR^3$.

Damit ist $W$ eine 2-dimensionale, eingebettete
$C^infinity$-Untermannigfaltigkeit von $RR^3$.

#pagebreak()

#exercise([30 = 10 + 10 + 10])[
  Die *Lorentzgruppe* $O(3, 1)$ ist definiert durch
  $
    O(3, 1) := {A in RR^(4 times 4) : A^T G A = G} quad "mit" quad G := mat(
      -1, 0, 0, 0;
      0, 1, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1
    ).
  $

  $O(3, 1)$ ist gewissermaßen die Symmetriegruppe der speziellen
  Relativitätstheorie.

  + Zeigen Sie, dass $O(3, 1)$ eine 6-dimensionale
    $C^infinity$-Untermannigfaltigkeit von $RR^(4 times 4)$ ist.

  + Bestimmen Sie den Tangentialraum $T_I O(3, 1)$.

  + Zeigen Sie, dass $O(3, 1)$ nicht kompakt ist.
]

=== Beweis

Definieren wir zunächst die Funktion
$
  f : O(3,1) & -> Sym_1(RR^4, RR^4) \
           A & mapsto A^T G A - G,
$
diese Funktion ist wohldefiniert da
$
  (A^T G A - G)^T = A^T G^T A - G^T = A^T G A - G
$
und somit für alle $A in RR^(4 times 4)$ gilt $f(A) in Sym_1(RR^4, RR^4)$.

Man sieht direkt das $f^(-1)(0) = O(3,1)$.

Die Funktion $f$ ist offensichtlich
$C^infinity (RR^(4 times 4), RR^(4 times 4))$ da sie in jeder komponente ein
Polynom ist. Die totale ableitung $T_A f$ folgt aus folgender überlegung
$
  norm(f(A + H) - f(A) - T_A f(H)) & = norm(
    (A + H)^T G (A + H)^T - A^T G A -
    T_A f(H)
  ) \
  & = norm(
    A^T G A + A^T G H + H^T G A
    + H^T G H - A^T G A - T_A f(H)
  ) \
  & = norm(H^T G A + A^T G H - T_A f(H) + H^T G H).
$
Es ist offensichtlich das $H^T G H$ quatratisch in $H$ ist und somit
$T_A f(H) = H^T G A + A^T G H$ die totale Ableitung von $f$ an der stelle $A$
ist.

+ Wir wollen nun zeigen das $T_A f$ surjektiv ist für alle $A in O(3,1)$ hierbei
  müssen wir allerdings unseren zielbereich auf $Sym_1(RR^4, RR^4)$ da $T_A f
  (H)$ symmetrisch für alle $H in RR^(4 times 4)$ ist.

  Bemerken wir zunächst das sich $T_A f(H)$ wiefolgt umschreiben lässt
  $
    T_A f(H) = H^T G A + A^T G H = (A^T G H)^T + A^T G H
  $

  Für jede symmetrisch matrize $S in Sym_1(RR^4, RR^4)$ gilt zudem das
  $
    S = 1/2 (S^T + S).
  $

  Setzen wir nun $S = A^T G H$ und lösen nach $H$ so folgt
  $
    H = G A^(-T) S.
  $
  Die invertierbarkeit von $A$ folgt aus folgender Überlegung
  $
    - 1 = det(G) = det(A^T G A) = - det(A)^2
  $
  also $det(A) = plus.minus 1$

  Setzen wir nun $H = 1/2 G A^(-T) S$ so folgt für alle $S in Sym_1(RR^4, RR^4)$
  das
  $
    (1/2 G A^(-T) S)^T G A + A^T G 1/2 G A^(-T) S
    & = 1/2 (( G A^(-T) S)^T G A + A^T G G A^(-T) S) \
    & = 1/2 (S^T A^(-1) G G A + A^T G G A^(-T) S) \
    & = 1/2 (S^T + S) = S.
  $

  Somit folgt das $0$ ein regulärer wert von $f$ ist und somit $O(3,1)$ eine
  $16 - dim(Sym_1(RR^4, RR^4)) = 6$ dimensionale Untermannigfaltigkeit von
  $RR^(4 times 4)$ ist.

+ Für $T_I f (H) = 0$ folgt
  $
    0 = H^T G + G H = (G H)^T + G H
  $
  Also folgt das $A = G H$ antisymetrisch sein muss. Stelle wir nach H um so
  folgt
  $
    H = G^(-1) A.
  $

  Also besteht der kern von $T_I f$ aus matrizen $H in RR^(4 times 4)$ der form
  $ H = G A $
  mit $A$ antisymetrisch.

  Komponentenweise sieht $H$ somit wiefolgt aus
  $
    H = G mat(
      0, a, b, c;
      -a, 0, e, f;
      -b, -e, 0, g;
      -c, -f, -g, 0
    ) = mat(
      0, -a, -b, -c;
      -a, 0, e, f;
      -b, -e, 0, g;
      -c, -f, -g, 0
    ).
  $

+ Wenn $g : X -> Y$ stetig ist und $X$ kompakt ist muss auch $Y$ kompakt sein.
  Für jeden kompakten topologischen raum $X$ folgt das $X$ beschränkt ist. Da
  $f$ differenzierbar und somit stetig ist muss wenn $O(3,1)$ kompakt
  $Sym_1(RR^4, RR^4)$ beschränkt sein.

  Der Metrische Raum $Sym_1(RR^4, RR^4)$ ist offensichtlich nicht beschränkt,
  betrachte zum nachweiß die Symmetische matrix
  $
    A_lambda = op("diag")(lambda, lambda, lambda, lambda)
  $
  wessen matrixnorm von unten durch $lambda$ abgeschätz werden kann.
