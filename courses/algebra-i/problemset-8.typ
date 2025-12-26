#import "common.typ": *

#show: problemset("8")

#aufgabe[
  Sei $R$ ein kommutativer Ring. Zeigen Sie:

  + $A := {f(z) = sum_(k gt.eq 0) a_k z^k in R[z] | a_1 = 0} subset.eq R[z]$ ist
    ein Teilring.

  + Die Abbildung $R[x, y] -> A$, $f(x, y) |-> f(z^2, z^3)$ induziert einen
    Isomorphismus von Ringen
    $
      phi : R[x, y] slash (y^2 - x^3) overset(tilde.equiv, ->) A.
    $

  + Sei $R$ ein Körper. Die Äquivalenzklassen von $x$ und $y$ in
    $R[x, y] slash (y^2 - x^3)$ sind irreduzibel in $R[x, y] slash (y^2 - x^3)$
    aber nicht prim.

  + Finden Sie in $A$ ein irreduzibles Element, das nicht prim ist. Überprüfen
    Sie das direkt, ohne mit (b) und (c) zu argumentieren.
]

=== Lösung:

#pagebreak()

#aufgabe[
  Es sei $R = ZZ[sqrt(-13)]$.

  + Bestimmen Sie die Einheiten $R^times$ von $R$.

  + Zeigen Sie, dass sich $14$ in $R$ auf zwei wesentlich verschiedene Weisen
    als Produkt irreduzibler Elemente schreiben lässt. Also die Faktoren in den
    zwei Darstellungen nicht assoziiert sind.

  + Zeigen Sie, dass $1 + sqrt(-13)$ nicht prim ist.

  + Gegeben zwei Elemente $x, y in R$, nennen wir einen gemeinsamen Teiler $d$
    einen _größten gemeinsamen Teiler_, falls $d$ durch jeden anderen
    gemeinsamen Teiler teilbar ist.

    Überprüfen Sie, ob $2 + 2 sqrt(-13)$ und $14$ einen größten gemeinsamen
    Teiler in $R = ZZ[sqrt(-13)]$ haben.

  _Tipp:_ Benutzen Sie die Abbildung $delta$, die in Aufgabe 1 in der Übung in
  der 8. Woche definiert wurde.
]

=== Lösung:

+ Aus *Aufgabe 1* (c) des 8. Präsenzübungsblatts wissen wir, dass $x in R$ genau
  dann eine Einheit ist, wenn $delta(x) = 1$, also $a^2 + 13b^2 = plus.minus 1$
  für $x = a + b sqrt(-13)$.

  Für $b != 0$ gilt $b^2 gt.eq 1$, also $a^2 + 13b^2 gt.eq 13 > 1$. Somit muss
  $b = 0$ sein, und wir erhalten $a^2 = plus.minus 1$.

  Da $a in ZZ$, folgt $a^2 = 1$, also $a = plus.minus 1$.

  Damit ist $R^times = {-1, 1}$.

+ Betrachten wir die zwei Faktorisierungen $14 = 2 dot.c 7$ und
  $14 = (1 + sqrt(-13))(1 - sqrt(-13))$ von $14$.

  Wir zeigen zunächst, dass $2$ irreduzibel ist. Es gilt $delta(2) = 4$.
  Angenommen $2 = a dot.c b$ mit $a, b in.not R^times$. Dann ist
  $delta(a) dot.c delta(b) = 4$ und $delta(a), delta(b) > 1$. Also
  $delta(a) = delta(b) = 2$. Für $a = c + d sqrt(-13)$ mit $c, d in ZZ$ bedeutet
  dies $c^2 + 13d^2 = 2$. Für $d != 0$ gilt bereits $13d^2 gt.eq 13 > 2$, und
  für $d = 0$ wäre $c^2 = 2$, was keine ganzzahlige Lösung hat. Somit ist $2$
  irreduzibel.

  Analog zeigen wir, dass $7$ irreduzibel ist. Es gilt $delta(7) = 49$.
  Angenommen $7 = a dot.c b$ mit $a, b in.not R^times$. Dann ist
  $delta(a) dot.c delta(b) = 49$ und $delta(a), delta(b) > 1$. Also
  $delta(a) in {7, 49}$. Für $delta(a) = 7$ bräuchten wir $c^2 + 13d^2 = 7$. Für
  $d != 0$ gilt $13d^2 gt.eq 13 > 7$, also muss $d = 0$ sein. Dann wäre
  $c^2 = 7$, was keine ganzzahlige Lösung hat. Also ist $7$ irreduzibel.

  Für $1 plus.minus sqrt(-13)$ gilt
  $delta(1 plus.minus sqrt(-13)) = 1 + 13 = 14$. Angenommen
  $1 + sqrt(-13) = a dot.c b$ mit $a, b in.not R^times$. Dann ist
  $delta(a) dot.c delta(b) = 14$ und $delta(a), delta(b) > 1$. Also
  $delta(a) in {2, 7, 14}$. Wie oben gezeigt, gibt es keine Elemente mit Norm
  $2$ oder $7$ in $R$. Also ist $1 + sqrt(-13)$ irreduzibel. Analog ist
  $1 - sqrt(-13)$ irreduzibel.

  Die Faktoren sind nicht assoziiert: $2$ und $7$ sind in $ZZ$ verschieden und
  nicht assoziiert in $R$ (da $R^times = {plus.minus 1}$). Ebenso sind
  $1 + sqrt(-13)$ und $1 - sqrt(-13)$ nicht zu $2$ oder $7$ assoziiert, da z.B.
  $(1 + sqrt(-13))/2 in.not R$ ist.

