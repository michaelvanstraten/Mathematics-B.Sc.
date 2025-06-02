#import "common.typ": *
#import "@preview/colorful-boxes:1.4.3": colorbox

#show: problemset(6)

#exercise([20])[
  Beweisen Sie den Satz von Mertens über das Cauchy-Produkt in Banachalgebren.

  *Tipp.* Übertragen Sie den Beweis von Satz 3.38 aus Analysis I\* auf
  Banachalgebren.
]

*Beweis*

Sei $A$ eine #smallcaps[Banachalgebra]. Seien $(x_n), (y_n) in A^NN$ so gewählt
das $sum_(n=1)^infinity x_n$ und $sum_(n=1)^infinity y_n$ absolut konvergieren.

Definieren wir zunächst die folgenden Reihen
$
  X_N := sum_(n=1)^N x_n,
  quad X_N^abs := sum_(n=1)^N abs(x_n),
  quad Y_N := sum_(n=1)^N y_n,
  quad Y_N^abs := sum_(n=1)^N abs(y_n)
$
sowie das Cauchy-Produkt der Reihen als
$
  P_N := sum_(n=1)^N (
    c_n := x_1 y_n + x_2 y_(n-1) + ... + x_n y_1 = sum_(k=1)^n x_k y_(n+1-k)
  ).
$

Um die Konvergenz von $P_N$ gegen $X_N dot Y_N$ zu zeigen versuchen wir zunächst
deren Distanz abzuschätzen. Zu diesem zweck defineieren wür für $N in NN$
$
  square_N := {(k, l) in NN^n : k,l <= N} quad "und"
  quad triangle_N := {(k, l) in NN^n : k + l <= N + 1}.
$
Die Reihen lassen sich somit wiefolgt darstellen
$
  X_N dot Y_N = sum_((k,l) in square_N) x_k dot y_l
  "und" P_N = sum_((k,l) in triangle_N) x_k dot y_l.
$

Aus $triangle_N subset square_N$ folgt für alle $N in NN$ das
$
  norm(X_N dot Y_N - P_N)
  &= sum_((k,l) in square_N without triangle_N) x_n dot y_n \
  &= sum_((k,l) in square_N without triangle_N) norm(x_n) dot norm(y_n) \
  &= sum_((k,l) in square_N without square_(floor(N \/ 2))) norm(x_n) dot norm(y_n) \
  &= X_N^abs dot Y_N^abs - X_floor(N \/ 2)^abs dot Y_floor(N \/ 2)^abs.
$

Sei $epsilon > 0$ wähle $N_0$ so das für alle $n >= N_0$ folgt das
$
  norm(X_n^abs - X_infinity) < epsilon
$
ist. Wähle $N = 2 N_0$ so folgt für alle $n >= N$ das
$
  norm(X_floor(n\/2)^abs - X_infinity) < epsilon
$
ist.

Also konvergiert $X_floor(N \/ 2)^abs$ gegen den gleichen Grenzwert wie
$X_N^abs$, das gleiche gilt für $Y_floor(N \/ 2)^abs$.

Somit folgt das
$
  lim_(n -> infinity) X_N^abs dot Y_N^abs -
  X_floor(N \/ 2)^abs dot Y_floor(N \/ 2)^abs = 0
$
und somit
$
  norm(X_N dot Y_N - P_N) = 0.
$

Folglich konvergiert $P_N$ und zwar gegen
$
  sum_(n=1)^infinity x_n dot sum_(n=1)^infinity y_n.
$

Dieses Resultat angewendet auf $X_N^abs dot Y_N^abs$ zeigt das $P_N$ auch
absolut konvergiert.

#pagebreak()

#exercise([20 = 10 + 10])[
  + Sei $k in NN_0$. Sei $A$ eine Banachalgebra. Sei $p_k : A -> A$ definiert
    durch
    $
      p_k (x) := x^k .
    $
    Zeigen Sie, dass $p_k$ differenzierbar ist und bestimmen Sie die Ableitung
    $T p_k$.

    *Warnung.* Beachten Sie, dass $A$ nicht kommutativ sein muss.

  + Sei $C$ eine endlich-dimensionale kommutative Banachalgebra. Zeigen Sie,
    dass $exp : C ->
    C$ differenzierbar ist und bestimmen Sie die Ableitung $T exp$.

    *Tipp.* Benutzen Sie, dass $C$ kommutativ sein muss. Für nicht-kommutative
    Banachalgebren ist dieses Problem etwas komplizierter.
]

*Beweis*

