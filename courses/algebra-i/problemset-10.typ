#import "common.typ": *

#show: problemset("10")

#aufgabe[
  Sei $L slash K$ eine Körpererweiterung vom Grad $[L : K] = 2$.

  + Sei $op("char")(K) != 2$. Zeigen Sie, dass es ein Element $a in K$ gibt mit
    $L = K(sqrt(a))$.

  + Geben Sie ein Beispiel dafür, dass dies im Fall $op("char")(K) = 2$ nicht
    gelten muss.

    _Tipp:_ Konstruieren Sie eine Körpererweiterung von $FF_2$.
]

=== Lösung:

+ Wählen wir $tilde(alpha) in L without K$. Da der Körpererweiterungsgrad von
  $L$ zwei ist muss es $a, b, c in K$ geben sodass
  $
    a tilde(alpha)^2 + b tilde(alpha) + c = 0
  $
  mit $a$, $b$ oder $c$ nicht alle null, andernfalls wären $tilde(alpha)^2,
  tilde(alpha), 1$ eine basis von $L$ als $K$ Vektorraum.

  Betrachten wir nun den fall $a = 0$, so folgt $tilde(alpha) = - b^(-1)c in K$
  #sym.arrow.zigzag, bemerke das $b eq.not 0$ da $c$ sonst null wäre.

  Da $a$ also nicht gleich null ist folgt
  $
    tilde(alpha)^2 + a^(-1) b tilde(alpha) = - a^(-1) c.
  $
  Da $op("char")(K) != 2$ folgt das $2^2 != 0$ also folgt
  $
    tilde(alpha)^2 + a^(-1) b tilde(alpha) + (a^(-1) b)^2 / 4 = (a^(-1) b)^2 / 4 - a^(-1) c.
  $
  also
  $
    (tilde(alpha) + 1/2 a^(-1) b)^2 = (a^(-1) b)^2 / 4 - a^(-1) c in K.
  $

  Setzen wir $alpha = tilde(alpha) + 1/2 a^(-1) b$ so folgt das $alpha^2 in K$
  und $alpha$ algebraisch ist mit Minimalpolynom vom Grad zwei.

  Also folgt $[K(a) : K] = 2$ und somit $K(a) = L$.

  #sym.suit.diamond.stroked

+ Setze $K = FF_2$ und
  $
    L = FF_2[x] slash (x^2 + x + 1).
  $
  Da $x^2 + x + 1$ in $FF_2$ keine Nullstelle besitzt (denn $0^2+0+1 = 1 != 0$
  und $1^2+1+1 = 1 != 0$), ist es irreduzibel. Also gilt $[L : K] = 2$.

  Für $a in FF_2$ ist jedoch stets $sqrt(a) in FF_2$, denn $FF_2 = {0, 1}$ und
  $0 = 0^2$, $1 = 1^2$. Daher gilt für alle $a in FF_2$
  $
    FF_2(sqrt(a)) = FF_2 != L.
  $
  Somit muss im Fall $op("char")(K) = 2$ nicht gelten, dass $L = K(sqrt(a))$.

  #sym.suit.diamond.stroked

#pagebreak()

#aufgabe[
  + Sei $L slash K$ eine Körpererweiterung, $a, b in L$. Zeigen Sie, dass $a$
    und $b$ genau dann algebraisch über $K$ sind, wenn $a + b$ und $a dot.c b$
    algebraisch über $K$ sind.

  + Geben Sie je ein Beispiel für eine Körpererweiterung $L slash K$ und
    $a, b in L$ an, sodass $a + b$ beziehungsweise $a dot.c b$ algebraisch über
    $K$ sind, aber $a$ und $b$ nicht algebraisch über $K$ sind.
]

=== Lösung:

+ Wir zeigen beide Richtungen.

  $#sym.arrow.double$

  Seien $a$ und $b$ algebraisch über $K$. Dann sind die Erweiterungen $K(a)$ und
  $K(b)$ endlich. Somit ist auch
  $
    K(a, b) = K(a)(b)
  $
  eine endliche Körpererweiterung von $K$, also ist jedes Element aus $K(a, b)$
  algebraisch über $K$.

  Da $a + b in K(a, b)$ und $a dot.c b in K(a, b)$ gilt, folgt sofort, dass
  $a + b$ und $a dot.c b$ algebraisch über $K$ sind.

  $#sym.arrow.l.double$
  Sei nun $s := a + b$ und $p := a dot.c b$ und es gelte, dass $s$ und $p$
  algebraisch über $K$ sind. Setze
  $
    E := K(s, p) subset.eq L.
  $
  Dann ist $E$ eine algebraische Erweiterung von $K$.

  Wir betrachten nun das Polynom
  $
    f(T) := x^2 - s x + p in E[x].
  $
  Einsetzen von $x = a$ liefert
  $
    f(a) = a^2 - (a + b)a + a b = a^2 - a^2 - a b + a b = 0,
  $
  also ist $a$ Nullstelle eines Polynoms aus $E[x]$ und damit algebraisch über
  $E$.

  Da $E$ algebraisch über $K$ ist, folgt aus der Transitivität der
  Algebraizität, dass $a$ algebraisch über $K$ ist.

  Analog erhält man durch Einsetzen von $x = b$:
  $
    f(b) = b^2 - (a + b)b + a b = b^2 - a b - b^2 + a b = 0,
  $
  also ist auch $b$ algebraisch über $E$ und damit algebraisch über $K$.

  #sym.suit.diamond.stroked

