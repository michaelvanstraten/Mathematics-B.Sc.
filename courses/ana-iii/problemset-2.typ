#import "common.typ": *

#show: problemset("2")

#set enum(numbering: "(i)", indent: 1em)

#exercise([20 = 10 + 10])[
  + Wir bezeichnen mit
    $
      scr(D)_d := {emptyset} union {W_(k comma n) times : k in ZZ comma n in ZZ^d}
      subset scr(P)(RR^d)
    $
    die Teilmenge der *dyadischen Würfel* $W_(k comma n)$ definiert durch
    $
      W_(k comma n) := [2^(-k) n_1 comma 2^(-k) (n_1 + 1)) times dots.c times
      [2^(-k) n_d comma 2^(-k) (n_d + 1)).
    $
    Hierbei heißen $k in ZZ$ die *Stufe* und $n in ZZ^d$ der *Index* von
    $W_(k comma n)$. Zeigen Sie, dass
    $
      scr(B)(RR^d) = angle.l scr(D)_d angle.r_sigma.
    $

  + Zeigen Sie, dass für alle $k in ZZ$ und $n in ZZ^d$ gilt
    $
      beta_d (W_(k comma n)) = 2^(-d k).
    $
]

=== Lösung

+ Zeigen wir zunächst das $scr(D)_d subset.eq scr(B)(RR^d)$ ist.

  Bemerken wir dafür, dass jeder dyadische Würfel $W_(k,n)$ als eine Folge
  $(W_m) in scr(B)(RR^d)^NN$ wie folgt dargestellt werden kann
  $
    W_m = (2^(-k)n_1 - 1/m, 2^(-k)(n_1 + 1))
    times dots.c times (2^(-k)n_d - 1/m, 2^(-k)(n_d +1))
  $
  mit
  $
    W_(k,n) = inter.big W_m.
  $
  Da $scr(B)(RR^d)$ eine $sigma$-Algebra ist, muss somit $W_(k,n)$ Teil dieser
  $sigma$-Algebra sein nach $Sigma$3.

  Sei nun $U subset.eq scr(B)(RR^d)$ eine beliebige offene Menge in der Borel
  $sigma$-Algebra. Für jedes $x in U$ existiert ein $epsilon > 0$, sodass
  $B_(epsilon)(x)$ ganz in $U$ liegt mit $x in B_(epsilon)(x)$. Wählen wir nun
  $k = log_2(2/epsilon)$, so folgt, dass ein $n in NN^d$ existiert, sodass
  $W_(k,n)(x) subset.eq B_(epsilon)(x)$. Da $W_(n,k)(x) in scr(B)(RR^d)$ und es
  nur abzählbar unendlich viel $W_(k,n)(x)$ gibt ($2^(-k) in QQ$) muss
  $
    U subset.eq union.big_(x in U) W_(k,n)(x)
  $
  nach $Sigma$3.

  Somit folgt $scr(B)(RR^d) = angle.l scr(D)_d angle.r_sigma$.

+ Der Einheitsquader lässt sich für jedes Level $k$ als disjunkte Vereinigung
  aus endlich vielen Elementen in $scr(D)_d$ darstellen.

  Definieren wir hierfür zunächst die Indexmenge $I$ wie folgt
  $
    I := { n in NN | 1 <= n <= 2^k }^d subset.eq ZZ^d
  $
  mit $abs(I) = 2^k^d$.

  So lässt sich der Einheitsquader $bb(1)_d$ wie folgt darstellen
  $
    bb(1)_d = union.big_(i in I) W_(k, i).
  $

  Da jeder dyadische Würfel $W_(k,n)$ mit gleichem Level kongruent ist und das
  Maß des Einheitsquaders durch das Borel-Maß auf eins normiert ist, folgt, dass
  $
    1 = beta(bb(1)_d) & = beta(union.big_(i in I) W_(k, i)) \
                      & = sum_(i in I) beta(W_(k, i)) \
                      & = 2^k^d beta(W_(k,n))
  $
  wobei $n in ZZ^d$ aufgrund der Translationsinvarianz von $beta$ beliebig
  gewählt werden kann.

  Somit folgt für jedes $k in ZZ$ und $n in ZZ^d$, dass
  $beta_d (W_(k comma n)) = 2^(-d k).$

#pagebreak()

#set enum(numbering: "(1)", indent: 1em)