+ Sei $A$ eine Banachalgebra, $a, b in A$ sowie $n in NN_0$. Dann lässt sich
  $(a + b)^n$ wie folgt darstellen
  $
    (a + b)^n = a^n + T_a p_n (b) + R_a (b)
  $
  wobei $T_a p_k in op("Hom")(A, A)$ wiefolgt definiert ist
  $
    T_a p_n (b) := sum_(k=0)^(n-1) a^(k) b a^(n - 1 - k).
  $
  und $R_a (b)$ mindestens quadratisch in $b$ ist.

  === Beweis via Induktion

  Für den fall $n=0$ folgt
  $
    (a+ b)^0 = 1 = 1 + 0 + 0
  $
  mit $R_a (b) = 0$.

  Sei die aussage nun für ein $n in NN$ bewiesen so folgt
  $
    (a+b)^(n+1) & = (a+b)^n dot (a+b) \
    & = [a^n + T_a p_n (b) + R_a (b)] dot (a + b) \
    & = a^(n+1) + a^n dot b + T_a p_n (b) dot a + T_a p_n (b) dot b + R_a (b)
    dot (a + b).
  $
  Da $T_a p_k (b)$ linear in $b$ ist, ist $T_a p_k (b) dot b$ quadratisch in
  $b$. Gleiches gilt für $R_a (b) dot (a + b)$. Somit folgt
  $
    (a+b)^(n+1)
    &= a^(n+1) + a^n dot b + T_a p_n (b) dot a + R_a (b) \
    &= a^(n+1) + a^n dot b + sum_(k=0)^(n-1) a^(k) b a^(n - 1 - k) dot a + R_a (b) \
    &= a^(n+1) + a^n dot b + sum_(k=0)^(n-1) a^(k) b a^(n - k) + R_a (b) \
    &= a^(n+1) + sum_(k=0)^(n) a^(k) b a^(n - k) + R_a (b) \
    &= a^(n+1) + T_a p_(n+1)(b) + R_a (b)
  $

  Die linearität folgt aus folgender Überlegung:

  Sei $x, y in A$ und $lambda in RR$ sowie $n in NN$ so folgt
  $
    T_a p_n (x + lambda y)
    &= sum_(k=0)^(n) a^(k) (x + lambda y) a^(n - k) \
    &= sum_(k=0)^(n) (a^(k) x + lambda a^(k) y) a^(n - k) \
    &= sum_(k=0)^(n) a^(k) x a^(n - k) + lambda a^(k) y a^(n - k) \
    &= sum_(k=0)^(n) a^(k) x a^(n - k) + lambda sum_(k=0)^(n) a^(k) y a^(n - k) \
    &= T_a p_n (x) + lambda T_a p_n (y)
    \
  $

  Sei $x in A$ so folgt aus den vorherigen überlegungen das:
  $
    lim_(norm(h) -> 0) frac(norm((x + h)^n - x^n - T_a p_n (h)), norm(h)) = 0
  $
  und somit differenzierbar ist.

+ $
    norm(exp(X + H) - exp(X) - T_X exp(H))
    &= norm(sum_(n=0)^infinity 1 / n! (X - H)^n - exp(X) - T_X exp(H)) \
    &= norm(
      sum_(n=0)^infinity 1 / n! sum_(k=0)^n binom(n, k) X^(n-k) H^k
      - exp(X) - T_X exp(H)
    ) \
    &= norm(
      sum_(n=0)^infinity 1 / n! (X^n + sum_(k=1)^n binom(n, k) X^(n-k) H^k)
      - exp(X) - T_X exp(H)
    ) \
    &= norm(
      exp(X) + sum_(n=0)^infinity 1 / n! sum_(k=1)^n binom(n, k) X^(n-k) H^k
      - exp(X) - T_X exp(H)
    ) \
    &= norm(
      sum_(n=1)^infinity 1 / n! sum_(k=1)^n binom(n, k) X^(n-k) H^k - T_X exp(H)
    ) \
    &= norm(
      sum_(n=1)^infinity 1 / n! (n dot X^(n-1) H + sum_(k=2)^n binom(n, k) X^(n-k) H^k) - T_X exp(H)
    ) \
    &= norm(
      sum_(n=1)^infinity 1 / (n-1)! X^(n-1) H + sum_(n=2)^infinity sum_(k=2)^n binom(n, k) X^(n-k) H^k
      - T_X exp(H)
    ) \
    &= norm(
      exp(X)H + sum_(n=2)^infinity sum_(k=2)^n binom(n, k) X^(n-k) H^k
      - T_X exp(H)
    )
  $

  Definiere $T_X exp(H) := exp(X)H$ so folgt
  $
    norm(exp(X + H) - exp(X) - T_X exp(H)) = norm(sum_(n=2)^infinity sum_(k=2)^n binom(n, k) X^(n-k) H^k)
  $

#pagebreak()

