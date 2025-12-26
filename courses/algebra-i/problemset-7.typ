#import "common.typ": *

#show: problemset("7")

#aufgabe[
  Sei $G$ eine Gruppe und $R$ ein kommutativer Ring. Wir betrachten die direkte
  Summe $R[G] := plus.circle.big_(g in G) g R$. Das heißt Elemente von $R[G]$
  sind von der Form $sum_(g in G) a_g g$ mit $a_g in R$ und nur endlich vielen
  $a_g eq.not 0$. Wir definieren auf $R[G]$ das Produkt
  $
    (sum_(g in G) a_g g) dot.c (sum_(g in G) a'_g g) := sum_(g in G) (sum_(h in G) a_h dot.c a'_(h^(-1) g)) g.
  $

  Diese Formel ist auch für unendliche Gruppen $G$ wohldefiniert, da nur endlich
  viele $a_h eq.not 0$ sind. Zeigen Sie:

  + $R[G]$ bildet mit dieser Definition einen Ring, den sogenannten
    _Gruppenring_ von $G$ über $R$.

  + $R[G]$ ist ein kommutativer Ring, falls $G$ abelsch ist.

  + $R[G]$ ist für nicht-triviale endliche Gruppen $G$ kein Integritätsbereich.
]

#pagebreak()

#aufgabe[
  Welche der folgenden Ideale sind Hauptideale, welche der Ideale sind prim und
  welche sind maximal? Geben Sie für die Hauptideale jeweils auch einen Erzeuger
  an:

  $
    I_1 & = (117, 195, 273) subset.eq R_1 = ZZ, \
    I_2 & = (x^2 - 2x + 1, 2x - 2) subset.eq R_2 = ZZ[x], \
    I_3 & = (x^2 - 2x + 1, 2x - 2) subset.eq R_3 = QQ[x], \
    I_4 & = (x z - y^2, y t - z^2) subset.eq R_4 = QQ[x, y, z, t].
  $
]

=== Lösung:

Laut Definition ist $I$ ein Hauptideal, wenn es von einem Element aus dem Ring
erzeugt wird.

==== 1. $(I_1 subset.eq ZZ)$

Für $I_1$ folgt, dass der $gcd$ von $117, 195, 273$ gleich $39$ ist. Also
$I_1 = (39)$.

Das $I$ prim ist, ist äquivalent dazu, dass $R slash I$ ein Integritätsbereich
ist. Da $39$ nicht prim ist, gilt, dass $ZZ slash 39 ZZ$ kein Integritätsbereich
sein kann, da $[3], [13] eq.not [0]$ aber $[3 dot 13] = [39] = [0]$ ist.

Da Maximalität Primheit impliziert, kann $I_1$ somit auch nicht maximal sein.

#align(center)[
  *$I_1$ ist weder prim noch maximal.*
]

==== 2. $(I_2 subset.eq ZZ[x])$

Beachte, dass $x^2 - 2x + 1 = (x-1)^2$ und $2x - 2 = 2(x-1)$, also
$
  I_2 = ((x-1)^2, 2(x-1)).
$

Im Quotientenring $R_2 slash I_2$ erfüllen die Klassen von $2$ und $x-1$:
$
  [2] eq.not 0, quad [x-1] eq.not 0, quad [2] dot.c [x-1] = [2(x-1)] = 0.
$

(Zum Beispiel ist $2 in.not I_2$, denn die Auswertung einer Darstellung
$2 = f(x)(x-1)^2 + g(x) dot.c 2(x-1)$ bei $x=1$ ergibt $2=0$, was unmöglich ist.
Ähnlich ist modulo $2$ das Bild von $I_2$ gleich $((x-1)^2) subset.eq FF_2[x]$,
also $x-1 in.not I_2$.)

Somit hat $R_2 slash I_2$ von null verschiedene Nullteiler, ist also kein
Integritätsbereich und kein Körper. Daher ist

#align(center)[
  *$I_2$ weder prim noch maximal.*
]

==== 3. $(I_3 subset.eq QQ[x])$

Wieder gilt $x^2 - 2x + 1 = (x-1)^2$ und $2x - 2 = 2(x-1)$. Im Hauptidealring
$QQ[x]$ wird das von zwei Elementen erzeugte Ideal von ihrem $gcd$ erzeugt; hier
ist
$
  gcd((x-1)^2, 2(x-1)) = x-1,
$
also $I_3 = (x-1)$.

Dann gilt
$
  QQ[x] slash I_3 tilde.equiv QQ[x] slash (x-1) tilde.equiv QQ
$
via Auswertung bei $x=1$. Somit ist der Quotient ein Körper, also ist $I_3$
maximal. Jedes maximale Ideal in einem kommutativen Ring ist prim, also ist

#align(center)[
  *$I_3$ sowohl prim als auch maximal.*
]

==== 4. $(I_4 subset.eq QQ[x,y,z,t])$

Zunächst zeigen wir, dass $I_4$ kein Hauptideal ist.

Erinnern wir uns:
$
  I_4 = (x z - y^2, y t - z^2) subset.eq QQ[x,y,z,t].
