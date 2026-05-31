#import "common.typ": *

#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node, shapes

#show: problemset("6")

#exercise([6])[
  Anne, Betty, Chloë und Daisy waren in der Schule alle miteinander befreundet.
  Später trifft sich jedes der $binom(4, 2) = 6$ Paare; bei jedem der sechs
  Treffen streitet sich das jeweilige Paar mit einer festen Wahrscheinlichkeit
  $p in (0, 1)$ oder sie werden enge Freundinnen mit Wahrscheinlichkeit $1 - p$.
  Die Streitigkeiten treten unabhängig voneinander auf. Wenn in Zukunft eine der
  vier ein Gerücht hört, dann erzählt sie es nur ihren engen Freundinnen weiter.
  Wenn Anne ein Gerücht hört, wie groß ist die Wahrscheinlichkeit, dass:

  + Daisy es hört, wenn sie sich mit Anne gestritten hat?

  + Daisy es hört?

  + Daisy es hört, wenn Betty und Chloë sich gestritten haben?

  + Daisy es hört, wenn Anne und Betty sich gestritten haben?
]

=== Lösung

Wir definieren $Omega := {0,1}^6$ als unseren Ergebnisraum. Dabei beschreibt
$omega in Omega$ die Freundschaften zwischen Anne, Betty, Chloë und Daisy.
Wählen wir $scr(F) := scr(P)(Omega)$ sowie $PP : scr(F) -> [0, 1]$ als
$
  PP({omega}) = product_(i=1)^6 cases(p & "wenn" omega_i = 0, q := 1 - p & "sonst")
$

Wir bezeichnen mit $A B$ das Ereignis, dass Anne und Betty befreundet sind, und
definieren $A C$, $A D$, $B C$, $B D$, $C D$ analog. Da die sechs Treffen
unabhängig voneinander stattfinden, sind auch alle diese Ereignisse unabhängig.

#figure(
  diagram({
    node((2, 0), "Anne", name: <A>)
    node((0, 0), "Daisy", name: <D>)
    node((0, 2), "Chloë", name: <C>)
    node((2, 2), "Betty", name: <B>)

    edge(<A>, <D>, label: $A D$)
    edge(<D>, <C>, label: $C D$)
    edge(<C>, <B>, label: $B C$)
    edge(<B>, <A>, label: $A B$)
    edge(<A>, <C>, label: $A C$, label-anchor: "south", label-pos: 20%)
    edge(<D>, <B>, label: $B D$, label-anchor: "south", label-pos: 20%)
  }),
)

Sei $H$ das Ereignis, dass Daisy das Gerücht hört.

+ Anstatt das Ereignis zu betrachten, dass Daisy es hört, wenn sie sich mit Anne
  gestritten hat, betrachten wir das Komplementärereignis, dass Daisy es nicht
  hört.

  Daisy hört nichts, wenn im Freundschaftsgraphen kein Pfad von Anne zu Daisy
  existiert. Wir zerlegen dieses Ereignis in folgende disjunkte Fälle (jeweils
  bedingt auf $A D^c$):

  *"A hat weder mit B noch mit C eine Freundschaft"*:
  $
    PP(A B^c inter A C^c) = p dot p = p^2
  $

  *"A ist mit B befreundet, aber nicht mit C, und B nicht mit D"*:
  $
    PP(A B inter A C^c inter B D^c inter C D^c) = q dot p^3
  $

  *"A ist mit C befreundet, aber nicht mit B, und C nicht mit D"*:
  $
    PP(A C inter A B^c inter B D^c inter C D^c) = q dot p^3
  $

  *"A, B und C sind untereinander befreundet, aber keine ist mit D befreundet"*:

  Wir bemerken zunächst, dass wir dieses Ereignis als Schnitt zweier
  unabhängiger Ereignisse schreiben können, nämlich "$A$, $B$ und $C$ sind
  untereinander befreundet" und $B D^c inter C D^c$.

  Der Teilgraph auf den Knoten $A$, $B$, $C$ ist genau dann nicht
  zusammenhängend, wenn entweder alle drei Freundschaften fehlen oder nur eine
  vorhanden ist. Diese Fälle sind disjunkt. Den Fall "nur eine Freundschaft
  vorhanden" gibt es genau dreimal, da $binom(3, 2) = 3$, jeweils mit der
  gleichen Wahrscheinlichkeit. Also folgt
  $
    PP("A, B und C sind untereinander befreundet") = 1 - (p^3 + 3 q p^2).
  $
  und damit
  $
    PP("A, B, C befreundet, aber keine Freundschaft zu D") & = \
    PP("A, B, C befreundet" inter (B D^c inter C D^c)) & = (1 - (p^3 + 3 q dot p^2)) dot p^2.
  $

  Mit der Disjunktheit der vier Ereignisse folgt
  $
    PP(H | A D^c) & = 1 - PP(H^c | A D^c) \
                  & = 1 - (p^2 + 2 q dot p^3 + (1 - (p^3 + 3 q dot p^2)) dot p^2) \
                  & = -2 p^5 + 5 p^4 - 2 p^3 - 2 p^2 + 1.
  $

