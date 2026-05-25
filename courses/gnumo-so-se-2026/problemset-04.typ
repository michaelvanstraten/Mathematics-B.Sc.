#import "common.typ": *

#show: problemset("4")

#exercise([Diskrete Fourier-Transformation], [5])[

  + Bestimmen Sie die reellen Fourierkoeffizienten zu den drei Stützstellen
    $x_j = 2 pi j \/ 3$ mit $j = 0, dots, 2$ für die folgende Funktion
    $
      f(x) = cases(
        -1 & "für" 0 <= x < pi\,,
        1 & "für" pi <= x < 2 pi.
      )
    $
    Geben Sie das reelle trigonometrische Interpolationspolynom
    $t_2 : [0, 2 pi] -> RR$ explizit an.

  + Es seien die folgenden Matrizen $D, L in CC^((n+1) times (n+1))$ gegeben
    $
      D = mat(
        2, -1, 0, dots, -1;
        -1, 2, -1, dots, 0;
        0, dots.down, dots.down, dots.down, 0;
        0, dots, -1, 2, -1;
        -1, 0, dots, -1, 2;
      ), quad
      L = mat(
        4 sin^2(frac(0 pi, n+1)), , , 0;
        , 4 sin^2(frac(pi, n+1)), , ;
        , , dots.down, ;
        0, , , 4 sin^2(frac(n pi, n+1));
      ).
    $
    Es bezeichne $cal(F)$ die Systemmatrix der diskreten Fourier-Transformation
    und $cal(F)^(-1)$ ihre Inverse, d.h. zu Stützstellen
    $x_j = 2 pi j \/ (n + 1)$ für $j = 0, 1, dots, n$ im Intervall $[0, 2 pi]$
    und Stützwerten $y = (y_0, dots, y_n)^top$ gilt $(cal(F) y)_j = c_j$. Zeigen
    Sie, dass $D = cal(F)^(-1) L cal(F)$ gilt.

    _Hinweis._ Verwenden Sie die Darstellung
    $sin(z) = (bold(e)^(i z) - bold(e)^(-i z)) \/ 2 bold(i)$ für beliebige
    $z in CC$.
]

=== Lösung

#pagebreak()

#exercise([Bestapproximation], [5])[

  Zeigen Sie die beliebig schlechte Konvergenz von Bestapproximationen. Gegeben
  sei eine geschachtelte Folge $(V_ell)_(ell in NN_0)$ endlich dimensionaler
  Teilräume eines Hilbertraums $(H, chevron.l dot, dot chevron.r)$ mit
  $V_ell subset.eq V_(ell+1)$ für alle $ell in NN_0$. Für ein beliebiges
  $x in H$ und $ell in NN_0$ sei $x_ell in V_ell$ die Bestapproximation von $x$
  in $V_ell$ mit Approximationsfehler $delta_ell := norm(x - x_ell)_H$. Es ist
  klar, dass $(delta_ell)_(ell in NN_0)$ monoton fallend und konvergent mit
  Limes $delta_infinity >= 0$ ist.

  + Zeigen Sie, dass $delta_infinity = 0$ genau dann gilt, wenn
    $x in V_infinity := overline(union.big_(ell in NN_0) V_ell)$.

  + Es sei außerdem eine monoton fallende Nullfolge $(delta_ell)_(ell in NN_0)$
    gegeben. Konstruieren Sie ein $x in V_infinity$ mit diesen vorgegebenen
    Approximationsfehlern $delta_ell := norm(x - x_ell)_H$ für die
    Bestapproximation $x_ell$ von $x$ in $V_ell$.

    _Hinweis._ Unter Ausnutzung der Eigenschaften eines Orthonormalsystems
    $(psi_ell)_(ell in NN_0)$ ist zu zeigen, dass es sich bei
    $(sum_(j=1)^ell (delta_(j-1)^2 - delta_j^2)^(1\/2) psi_j)_(ell in NN)$
    um eine Cauchy-Folge handelt.
]

=== Lösung


#let innerp(a, b) = $chevron.l #a, #b chevron.r$