+ Laut Teil (b) ist $1 + sqrt(-13)$ irreduzibel. Aus Teil (f) des
  Präsenzübungsblatts folgt jedoch, dass für ein primes Element $p$ die Norm
  $delta(p)$ entweder eine Primzahl oder das Quadrat einer Primzahl sein muss.

  Es gilt $delta(1 + sqrt(-13)) = 14 = 2 dot.c 7$, was weder eine Primzahl noch
  das Quadrat einer Primzahl ist. Also ist $1 + sqrt(-13)$ nicht prim.

  Alternativ: $1 + sqrt(-13)$ teilt
  $(1 + sqrt(-13))(1 - sqrt(-13)) = 14 = 2 dot.c 7$, aber $1 + sqrt(-13)$ teilt
  weder $2$ noch $7$ (sonst wäre $delta(1 + sqrt(-13))$ ein Teiler von
  $delta(2) = 4$ bzw. $delta(7) = 49$, was nicht der Fall ist).

+ Wir untersuchen, ob $2 + 2 sqrt(-13)$ und $14$ einen größten gemeinsamen
  Teiler haben.

  Zunächst gilt $2 + 2 sqrt(-13) = 2(1 + sqrt(-13))$ und
  $14 = 2 dot.c 7 = (1 + sqrt(-13))(1 - sqrt(-13))$.

  Gemeinsame Teiler von $2 + 2 sqrt(-13)$ und $14$ sind:
  $1, -1, 2, -2, 1 + sqrt(-13), -(1 + sqrt(-13))$.

  Angenommen $d$ ist ein größter gemeinsamer Teiler. Dann muss $d$ durch jeden
  anderen gemeinsamen Teiler teilbar sein. Insbesondere müssten sowohl $2$ als
  auch $1 + sqrt(-13)$ Teiler von $d$ sein.

  Wäre $d = 2(1 + sqrt(-13)) dot.c u$ für eine Einheit $u$, dann müsste
  $2(1 + sqrt(-13))$ ein Teiler von $14$ sein. Es gilt aber:
  $
    14/(2(1 + sqrt(-13))) = 7/(1 + sqrt(-13)) = (7(1 - sqrt(-13)))/((1 + sqrt(-13))(1 - sqrt(-13))) = (7(1 - sqrt(-13)))/14 = (1 - sqrt(-13))/2 in.not R.
  $

  Also existiert kein größter gemeinsamer Teiler von $2 + 2 sqrt(-13)$ und $14$
  in $R$.

#pagebreak()

#aufgabe[
  Wir betrachten $FF_2 tilde.equiv ZZ slash 2 ZZ$ den Körper mit zwei Elementen.

  + Ermitteln Sie alle irreduziblen Polynome in $FF_2 [x]$ bis zum Grad $4$.

  + Sei $f(x) := x^3 + x + 1 in FF_2 [x]$. Wieso ist $K := FF_2 [x] slash (f)$
    wieder ein Körper?

  + Geben Sie Repräsentanten für alle Elemente von $K$ an.

  + Bestimmen Sie die Repräsentanten für $[x^2 + x] dot.c [x^2 + 1]$ und für das
    multiplikative Inverse von $[x]$ in $K$.
]

=== Lösung:

+ Wir ermitteln systematisch alle irreduziblen Polynome bis zum Grad $4$.

  Die Polynome vom Grad 1 sind $x$ und $x + 1$. Beide sind irreduzibel.

  Wir prüfen alle Polynome vom Grad 2:
  - $x^2 = x dot.c x$ ist reduzibel.
  - $x^2 + 1 = (x + 1)^2$ ist reduzibel (da $2 = 0$ in $FF_2$).
  - $x^2 + x = x(x + 1)$ ist reduzibel.
  - $x^2 + x + 1$ hat keine Nullstellen in $FF_2$ (da $0^2 + 0 + 1 = 1$ und
    $1^2 + 1 + 1 = 1$), also ist es irreduzibel.

  Ein Polynom vom Grad 3 ist genau dann reduzibel, wenn es eine Nullstelle in
  $FF_2$ hat. Wir prüfen alle Polynome:
  - $x^3 + 1 = (x + 1)(x^2 + x + 1)$ ist reduzibel (da $1$ eine Nullstelle ist).
  - $x^3 + x = x(x^2 + 1)$ ist reduzibel.
  - $x^3 + x + 1$ hat keine Nullstellen ($0^3 + 0 + 1 = 1$, $1^3 + 1 + 1 = 1$),
    also irreduzibel.
  - $x^3 + x^2 = x^2(x + 1)$ ist reduzibel.
  - $x^3 + x^2 + 1$ hat keine Nullstellen ($0^3 + 0 + 1 = 1$,
    $1^3 + 1 + 1 = 1$), also irreduzibel.
  - $x^3 + x^2 + x = x(x^2 + x + 1)$ ist reduzibel.
  - $x^3 + x^2 + x + 1 = (x + 1)(x^2 + 1)$ ist reduzibel (da $1$ eine Nullstelle
    ist).

  Ein Polynom vom Grad 4 ist irreduzibel, wenn es keine Nullstellen hat und
  nicht als Produkt zweier Polynome vom Grad 2 geschrieben werden kann. Das
  einzige irreduzible Polynom vom Grad 2 ist $x^2 + x + 1$, also ist
  $(x^2 + x + 1)^2 = x^4 + x^2 + 1$ reduzibel.

  Nach systematischer Prüfung aller $16$ Polynome vom Grad $4$ (hier verkürzt
  dargestellt) sind die irreduziblen Polynome vom Grad 4: $x^4 + x + 1$,
  $x^4 + x^3 + 1$, $x^4 + x^3 + x^2 + x + 1$.

+ Da $f(x) = x^3 + x + 1$ irreduzibel ist (siehe Teil a) und $FF_2$ ein Körper
  ist, ist $(f)$ ein maximales Ideal in $FF_2[x]$. Somit ist
  $K = FF_2[x] slash (f)$ ein Körper.

+ Jedes Element in $K$ hat einen eindeutigen Repräsentanten der Form
  $a_0 + a_1 x + a_2 x^2$ mit $a_i in FF_2 = {0, 1}$. Da es für jeden
  Koeffizienten 2 Möglichkeiten gibt, hat $K$ genau $2^3 = 8$ Elemente:
  $
    0, 1, x, x + 1, x^2, x^2 + 1, x^2 + x, x^2 + x + 1
  $

+ Wir berechnen zunächst $[x^2 + x] dot.c [x^2 + 1]$:
  $
    (x^2 + x)(x^2 + 1) & = x^4 + x^2 + x^3 + x \
                       & = x^4 + x^3 + x^2 + x
  $
  Nun müssen wir $x^4 + x^3 + x^2 + x$ modulo $x^3 + x + 1$ reduzieren. Da
  $x^3 equiv -x - 1 equiv x + 1 space (mod f)$ in $FF_2$ gilt, folgt:
  $
                    x^4 & equiv x dot.c x^3 equiv x(x + 1) = x^2 + x space (mod f) \
    x^4 + x^3 + x^2 + x & equiv (x^2 + x) + (x + 1) + x^2 + x space (mod f) \
                        & equiv 2x^2 + 3x + 1 equiv 1 space (mod f)
  $
  Also ist $[x^2 + x] dot.c [x^2 + 1] = [1]$.

  Für das multiplikative Inverse von $[x]$ suchen wir ein Polynom
  $a_0 + a_1 x + a_2 x^2$ mit
  $x dot.c (a_0 + a_1 x + a_2 x^2) equiv 1 space (mod f)$. Dies ergibt
  $a_0 x + a_1 x^2 + a_2 x^3 equiv 1 space (mod f)$. Mit
  $x^3 equiv x + 1 space (mod f)$ erhalten wir:
  $
    a_0 x + a_1 x^2 + a_2(x + 1) equiv (a_0 + a_2)x + a_1 x^2 + a_2 equiv 1 space (mod f)
  $
  Koeffizientenvergleich ergibt: $a_2 = 1$, $a_0 + a_2 = 0$, $a_1 = 0$. Also
  $a_2 = 1$, $a_0 = 1$, $a_1 = 0$.

  Das multiplikative Inverse von $[x]$ ist $[x^2 + 1]$.