+ Wir bemerken, dass $(A D, A D^c)$ eine disjunkte Zerlegung von $Omega$ bildet.
  Mit dem _Satz von der totalen Wahrscheinlichkeit_ folgt:
  $
    PP("Daisy hört es") = PP(H) = PP(H | A D) dot PP(A D) + PP(H | A D^c) dot PP(A D^c).
  $

  Die Wahrscheinlichkeit, dass Daisy das Gerücht hört, gegeben dass Daisy und
  Anne befreundet sind, ist gleich $1$, und $PP(H | A D^c)$ haben wir bereits in
  a) berechnet. Somit folgt:
  $
    PP("Daisy hört es") = q + (-2 p^5 + 5 p^4 - 2 p^3 - 2 p^2 + 1) dot p.
  $

+ Wir betrachten wiederum die Gegenwahrscheinlichkeit $PP(H^c | B C^c)$. Da
  Betty und Chloë zerstritten sind, gibt es nur noch drei mögliche
  Freundschaftspfade von Anne zu Daisy, nämlich über $A D$, über $A B inter B
  D$ und über $A C inter C D$. Daisy hört das Gerücht also genau dann nicht,
  wenn alle drei Pfade unterbrochen sind:
  $
    PP(H^c | B C^c) = PP(A D^c inter (A B inter B D)^c inter (A C inter C D)^c).
  $
  Da die drei Ereignisse $A D$, $A B inter B D$ und $A C inter C D$ paarweise
  disjunkte Freundschaften verwenden, sind sie unabhängig, und es folgt
  $
    PP(H | B C^c) = 1 - p dot (1 - q^2)^2.
  $

+ Auch hier betrachten wir die Gegenwahrscheinlichkeit $PP(H^c | A B^c)$. Da
  Anne und Betty zerstritten sind, sind die einzigen verbleibenden
  Freundschaftspfade von Anne zu Daisy:
  $
    A D, quad A C inter C D, quad A C inter B C inter B D.
  $
  Pfade über $B$ können $B$ nur über $C$ erreichen, da $A$ und $B$ nicht
  befreundet sind. Damit gilt
  $
    H | A B^c = A D union (A C inter (C D union (B C inter B D))).
  $
  Daisy hört also genau dann nichts, wenn $A D^c$ eintritt und zusätzlich
  entweder $A C^c$ gilt oder $A$ und $C$ befreundet sind, aber sowohl $C D$ als
  auch der Pfad über $B C inter B D$ unterbrochen sind. Mit der Unabhängigkeit
  der beteiligten Freundschaften folgt
  $
    PP(H^c | A B^c) & = PP(A D^c) dot (PP(A C^c) + PP(A C) dot PP(C D^c) dot PP((B C inter B D)^c)) \
    & = p dot (p + q dot p dot (1 - q^2)) \
    & = p^2 (1 + q - q^3),
  $
  und somit
  $
    PP(H | A B^c) = 1 - p^2 (1 + q - q^3) = 1 - p^2 - 2 p^3 + 3 p^4 - p^5.
  $

#pagebreak()

