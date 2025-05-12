#import "common.typ": *

#show: problemset(2)

#exercise([10])[
  Sei $X$ ein metrischer Raum.
  + Sei $(x_n)$ eine Cauchy-Folge und $\(x_(n_k)\)$ eine konvergente Teilfolge.
    Zeigen Sie, dass $(x_n)$ konvergiert.
  + Zeigen Sie, dass jeder folgenkompakte metrische Raum vollständig ist.
]

*_Beweis_:*

+ Sei $epsilon > 0$. Wählen wir $N in NN$ so, dass für alle $k, n >= N$
  $distance(x_n, x_(n_k)) < epsilon / 2$ und
  $distance(x_(n_k), x_infinity) < epsilon / 2$ gilt. Dann folgt:
  $
    epsilon = epsilon / 2 + epsilon / 2 &> distance(x_n, x_(n_k)) +
    distance(x_(n_k), x_infinity) \
    &>= distance(x_n, x_infinity).
  $
  Dies zeigt, dass $x_n$ gegen $x_infinity$ konvergiert.

+ Sei $(x_n)$ eine Cauchy-Folge. Da $X$ folgenkompakt ist, besitzt $(x_n)$ eine
  konvergente Teilfolge $(x_(n_k))$. Mit (1) folgt nun, dass $(x_n)$
  konvergiert. Somit konvergiert jede Cauchy-Folge in $X$.

#pagebreak()

#exercise([30 = 10 + 10 + 10])[
  Sei $X$ ein metrischer Raum. Wir bezeichnen mit $scr(P)(X)$ die Menge aller
  Teilmengen von $X$.
  + Sei $scr(A) subset.eq scr(P)(X)$ eine Menge von folgenabgeschlossenen
    Teilmengen von $X$. Zeigen Sie, dass $inter.big scr(A)$ folgenabgeschlossen
    ist.
  + Seien $A_1, ..., A_n subset.eq X$ folgenabgeschlossene Teilmengen von $X$.
    Zeigen Sie, dass $union.big_(i=1)^n A_i$ folgenabgeschlossen ist.
  + Geben Sie ein Beispiel, das zeigt, dass beliebige Vereinigungen von
    folgenabgeschlossenen Teilmengen nicht folgenabgeschlossen sein müssen.
]

*_Beweis_:*

+ Sei $(x_n) in inter.big scr(A)^NN$ eine konvergente Folge in $X$. Dann folgt
  für alle $scr(A)$, dass $(x_n) in
  scr(A)^NN$ ist. Da alle $scr(A)$ folgenabgeschlossen sind, folgt
  $x_infinity in scr(A)$. Da $x_infinity in scr(A)$ für alle $scr(A)$ gilt,
  folgt $x_infinity in
  inter.big scr(A)$. Somit ist $inter.big scr(A)$ folgenabgeschlossen.

+ Sei $(x_n) in (union.big_(i=1)^n A_i)^NN$ eine konvergente Folge in $X$.
  Wählen wir eine Teilfolge $(x_(n_k))$ so, dass $(x_(n_k)) in A_j^NN$ für ein
  $j
  in {1, ..., n}$. Da $(x_n)$ konvergiert, konvergiert auch jede Teilfolge von
  $(x_n)$ gegen denselben Grenzwert. Da $A_j$ folgenabgeschlossen ist, folgt
  $x_(n_infinity) = x_infinity in A_j$ und somit
  $x_infinity in union.big_(i=1)^n A_i$.

+ Wählen wir $A_n := {1 / n} subset.eq RR$. Dann ist für alle $n in NN$ die
  Menge $A_n$ folgenabgeschlossen, da die einzige Folge in $A_n$, nämlich die
  konstante Folge $(1 / n)$, in $A_n$ konvergiert.

  Betrachten wir die Folge $(1 / n)_(n in NN)$ in der Vereinigung
  $union.big A_n$. Diese konvergiert in $RR$ gegen 0. Da 0 in keinem der $A_n$
  liegt, kann $union.big A_n$ nicht folgenabgeschlossen sein.

#pagebreak()

#exercise([20 = 10 + 10])[
  Sei $f: RR -> RR$ additiv, das heißt für alle $x,y in RR$ gilt
  $f(x+y) = f(x) + f(y)$.
  + Sei $r in RR$ und $r QQ := {r q : q in QQ}$. Zeigen Sie, dass es ein $s =
    s(r) in RR$ gibt, sodass für alle $x in r QQ$ gilt $f(x) = s x$.
  + Zeigen Sie, dass die folgenden Aussagen äquivalent sind:
    + $f$ ist an der Stelle 0 stetig.
    + $f$ ist stetig.
    + Es gibt ein $s in RR$, sodass für alle $x in RR$ gilt $f(x) = s x$, das
      heißt $f$ ist linear.

  _Bemerkung._ #h(1em) Es gibt nicht-lineare additive Funktionen $f: RR -> RR$,
  die nirgends stetig sind.
]

*_Beweis_:*

+ Sei $n in NN$ sowie $x in RR$. Dann folgt:
  $
    n f(x) & = underbrace(f(x) + ... + f(x), n"-mal") \
    & = f\(underbrace(x + ... + x, n"-mal")\) \
    & = f(n x).
  $
  Also ist $f$ homogen für Skalare in $NN$.

  Sei $x in r QQ$. Dann folgt $x = r m / n$ für $m,n in ZZ$. Mit der Additivität
  und $NN$-skalaren Homogenität von $f$:
  $
    n f(x) = n f(r m / n) = f(r m) = m f(r)
  $
  Stellen wir nun nach $f(x)$ um, erhalten wir
  $
    f(x) = m / n f(r).
  $

  Setzen wir nun gleich, erhalten wir
  $
    f(x) = m / n f(r) = s x = s r m / n => s = f(r) / r.
  $

+ *(a) $=>$ (b)*
  Sei $epsilon > 0$ sowie $x in RR$. Da $f$ stetig in 0 ist, existiert ein
  $delta > 0$, sodass für alle $tilde(x) in RR$ mit $abs(tilde(x)) <= delta$
  gilt:
  $
    abs(f(0) - f(tilde(x))) = abs(f(0 - tilde(x))) <= abs(f(delta)) < epsilon.
  $
  Somit folgt für $abs(x-tilde(x)) <= delta$:
  $
    abs(f(x) - f(tilde(x))) = abs(f(x - tilde(x))) = abs(f(delta)) < epsilon.
  $

  *(b) $=>$ (c)*

  Sei $x in RR$. Für jedes $x in RR$ existiert eine Folge $(x_n) in QQ^NN$ mit
  $lim_(n -> infinity) x_n = x$. Da $f$ stetig und somit folgenstetig ist,
  folgt: $lim_(n -> infinity) f(x_n) = f(lim_(n -> infinity) x_n) = s x$.

  *(c) $=>$ (a)* Beweis Analysis 1: Lineare Funktionen sind stetig.