#exercise([20 = 10 + 10])[
  Wir betrachten die Banachalgebra $RR^(2 times 2)$ der $2 times 2$–Matrizen.

  + Zeigen Sie, dass die Determinante
    $
      det : RR^(2 times 2) -> RR\
      mat(a, b; c, d) mapsto a d - b c
    $
    differenzierbar ist.

  + Zeigen Sie, dass für alle $A in RR^(2 times 2)$ mit $det A != 0$ gilt
    $
      T_A det(B) = det(A) dot.op tr(A^(-1) B).
    $
    Hier bezeichnet $tr : RR^(2 times 2) -> RR$ die Spur, das heißt
    $tr mat(a, b; c, d) := a + d$.

    *Tipp.* Vielleicht hilft Ihnen folgender Spezialfall der Cramerschen Regel.
    Für $A in RR^(2 times 2)$ mit $det A != 0$ gilt
    $
      A^(-1) = 1 / (det A) mat(d, -b; -c, a).
    $
]

*Beweis*

+ Sei $epsilon > 0$ wählen wir $delta := epsilon$ so definieren wir
  $
    H := mat(
      h_11, h_12;
      h_21, h_22
    ) = Y - X.
  $

  So folgt
  $
    norm(det(Y) - det(X) - T_X det(Y)) = norm(det(X + H) - det(X) - T_X det(H)).
  $

  Für $det(X + H) - det(X)$ folgt
  $
    det(X + H) - det(X)
    &=&& (x_11 + h_11)(x_22 + h_22) - (x_12 + h_12)(x_21 + h_21) - det(X) \
    &=&& x_11 x_22 + x_11 h_22 + h_11 x_22 + h_11 h_22 \
    &&&- x_12 x_21 - x_12 h_21 - h_12 x_21 - h_12 h_21 - x_11 x_22 + x_12 x_21 \
    &=&& x_11 h_22 + h_11 x_22 + h_11 h_22 - x_12 h_21 - h_12 x_21 - h_12 h_21 \
    &=&& x_11 h_22 + h_11 x_22 - x_12 h_21 - h_12 x_21 + h_11 h_22 - h_12 h_21.
  $

  Und somit
  $
    norm(det(Y) - det(X) - T_X det(Y)) = abs(h_11 h_22 - h_12 h_21) = abs(det(H)).
  $

  Ein bekanntes Resultat aus der Linearen Algebra sagt uns das jede quadratisch
  Matrix $n$-eigenwerte über $CC$. Sei $lambda$ ein eigenwerte von $H$ mit dem
  Korespondieren eigenvector $v$ so folgt
  $
    abs(lambda) = abs(lambda) norm(v) / norm(v) = norm(lambda v) / norm(v) =
    norm(H v) / norm(v) <= norm(H).
  $

  Das charakteriische polynome von $H$ ergibt durch
  $
    det(H - lambda I) = (lambda_1 - lambda)(lambda_2 - lambda)
  $
  als polynom in $lambda$, für $lambda = 0$ folgt das $det(H) = lambda_1 dot
  lambda_2$.

  Somit folgt das
  $
    abs(det(H)) = abs(lambda_1 dot lambda_2) <= norm(H)^2.
  $


+ Sei $A = mat(a_11, a_12; a_21, a_22) in RR^(2 times 2)$ mit $det A != 0$ und
  $B = mat(b_11, b_12; b_21, b_22) in RR^(2 times 2)$.

  Aus Teil (a) wissen wir, dass
  $
    T_A det(B) = a_11 b_22 + b_11 a_22 - a_12 b_21 - b_12 a_21.
  $

  Nach dem Tipp gilt für $A$ mit $det A != 0$:
  $
    A^(-1) = 1 / (det A) mat(a_22, -a_12; -a_21, a_11).
  $

  Somit ist
  $
    tr(A^(-1) B) &= tr (1 / (det A) mat(a_22, -a_12; -a_21, a_11) mat(b_11, b_12; b_21, b_22) ) \
    &= 1 / (det A) tr (mat(a_22 b_11 - a_12 b_21, a_22 b_12 - a_12 b_22; -a_21 b_11 + a_11 b_21, -a_21 b_12 + a_11 b_22) ) \
    &= 1 / (det A) (a_22 b_11 - a_12 b_21 - a_21 b_12 + a_11 b_22) \
    &= 1 / (det A) (a_11 b_22 + a_22 b_11 - a_12 b_21 - a_21 b_12).
  $

  Vergleichen wir dies mit $T_A det(B)$:
  $
    T_A det(B) = a_11 b_22 + b_11 a_22 - a_12 b_21 - b_12 a_21 = a_11 b_22 + a_22 b_11 - a_12 b_21 - a_21 b_12.
  $

  Daher folgt
  $
    T_A det(B) = det(A) dot tr(A^(-1) B).
  $