#exercise([30 = 10 + 10 + 10])[

  Wir betrachten $[0 comma 1]$ mit der von $d_(#smallcaps[Euklid])$ erzeugten
  Topologie.

  + Zeigen Sie, dass die folgenden Teilmengen von $scr(P)([0 comma infinity])$
    jeweils die #smallcaps[Borel]–$sigma$–Algebra $scr(B)([0 comma infinity])$
    erzeugen
    $
      {[a comma infinity) : a in [0 comma infinity]},
      quad {(a comma infinity] : a in [0 comma infinity)}, \
      {[0 comma a] : a in [0 comma infinity]}
      quad "und" quad {[0 comma a) : a in (0 comma infinity)}.
    $

  + Zeigen Sie, dass die #smallcaps[Cantor]–Menge
    $
      C := {x in [0 comma 1] : "die ternäre Entwicklung von" x
        "enthält die Ziffer 1 nicht"}
    $
    #smallcaps[Borel]–meßbar ist.

  + Sei $C subset [0 comma 1] subset RR$ die #smallcaps[Cantor]-Menge. Zeigen
    Sie, dass $beta_1 (C) = 0$.
]

=== Lösung

+ Definieren wir zunächst Labels für die einzelnen Menge mit
  $
    A_1 := {[a comma infinity) : a in [0 comma infinity]},
    quad
    A_2 := {(a comma infinity] : a in [0 comma infinity)}, \
    A_3 := {[0 comma a] : a in [0 comma infinity]}
    quad "und" quad
    A_4 := {[0 comma a) : a in (0 comma infinity)}.
  $

  *Wir zeigen nun, dass $angle.l A_1 angle.r_(sigma) = angle.l A_2
  angle.r_(sigma) = angle.l A_3 angle.r_(sigma) = angle.l A_4 angle.r_(sigma)$.*

  Da $[a, infinity) in A_1$ für alle $a in [0, infinity]$ ist, muss
  $[0, a) in angle.l A_1 angle.r_(sigma)$ für alle $a in (0, infinity)$ sein
  nach $Sigma 2$, also $angle.l A_4 angle.r subset.eq angle.l A_1 angle.r$. Dass
  $angle.l A_1 angle.r subset.eq angle.l A_4 angle.r$ folgt mit dem gleichen
  Argument, für welches zusätzlich auch die Äquivalenz von $A_3$ und $A_2$
  folgt.

  Wählen wir $a = 0$, so folgt, dass $[0, infinity] without [0, infinity) =
  {infinity} in angle.l A_1 angle.r_(sigma)$ sein muss. Somit folgt, dass
  $angle.l A_1 angle.r_(sigma) subset.eq angle.l A_2 angle.r_(sigma)$, da man
  für jede Menge in $A_1$ eine Folge in $A_2$ mit dessen Grenzwert finden kann
  (hinsichtlich endlicher Vereinigung). Mit dem gleichen Argument folgt die
  Inklusion der sigma-Algebra generiert von $A_4$ in $A_3$.

  Wir erhalten $angle.l A_1 angle.r_(sigma) subset.eq angle.l A_2
  angle.r_(sigma) = angle.l A_3 angle.r_(sigma) subset.eq angle.l A_4
  angle.r_(sigma) = angle.l A_1 angle.r_(sigma)$.

  *Wir zeigen nun, dass $scr(B)([0, infinity]) subset.eq angle.l A_1
  angle.r_(sigma)$.*

  Jedes offene Intervall in $[0, infinity]$ lässt sich durch ein Element in
  $angle.l A_1 angle.r_(sigma)$ darstellen. Man nehme sich hierfür ein Intervall
  $(a, b) subset.eq [0,infinity]$, so folgt, dass
  $(a, infinity] in angle.l A_1 angle.r_(sigma)$ und dass
  $[0, b) in angle.l A_1 angle.r_(sigma)$ und somit
  $[0, b) inter (a, infinity] = (a, b) in angle.l A_1 angle.r_(sigma)$. Sei
  $U subset.eq scr(B)([0, infinity])$ eine offene Menge in der
  Borel-sigma-Algebra. Für $x in U$ existiert ein $epsilon > 0$, sodass
  $(x - epsilon, x + epsilon) subset.eq U$. Für jedes $epsilon$ existiert zudem
  ein $epsilon >= q > 0 in QQ$, sodass $x plus.minus q in [0,infinity] inter QQ$
  mit $(x - q, x +q) in angle.l A_1 angle.r_(sigma)$. Nehmen wir nun die
  abzählbare Vereinigung über alle dieser Intervalle in der sigma-Algebra
  erzeugt von $A_1$, so folgt $U in angle.l A_1 angle.r_(sigma)$ mit $Sigma 3$.
  Dass $angle.l A_1 angle.r_(sigma) subset.eq
  scr(B)([0, infinity])$ ist relativ leicht zu zeigen und diese Technik wurde
  auf diesem Übungsblatt bereits zur Genüge bewiesen.

+ Die #smallcaps[Cantor]-Menge lässt sich bekanntermaßen wie folgt rekursiv
  definieren: $A_0 = [0, 1]$ und $A_(n+1) = 1/3 (A_n union (2+A_n))$ und
  $C = inter.big A_n$. Mit (1) ist leicht zu sehen, dass jedes
  $A_n in scr(B)([0, infinity])$ ist.

  Mit Eigenschaft $Sigma 6$ folgt, dass $C in scr(B)([0, infinity])$.