+ "$arrow.long.double$"

  Wenn $lim_(l -> infinity) delta_l = 0$ existiert eine folge
  $x_l in union.big_(l in NN_0) V_l$ und ein $x in H$ so das
  $lim_(l -> infinity) x_l = x$. Da $x_l$ eine konvergente folge in
  $union.big_(l in NN_0) V_l$ ist. Folgt das dessen grenswert im folgenabschluss
  $overline(union.big_(l in NN_0) V_l)$ liegen muss.

  "$arrow.long.double.l$"

  Sei $x in V_infinity = overline(union.big_(l in NN_0) V_l)$. Nach Definition
  des Abschlusses existiert eine Folge
  $(v_k)_(k in NN) subset union.big_(l in NN_0) V_l$ mit $v_k -> x$ in $H$. Zu
  jedem $k in NN$ gibt es ein $l_k in NN_0$ mit $v_k in V_(l_k)$. Da
  $x_(l_k) in V_(l_k)$ die Bestapproximation von $x$ in $V_(l_k)$ ist, gilt
  $
    0 <= delta_(l_k) = norm(x - x_(l_k))_H <= norm(x - v_k)_H <= epsilon
  $
  also $delta_(l_k) -> 0$. Weil $(delta_l)_(l in NN_0)$ monoton fallend und
  nichtnegativ ist, folgt $delta_infinity = lim_(l -> infinity) delta_l = 0$.
  $checkmark$

+ O.B.d.A nehmen wir $V_(l-1) subset.neq V_l$ für alle $l in NN$ an
  (anderenfalls gilt $delta_(l-1) = delta_l$, der entsprechende Summand
  verschwindet und der Index kann übersprungen werden). Mittels
  Gram--Schmidt-Verfahrens konstruieren wir aus einer Folge von Basen der $V_l$
  ein Orthonormalsystem $(psi_l)_(l in NN)$ in $H$ mit
  $
    psi_l in V_l, quad psi_l perp V_(l-1) quad "für alle" l in NN,
  $
  so dass insbesondere $V_l = "span"(psi_1, dots, psi_l)$ für alle $l in NN$ und
  $V_0 = {0}$ angenommen werden darf.

  Betrachten wir die Folge
  $
    a_l := sum_(j=1)^l (delta_(j-1)^2 - delta_j^2)^(1/2) psi_j.
  $
  Wegen $psi_j in V_j subset.eq V_l$ für $j <= l$ gilt $a_l in V_l$. Für
  $n, m in NN$ mit $n <= m$ folgt aus der Orthonormalität der $psi_j$
  $
    norm(a_m - a_n)_H^2 & = norm(sum_(j=n+1)^m (delta_(j-1)^2 - delta_j^2)^(1/2) psi_j)_H^2 \
    & = sum_(j=n+1)^m (delta_(j-1)^2 - delta_j^2) \
    & = delta_n^2 - delta_m^2 quad "(Teleskopsumme)".
  $
  Da $(delta_l)$ eine Nullfolge ist, ist auch $(delta_l^2)$ eine Nullfolge und
  insbesondere Cauchy. Damit ist $(a_l)$ eine Cauchy-Folge in $H$. $checkmark$

  Da $H$ vollständig ist, konvergiert $(a_l)$ in $H$. Wir setzen
  $
    x := lim_(l -> infinity) a_l.
  $
  Nach Konstruktion gilt $a_l in union.big_(l in NN_0) V_l$ für alle $l$, also
  $x in overline(union.big_(l in NN_0) V_l) = V_infinity$.

  Nach Satz 2.26 ist $p in V_l$ genau dann die Bestapproximation von $x$ in
  $V_l$, wenn $innerp(x - p, s) = 0$ für alle $s in V_l$ gilt. Wir zeigen diese
  Bedingung für $p = a_l$: Für $j > l$ steht $psi_j$ wegen $psi_j perp V_(j-1)$
  und $V_l subset.eq V_(j-1)$ orthogonal auf jedem $s in V_l$. Mit der
  Stetigkeit des Skalarprodukts folgt für $s in V_l$

  $
    innerp(x - a_l, s) & = lim_(m -> infinity) innerp(a_m - a_l, s) \
    & = lim_(m -> infinity) sum_(j=l+1)^m (delta_(j-1)^2 - delta_j^2)^(1/2) innerp(psi_j, s) = 0.
  $
  Da zudem $a_l in V_l$ ist, ist $a_l$ die Bestapproximation, d.h. $x_l = a_l$.

  Aus der Stetigkeit der Norm und der obigen Teleskoprechnung folgt
  $
    norm(x - x_l)_H^2 = norm(x - a_l)_H^2
    = lim_(m -> infinity) norm(a_m - a_l)_H^2
    = lim_(m -> infinity) (delta_l^2 - delta_m^2) = delta_l^2,
  $
  also $norm(x - x_l)_H = delta_l$ wie gewünscht. $checkmark$

#pagebreak()

#exercise([Tschebyscheff-Polynome], [5])[

  Beweisen Sie für die Tschebyscheff-Polynome $T_j = cos(j arccos(x))$ und
  $c_0 = pi$, $c_j = pi \/ 2$ für $j in NN$, dass
  $
    integral_(-1)^1 frac(T_j (x) T_k (x), sqrt(1 - x^2)) dif x = c_k delta_(j k)
    quad "für" j, k in NN.
  $
]

=== Lösung
