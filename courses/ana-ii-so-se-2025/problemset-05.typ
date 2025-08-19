#import "common.typ": *

#show: problemset(5)

#exercise([20 = 10 + 10])[
  Wir betrachten den normierten Vektorraum $(ell^2(NN, RR), norm(-)_(ell^2))$
  definiert durch
  $
    ell^2(NN, RR) := {(x_n) in RR^NN : sum_(n=1)^infinity abs(x_n)^2 < infinity}
  $
  und
  $
    norm((x_n))_(ell^2) := (sum_(n=1)^infinity abs(x_n)^2)^(1 / 2).
  $

  + Zeigen Sie, dass der metrische Raum $ell^2(NN, RR)$ vollständig ist.

  + Zeigen Sie, dass der metrische Raum $ell^2(NN, RR)$ nicht folgenkompakt ist.
]

*Beweis*

r Sei $(x^((n)))_(n in NN)$ eine Cauchy-Folge in $ell^2(NN, RR)$, wobei
$x^((n)) = (x^((n))_k)_(k in NN)$ für jedes $n in NN$.

Sei $epsilon > 0$. Da $(x^((n)))$ eine Cauchy-Folge ist, existiert $N in NN$ so
dass für alle $n, m >= N$ gilt:
$
  norm(x^((n)) - x^((m)))_(ell^2) < epsilon.
$

Für jedes feste $k in NN$ folgt:
$
  |x^((n))_k - x^((m))_k|^2 <= sum_(j=1)^infinity |x^((n))_j - x^((m))_j|^2
  = norm(x^((n)) - x^((m)))_(ell^2)^2 < epsilon^2.
$

Somit ist $(x^((n))_k)_(n in NN)$ eine Cauchy-Folge in $RR$ für jedes $k in NN$.
Da $RR$ vollständig ist, konvergiert jede dieser Folgen. Definiere:
$
  x_k := lim_(n -> infinity) x^((n))_k quad "für alle" k in NN.
$

Wir zeigen nun, dass $x = (x_k)_(k in NN) in ell^2(NN, RR)$ und dass
$x^((n)) -> x$ in der $ell^2$-Norm.

Sei $epsilon > 0$ und $N$ wie oben gewählt. Für $n, m >= N$ und beliebiges
$K in NN$ gilt:
$
  sum_(k=1)^K |x^((n))_k - x^((m))_k|^2 <= norm(x^((n)) - x^((m)))_(ell^2)^2 < epsilon^2.
$

Lassen wir $m -> infinity$, so erhalten wir:
$
  sum_(k=1)^K |x^((n))_k - x_k|^2 <= epsilon^2.
$

Da dies für alle $K in NN$ gilt, folgt:
$
  norm(x^((n)) - x)_(ell^2)^2 = sum_(k=1)^infinity |x^((n))_k - x_k|^2 <= epsilon^2.
$

Insbesondere ist $x^((n)) - x in ell^2(NN, RR)$ für $n >= N$. Da
$x^((n)) in ell^2(NN, RR)$, folgt
$x = x^((n)) - (x^((n)) - x) in ell^2(NN, RR)$.

Somit konvergiert $(x^((n)))$ gegen $x$ in $ell^2(NN, RR)$, was die
Vollständigkeit beweist.