#exercise([3 + 3])[
  *Zufallsvariablen*

  + Sei $( Omega, scr(F), PP) = ([0, 1), cal(B)([0, 1)), lambda_([0,1)))$. Für
    $n in NN$ sei
    $
      X_n (omega) := floor(n omega) / n, quad omega in Omega.
    $
    Dabei bezeichnet $floor(x) := max{z in ZZ : z <= x}$ die größte ganze Zahl,
    die kleiner oder gleich $x$ ist.

    + Zeigen Sie, dass $X_n$ eine Zufallsvariable auf $(Omega, scr(F), PP)$ ist.

    + Bestimmen Sie die Wahrscheinlichkeitsverteilung von $X_n$.

  + Es sei $X : (Omega, scr(F)) -> (E, scr(E))$ eine Zufallsvariable und
    $sigma(X) := {X^(-1)(B) | B in scr(E)}$. Zeigen Sie, dass für jede
    $sigma(X)$-messbare Zufallsvariable
    $Y : (Omega, scr(F)) -> (RR, cal(B)(RR))$ eine
    $scr(E)$-$cal(B)(RR)$-messbare Funktion $h : E -> RR$ existiert, sodass
    $Y(omega) = h(X(omega))$ für alle $omega in Omega$ ist.
]

=== Lösung

#pagebreak()

#exercise([3 + 3])[
  *Zufallsvariablen und Unabhängigkeit*

  + Sei $(X_i)_(i in I)$ eine Familie unabhängiger, reellwertiger
    Zufallsvariablen. Zeigen Sie:

    + Sind $g_i : RR -> RR$, $i in I$, beliebige Borel-messbare Funktionen, so
      ist auch $(g_i (X_i))_(i in I)$ eine Familie unabhängiger
      Zufallsvariablen.

    + Im Fall $I = {1, 2, 3}$ und für Borel-messbare Funktionen
      $f : RR^2 -> RR$, $g : RR -> RR$, sind die Zufallsvariablen
      $Y = f(X_1, X_2)$ und $Z = g(X_3)$ unabhängig.

  + Es sei $(Omega, scr(F), PP)$ ein Wahrscheinlichkeitsraum und
    $scr(G), scr(H) subset scr(F)$ zwei unabhängige $sigma$-Algebren auf
    $Omega$. Zeigen Sie, dass jede reellwertige Zufallsvariable $X$ über
    $(Omega, scr(F), PP)$, die sowohl $scr(G)$-$cal(B)(RR)$-messbar als auch
    $scr(H)$-$cal(B)(RR)$-messbar ist, fast sicher konstant sein muss.
]

=== Lösung

#pagebreak()

#exercise([2 + 3 + 1])[
  In dieser Aufgabe geht es um die Verallgemeinerung der Dichtetransformation
  auf nicht-injektive Funktionen.

  + Zeigen Sie folgendes Resultat:

    Eine Menge $B in cal(B)(RR^n)$ besitze eine endliche Zerlegung in paarweise
    disjunkte Teilmengen $(B_i)_(i=0,dots,m) subset cal(B)(RR^n)$, d.h.
    $B = union.big_(k=0)^m B_k$ und $B_i inter B_j = emptyset$ für $i != j$,
    wobei $B_i$ offen ist für $i = 1, dots, m$ und $B_0$ eine Lebesgue-Nullmenge
    ist. Es sei $g : B -> RR^n$ eine messbare Funktion, so dass
    $g_(|B_k) : B_k -> RR^n$ injektiv und stetig differenzierbar ist mit auf
    $B_k$ regulärer Jacobimatrix für $k = 1, dots, m$. Hat eine Zufallsvariable
    $X$ mit Werten in $B$ eine Dichte $f_X$, so besitzt $Y := g(X)$ die Dichte
    $
      f_Y (y) = cases(
        sum_(k=1)^m f_X (g_k^(-1)(y)) abs(det J_(g_k^(-1))(y))
        bb(1)_(g(B_k))(y) & ":" y in union.big_(i=1)^m B_i\,,
        0 & ":" "sonst,"
      )
    $
    wobei $g_k^(-1) : g(B_k) -> B_k$ die Inverse von $g_(|B_k) : B_k -> RR^n$
    ist und $J_(g_k^(-1))$ deren Jacobimatrix.

  + Der Zufallsvektor $(X, Y)$ sei auf dem offenen Einheitskreis gleichverteilt,
    d.h. $(X, Y)$ habe die Dichte
    $
      f_((X,Y))(x, y) = cases(
        1/pi & "falls" x^2 + y^2 < 1\,,
        0 & "sonst."
      )
    $
    Uns interessiert die Verteilung von $(R, S)$ mit
    $
      R := sqrt(X^2 + Y^2) quad "und" quad
      S := arctan(Y \/ X) bb(1)_(RR without {0})(X).
    $

    + Zeigen Sie, dass $(R, S)$ eine Dichte $f_((R,S))$ besitzt und bestimmen
      Sie diese. _Hinweis: Verwenden Sie a)._

    + Berechnen Sie die Dichte von $R$.
]