$

Angenommen, $I_4$ wäre ein Hauptideal, also $I_4 = (h)$ für ein
$h in QQ[x,y,z,t]$. Dann liegen beide Erzeuger in $(h)$, also existieren
$a,b in QQ[x,y,z,t]$ mit
$
  x z - y^2 = h a, quad y t - z^2 = h b.
$
Somit ist $h$ ein gemeinsamer Teiler der beiden Polynome.

Nun arbeiten wir im faktoriellen Ring $QQ[x,y,z,t]$:

- $x z - y^2$ ist irreduzibel: Betrachte es als Polynom in $x$ über dem
  faktoriellen Ring $QQ[y,z,t]$; es ist linear in $x$ mit Koeffizienten, deren
  $gcd$ gleich $1$ ist, also kann es nicht nichttrivial faktorisieren.

- $y t - z^2$ ist ähnlich irreduzibel (linear in $t$ über $QQ[x,y,z]$).

Falls ein nichtkonstantes Polynom $h$ beide teilt, dann teilt ein irreduzibler
Faktor $p$ von $h$ beide. Aber jeder irreduzible Teiler von $x z - y^2$ muss
assoziiert zu $x z - y^2$ selbst sein, und jeder irreduzible Teiler von
$y t - z^2$ muss assoziiert zu $y t - z^2$ sein. Somit hätten wir
$
  x z - y^2 tilde y t - z^2,
$
d.h. sie unterscheiden sich nur durch einen von null verschiedenen Skalar aus
$QQ$. Dies ist unmöglich, da die Monome (beteiligten Variablen) auf beiden
Seiten verschieden sind.

Daher sind die einzigen gemeinsamen Teiler von $x z - y^2$ und $y t - z^2$
Einheiten in $QQ[x,y,z,t]$. Wenn also $I_4 = (h)$, dann muss $h$ eine Einheit
sein und somit $(h) = QQ[x,y,z,t]$.

Aber $I_4$ ist ein echtes Ideal: Zum Beispiel bei $(x,y,z,t) = (1,0,0,0)$ haben
wir
$
  x z - y^2 = 0, quad y t - z^2 = 0,
$
also verschwindet jede Kombination $f(x z - y^2) + g(y t - z^2)$ dort, während
das konstante Polynom $1$ das nicht tut. Somit ist $1 in.not I_4$.

Widerspruch. Somit kann $I_4$ kein Hauptideal sein; es ist **kein** Hauptideal.

Nun zeigen wir, dass $I_4$ nicht prim ist:

Betrachte in $R_4$ die Elemente $y$ und $x t - y z$. Wir haben
$
  y(x t - y z) = z(x z - y^2) + x(y t - z^2) in I_4,
$
also liegt das Produkt von $y$ und $x t - y z$ in $I_4$.

Jedoch gilt:

- $y in.not I_4$: Falls $y in I_4$, hätten wir $y = A(x z - y^2) + B(y t - z^2)$
  für Polynome $A,B$. Auswertung bei $(x,y,z,t) = (1,2,4,8)$ ergibt
  $x z - y^2 = 0$ und $y t - z^2 = 0$, also ist die rechte Seite $0$, aber die
  linke Seite ist $2$ – ein Widerspruch.

- $x t - y z in.not I_4$: Ähnlich, falls $x t - y z in I_4$, würde Auswertung
  bei $(x,y,z,t) = (1,0,0,2)$ (was $x z - y^2 = 0$ und $y t - z^2 = 0$ erfüllt)
  auf der rechten Seite $0$ und auf der linken Seite $2$ ergeben.

Somit sind $y, x t - y z in.not I_4$, aber ihr Produkt liegt in $I_4$, also hat
der Quotientenring $R_4 slash I_4$ von null verschiedene Nullteiler und ist kein
Integritätsbereich.

#pagebreak()

#aufgabe[
  Sei $[0, 1]$ das abgeschlossene Intervall von $0$ bis $1$ in den reellen
  Zahlen. Wir betrachten den Ring der stetigen Funktionen
  $R = {f : [0, 1] -> RR | f "ist stetig"}$ mit $(f + g)(x) := f(x) + g(x)$ und
  $(f dot.c g)(x) := f(x) dot.c g(x)$. Zeigen Sie:

  + Sei $x in [0, 1]$. Dann ist $m_x := {f in R | f(x) = 0}$ ein maximales Ideal
    in $R$.

  + Alle maximalen Ideale in $R$ sind von der Form $m_x$ für ein $x in [0, 1]$.

    _Tipp:_ Benutzen Sie, dass $[0, 1]$ ein kompaktes Intervall ist.

  + Es gibt ein maximales Ideal in $R' := {f : RR -> RR | f "stetig"}$, welches
    nicht von der Form $m_x = {f in R' | f(x) = 0}$ für $x in RR$ ist.

    _Tipp:_ Finden Sie ein Ideal $I subset.not.eq R'$ welches in keinem der
    $m_x$ enthalten ist, und nutzen Sie, dass jedes echte Ideal in einem
    maximalen Ideal enthalten ist.
]