+ Wir zeigen, dass $ell^2(NN, RR)$ nicht folgenkompakt ist, indem wir eine Folge
  konstruieren, die keine konvergente Teilfolge besitzt.

  Betrachte die Folge $(e^((n)))_(n in NN)$, wobei $e^((n))$ der $n$-te
  Einheitsvektor ist:
  $
    e^((n))_k := cases(
      1 & "falls" k = n,
      0 & "sonst"
    ).
  $

  Für $n != m$ gilt:
  $
    norm(e^((n)) - e^((m)))_(ell^2)^2 = sum_(k=1)^infinity |e^((n))_k - e^((m))_k|^2
    = 1^2 + 1^2 = 2.
  $

  Somit ist $norm(e^((n)) - e^((m)))_(ell^2) = sqrt(2)$ für alle $n != m$.

  Angenommen, $(e^((n_k)))_(k in NN)$ wäre eine konvergente Teilfolge mit
  Grenzwert $x in ell^2(NN, RR)$. Dann müsste für $epsilon = 1 < sqrt(2)/2$ ein
  $K in NN$ existieren, so dass für alle $j, k >= K$ gilt:
  $
    norm(e^((n_j)) - e^((n_k)))_(ell^2) <= norm(e^((n_j)) - x)_(ell^2) + norm(x - e^((n_k)))_(ell^2) < 2 epsilon = 2.
  $

  Dies ist ein Widerspruch, da
  $norm(e^((n_j)) - e^((n_k)))_(ell^2) = sqrt(2) > 2$ für $j != k$.

  Somit besitzt $(e^((n)))$ keine konvergente Teilfolge, und $ell^2(NN, RR)$ ist
  nicht folgenkompakt.

#pagebreak()

#exercise([20])[
  Sei $K$ ein folgenkompakter metrischer Raum, $Y$ ein metrischer Raum und
  $f: K -> Y$ stetig. Beweisen Sie, mit Hilfe des Lemmas von der Lebesguezahl
  dass $f$ gleichmäßig stetig ist ohne den und schon bekannten Satz von
  Cantor–Heine zu benutzen.

  *Anfang des Beweises.* Sei $epsilon > 0$. Für jedes $x in X$ sei
  $delta_x > 0$,
  $
    f(B_(delta_x)(x)) subset.eq B_epsilon(f(x)).
  $
  $cal(U) := {B_(delta_x)(x) : x in X}$
  ist eine offene Überdeckung von $X$ und hat somit eine Lebesguezahl
  $delta > dots$
]

*Beweis fortführung*

$0$ so das für jedes $x in X$ ein $U in cal(U)$ existiert so dass, $B_delta(x)
subset.eq U$ liegt.


#pagebreak()

#exercise([20 = 10 + 10])[
  + Sei $K$ ein kompakter metrischer Raum, $Y$ ein metrischer Raum und
    $f: K -> Y$ stetig und bijektiv. Zeigen Sie, dass $f^(-1)$ stetig ist.

  + Finden Sie metrische Räume $X, Y$ und eine stetige bijektive Abbildung
    $f: X -> Y$, so dass $f^(-1)$ unstetig ist.
]

*Beweis*

+ Laut Proposition 8.12 ist $f^(-1)$ genau dann stetig, wenn für jede
  abgeschlossene Teilmenge $U subset.eq K$ gilt, dass $(f^(-1))^(-1)(U) = f(U)$
  ebenfalls abgeschlossen ist.

  Sei also $U subset.eq K$ abgeschlossen. Da $K$ kompakt ist, ist jede
  abgeschlossene Teilmenge $U subset.eq K$ ebenfalls kompakt. Da $f$ stetig ist
  und stetige Bilder kompakter Mengen kompakt sind, folgt, dass $f(U)$ kompakt
  ist. Da kompakte Teilmengen metrischer Räume abgeschlossen sind, ist $f(U)$
  abgeschlossen in $Y$.

  Somit ist $(f^(-1))^(-1)(U) = f(U)$ abgeschlossen, was die Stetigkeit von
  $f^(-1)$ beweist.

+ Wähle $X = [0, 1] union (2, 3]$, $Y = [0, 2]$ und
  $
    f(x) := cases(
      x & "falls" x in [0, 1],
      x - 1 & "falls" x in (2, 3]
    ).
  $

  Diese Funktion ist stetig, da sie auf jedem der beiden zusammenhangslosen
  Teilintervalle von $X$ stetig ist.

  Die Umkehrfunktion ist gegeben durch
  $
    f^(-1)(y) := cases(
      y & "falls" y in [0, 1],
      y + 1 & "falls" y in (1, 2]
    ).
  $

  Diese ist jedoch unstetig bei $y = 1$.