+ Setze $K := QQ$ und $L := QQ(t)$, wobei $t$ transzendent über $QQ$ sei.

  *Beispiel für $a + b$ algebraisch, aber $a, b$ nicht algebraisch:*

  Wähle $a := t$ und $b := -t$. Dann folgt
  $
    a + b = t + (-t) = 0 in QQ,
  $
  also ist $a + b$ algebraisch über $K$. Jedoch sind $a = t$ und $b = -t$
  transzendent über $QQ$, also nicht algebraisch über $K$.

  *Beispiel für $a dot.c b$ algebraisch, aber $a, b$ nicht algebraisch:*

  Wähle $a := t$ und $b := 1/t$. Dann folgt
  $
    a dot.c b = t dot.c (1/t) = 1 in QQ,
  $
  also ist $a dot.c b$ algebraisch über $K$. Dennoch sind $a = t$ und $b = 1/t$
  transzendent über $QQ$, also nicht algebraisch über $K$.

  #sym.suit.diamond.stroked

#pagebreak()

#aufgabe[
  Sei $K = QQ(sqrt(2), sqrt(5))$ und $a = sqrt(2) + sqrt(5)$.

  + Bestimmen Sie den Körpererweiterungsgrad $[K : QQ]$.

  + Schreiben Sie $a^(-1)$ als eine $QQ$-Linearkombination von $sqrt(2)$ und
    $sqrt(5)$.

  + Folgern Sie $K = QQ(a)$ und bestimmen Sie das Minimalpolynom von $a$ über
    $QQ$.
]

=== Lösung:

+ Wir betrachten wir die Erweiterungen
  $QQ subset.eq QQ(sqrt(2)) subset.eq QQ(sqrt(2), sqrt(5)) = K$.

  Zunächst gilt $[QQ(sqrt(2)) : QQ] = 2$, da $sqrt(2)$ Nullstelle des Polynoms
  $x^2 - 2 in QQ[x]$ ist, welches nach Eisenstein (mit $p = 2$) irreduzibel ist.

  Angenommen $sqrt(5) = a + b sqrt(2)$ für $a, b in QQ$. Dann folgt
  $
    5 = a^2 + 2 b^2 + 2 a b sqrt(2).
  $
  Da $sqrt(2) in.not QQ$ muss $2 a b = 0$ gelten, also $a = 0$ oder $b = 0$.

  - Fall $b = 0$: Dann $5 = a^2$, also $a = plus.minus sqrt(5) in.not QQ$.
    #sym.arrow.zigzag

  - Fall $a = 0$: Dann $5 = 2 b^2$, also $b^2 = 5/2$, und
    $b = plus.minus sqrt(5/2) in.not QQ$. #sym.arrow.zigzag

  Also ist $sqrt(5) in.not QQ(sqrt(2))$, und somit
  $[QQ(sqrt(2), sqrt(5)) : QQ(sqrt(2))] = 2$.

  Mit der Gradformel folgt
  $
    [K : QQ] = [K : QQ(sqrt(2))] dot.c [QQ(sqrt(2)) : QQ] = 2 dot.c 2 = 4.
  $

  #sym.suit.diamond.stroked

+ Wir berechnen $a^(-1)$ durch Rationalisieren des Nenners:
  $
    a^(-1) = 1 / (sqrt(2) + sqrt(5))
    = (sqrt(2) - sqrt(5)) / ((sqrt(2) + sqrt(5))(sqrt(2) - sqrt(5)))
    = (sqrt(2) - sqrt(5)) / (2 - 5)
    = (sqrt(2) - sqrt(5)) / (-3).
  $
  Also
  $
    a^(-1) = -1/3 sqrt(2) + 1/3 sqrt(5).
  $

  #sym.suit.diamond.stroked

+ Wir zeigen zunächst $K = QQ(a)$.

  Da $a = sqrt(2) + sqrt(5) in K$ gilt offensichtlich $QQ(a) subset.eq K$.

  Für die andere Inklusion berechnen wir:
  $
    a^2 = (sqrt(2) + sqrt(5))^2 = 2 + 2 sqrt(10) + 5 = 7 + 2 sqrt(10).
  $
  Also ist $sqrt(10) = (a^2 - 7) / 2 in QQ(a)$.

  Weiter gilt
  $
    a dot.c sqrt(10) = (sqrt(2) + sqrt(5)) sqrt(10) = sqrt(20) + sqrt(50) = 2 sqrt(5) + 5 sqrt(2).
  $
  Wir haben nun das lineare Gleichungssystem
  $
             a & = sqrt(2) + sqrt(5) \
    a sqrt(10) & = 5 sqrt(2) + 2 sqrt(5).
  $
  Aus der ersten Gleichung folgt $5 a = 5 sqrt(2) + 5 sqrt(5)$, und Subtraktion
  liefert
  $
    5 a - a sqrt(10) = 3 sqrt(5),
  $
  also $sqrt(5) = (5 a - a sqrt(10)) / 3 = a(5 - sqrt(10)) / 3 in QQ(a)$.

  Damit ist auch $sqrt(2) = a - sqrt(5) in QQ(a)$.

  Also $K subset.eq QQ(a)$, und somit $K = QQ(a)$.

  Für das Minimalpolynom verwenden wir $a = sqrt(2) + sqrt(5)$:
  $
    a^2 = 7 + 2 sqrt(10) quad ==> quad a^2 - 7 = 2 sqrt(10) quad ==> quad (a^2 - 7)^2 = 40.
  $
  Also
  $
    a^4 - 14 a^2 + 49 = 40 quad ==> quad a^4 - 14 a^2 + 9 = 0.
  $
  Das Polynom $f(x) = x^4 - 14 x^2 + 9 in QQ[x]$ hat $a$ als Nullstelle.

  Da $[K : QQ] = [QQ(a) : QQ] = 4$, hat das Minimalpolynom von $a$ Grad $4$.
  Also ist $f(x) = x^4 - 14 x^2 + 9$ das Minimalpolynom von $a$ über $QQ$.

  #sym.suit.diamond.stroked