=== Lösung

+ TODO

+ #linebreak()
  + Wir fassen $g(x, y) = (sqrt(x^2 + y^2), arctan(y \/ x))$ als Abbildung auf
    dem offenen Einheitskreis $B := {(x, y) in RR^2 : x^2 + y^2 < 1}$ auf und
    wollen a) anwenden. Da $g$ die Punkte $(x, y)$ und $(-x, -y)$ auf denselben
    Wert abbildet, ist $g$ nicht injektiv; wir zerlegen $B$ daher in
    $
      B_1 := {(x, y) in B : x > 0}, quad
      B_2 := {(x, y) in B : x < 0}, quad
      B_0 := {(x, y) in B : x = 0}.
    $
    Die Mengen $B_1, B_2$ sind offen und $B_0$ ist als Teilstück einer Geraden
    eine Lebesgue-Nullmenge im $RR^2$. Auf $B_1$ bzw. $B_2$ ist $g$ injektiv und
    stetig differenzierbar, und es gilt
    $
      g(B_1) = g(B_2) = (0, 1) times (-pi \/ 2, pi \/ 2) =: G.
    $
    Für $(r, s) in G$ sind die beiden Urbilder durch
    $
      g_1^(-1)(r, s) = (r cos s, r sin s) in B_1, quad
      g_2^(-1)(r, s) = (-r cos s, -r sin s) in B_2
    $
    gegeben (im Fall $x < 0$ liefert $arctan(y \/ x) = arctan(tan s) = s$ wegen
    $s in (-pi\/2, pi\/2)$ denselben Winkel). Die zugehörigen Jacobimatrizen
    $
      J_(g_1^(-1))(r, s) = mat(cos s, -r sin s; sin s, r cos s), quad
      J_(g_2^(-1))(r, s) = mat(-cos s, r sin s; -sin s, -r cos s)
    $
    haben jeweils die Determinante
    $
      abs(det J_(g_1^(-1))(r, s)) = abs(det J_(g_2^(-1))(r, s)) = r > 0,
    $
    sind also auf $G$ regulär. Mit dem Resultat aus a) und
    $f_((X,Y)) equiv 1\/pi$ auf $B$ folgt für $(r, s) in G$
    $
      f_((R,S))(r, s) & = f_((X,Y))(g_1^(-1)(r, s)) abs(det J_(g_1^(-1))(r, s))
                        + f_((X,Y))(g_2^(-1)(r, s)) abs(det J_(g_2^(-1))(r, s)) \
                      & = 1/pi dot r + 1/pi dot r = (2 r)/pi,
    $
    und $f_((R,S))(r, s) = 0$ sonst, also
    $
      f_((R,S))(r, s) = (2 r)/pi dot bb(1)_((0,1) times (-pi\/2, pi\/2))(r, s).
    $
    Zur Kontrolle:
    $
      integral_0^1 integral_(-pi\/2)^(pi\/2) (2 r)/pi dif s dif r
      = integral_0^1 2 r dif r = 1.
    $

  + Die Dichte von $R$ erhalten wir als Randdichte durch Integration über $s$:
    Für $r in (0, 1)$ gilt
    $
      f_R (r) = integral_(-pi\/2)^(pi\/2) f_((R,S))(r, s) dif s
      = integral_(-pi\/2)^(pi\/2) (2 r)/pi dif s = (2 r)/pi dot pi = 2 r,
    $
    und $f_R (r) = 0$ sonst, also
    $
      f_R (r) = 2 r dot bb(1)_((0,1))(r).
    $
