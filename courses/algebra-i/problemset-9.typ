#import "common.typ": *

#show: problemset("9")

#aufgabe[
  Zeigen Sie, dass folgende Polynome irreduzibel sind:

  + $x^4 + 3x^3 + x^2 - 2x + 1 in QQ[x]$.

  + $2x^4 + 200x^3 + 2000x^2 + 20000x + 20 in QQ[x]$.

  + $x^2 y + x y^2 - x - y + 1 in QQ[x, y]$.
]

=== Lösung:

+ Angenommen $a in QQ$ ist eine nullstelle von $f(x) := x^4 + 3x^3 + x^2 - 2x +
  1$. Dann muss laut Aufgabe 3 (a) $(x - a)$ ein linear faktor von $f$ sein. Das
  lemma von Gauss sagt uns das es ein $alpha in ZZ$ gibt sodass
  $
    f(x) = (x - alpha)(x^3 + a_2 x^2 + a_1 x + 1 / alpha in ZZ[x]).
  $
  Somit folgt das $alpha = plus.minus 1$. $plus.minus 1$ ist aber keine
  nullstelle von $f$. Also kann $f$ nur in zwei Faktor vom Grad zwei zerfallen.

  Also gilt wiederum mit Gausses Lemma das
  $
    f(x) & = (x^2 + a x + b)(x^2 + c x + d) \
         & = x^4 + (a + c)x^3 + (a c + b + d)x^2 + (a d + b c)x + b d
  $
  mit $a,b,c,d in ZZ$.

  Also folgt
  $
          a + c & = 3 \
    a c + b + d & = 1 \
      a d + b c & = 2 \
            b d & = 1.
  $
  Aus der letzten Gleichung folgt $b = d = plus.minus 1$. Wenn wir dies auf $a d
  + b c = -2$ anwenden, folgt $a + c = plus.minus 2$ #sym.arrow.zigzag, da
  $a + c = 3$.

  Somit kann $f$ nicht reduzibel sein.

  #sym.suit.diamond.stroked

+ Aus der Übung der Woche $9$ folgt das für $g(x) = a x + b$ mit $a, b in QQ$
  und $a eq.not 0$ gilt das $f(x) in QQ[x]$ genau dann irreduzibel ist wenn
  $f(g(x))$ irreduzibel ist.

  Definieren wir $g(x) = 1/2 x$ so folgt das
  $
    f(g(x)) = x^4 + 25x^3 + 500x^2 + 10000x + 20
  $
  irreduzibel nach dem Eisensteinkriterium, für $p = 5$, ist. Da $p divides.not
  1$ und $5^2 divides.not 20$ aber $5 divides 25, 500, 10000 "und" 20$.

  #sym.suit.diamond.stroked

+ Sei $f(x,y) := x^2 y + x y^2 - x - y + 1 in QQ[x,y]$ mit Grad $3$. Da der Grad
  additiv unter Multiplikation ist, muss $f$ bei einer nicht-trivialen
  Faktorisierung einen Faktor vom Grad $1$ besitzen. Also genügt es zu zeigen
  das $f$ keinen linearen Faktor über $QQ$ hat.

  Nach dem Lemma von Gauss ist $f$ genau dann reduzibel über $QQ$ wenn $f$
  reduzibel über $ZZ$ ist. Ein linearer Faktor hätte die Form
  $L(x,y) = a x + b y + c$ mit $a,b,c in ZZ$ und $gcd(a, b, c) = 1$.

  *Fall 1:* $b eq.not 0$. Dann entspricht $L = 0$ der Geraden $y = m x + n$ mit
  $m = -a/b$ und $n = -c/b in QQ$. Falls $L divides f$, dann gilt
  $f(x, m x + n) equiv 0$ in $QQ[x]$. Es folgt:
  $
    f(x, m x + n) = (m^2 + m)x^3 + n(2m + 1)x^2 + (n^2 - m - 1)x + (1 - n).
  $
  Für das Nullpolynom müssen alle Koeffizienten verschwinden:
  $
    m^2 + m = 0, quad n(2m + 1) = 0, quad n^2 - m - 1 = 0, quad 1 - n = 0.
  $
  Aus $1 - n = 0$ folgt $n = 1$, somit $2m + 1 = 0$ also $m = -1/2$. Aber
  $m^2 + m = 0$ erfordert $m in {0, -1}$ #sym.arrow.zigzag.

  *Fall 2:* $b = 0$ und $a eq.not 0$. Dann ist $L = a x + c$, also
  $x = x_0 := -c/a$. Falls $L divides f$, dann $f(x_0, y) equiv 0$ in $QQ[y]$.
  Aber
  $
    f(x_0, y) = x_0 y^2 + x_0^2 y - y + (1 - x_0).
  $
  Der Koeffizient von $y^2$ ist $x_0$, somit $x_0 = 0$. Dann ist der Koeffizient
  von $y$ gleich $-1$ #sym.arrow.zigzag.

  *Fall 3:* $a = 0$ und $b eq.not 0$. Dann ist $L = b y + c$, also
  $y = y_0 := -c/b$. Es folgt
  $
    f(x, y_0) = y_0 x^2 + (y_0^2 - 1)x + (1 - y_0).
  $
  Der Koeffizient von $x^2$ erfordert $y_0 = 0$, dann ist aber der Koeffizient
  von $x$ gleich $-1$ #sym.arrow.zigzag.

  Da $f$ keinen linearen Faktor besitzt, ist $f$ irreduzibel über $QQ[x,y]$.

  #sym.suit.diamond.stroked

#pagebreak()

#aufgabe[
  + Zeigen Sie, dass für $a_0, ..., a_n in QQ$ mit $a_0, a_n != 0$ die folgenden
    Aussagen äquivalent sind:

    + Das Polynom $g(x) = a_n x^n + a_(n-1) x^(n-1) + ... + a_0$ ist irreduzibel
      in $QQ[x]$.

    + Das Polynom $g(x) = a_0 x^n + a_1 x^(n-1) + ... + a_n$ ist irreduzibel in
      $QQ[x]$.

  + Beweisen Sie, dass $h(x) = 6x^5 - 9x^3 + 12x^2 - 4$ irreduzibel in $QQ[x]$
    ist.
]

=== Lösung:

+ Sei $f(x) = a_n x^n + a_(n-1) x^(n-1) + ... + a_0$ und definiere
  $tilde(f)(x) := x^n f(1/x) = a_0 x^n + a_1 x^(n-1) + ... + a_n$.

  Bemerke das $tilde(tilde(f)) = f$ gilt. Es genügt also zu zeigen: $f$
  reduzibel $<=>$ $tilde(f)$ reduzibel.

  Sei $f = g dot h$ eine nicht-triviale Faktorisierung mit $deg(g) = k$ und
  $deg(h) = n - k$. Dann gilt
  $
    tilde(f)(x) = x^n f(1/x) = x^k g(1/x) dot x^(n-k) h(1/x) = tilde(g)(x) dot tilde(h)(x).
  $
  Da $a_0, a_n eq.not 0$ folgt das $g$ und $h$ ebenfalls nicht-verschwindende
  konstante Terme haben, also $deg(tilde(g)) = k$ und $deg(tilde(h)) = n - k$.
  Somit ist $tilde(f) = tilde(g) dot tilde(h)$ ebenfalls eine nicht-triviale
  Faktorisierung.

  #sym.suit.diamond.stroked

+ Wiederum folgt mit dem Eisensteinkriterium das
  $
    -4 x^5 + 12x^3 - 9x^2 + 6
  $
  mit $p = 3$ irreduzibel ist, da $3 divides.not -4$ und $3^2 divides.not 6$
  aber $3 divides 12, -9 "und" 6$, und somit $h(x)$ nach (a) ebenfalls
  irreduzibel sein muss.

#pagebreak()

#aufgabe[
  Sei $K$ ein Körper und $f in K[x]$ mit $f != 0$. Beweisen Sie:

  + Sei $a in K$. Wenn $f(a) = 0$ gilt, dann ist $(x - a)$ ein Teiler von $f$ in
    $K[x]$.

  + Sei $n := op("deg")(f)$. Dann hat $f$ höchstens $n$ Nullstellen in $K$.

  + Sei $op("deg")(f) gt.eq 2$ und $f$ irreduzibel. Dann besitzt $f$ keine
    Nullstelle in $K$.

  + Sei $2 lt.eq op("deg")(f) lt.eq 3$. Falls $f$ keine Nullstelle in $K$
    besitzt, dann ist $f$ irreduzibel.
]

=== Lösung:

+ Da $K$ ein Körper ist, ist $K[x]$ euklidisch. Somit existieren $q(x), r(x) in
  K[x]$ sodass $f(x) = q(x) dot (x - a) + r(x)$ mit $deg(r) < deg((x - a)) = 1$,
  also $r in K$.

  Somit folgt da $a$ eine Nullstelle von $f$ ist das
  $
    0 = f(a) = q(a) dot (a - a) + r = r.
  $

  Also ist $(x - a)$ ein Faktor von $f$ mit $f(x) = q(x) dot (x - a)$.

  #sym.suit.diamond.stroked

+ *Beweis via Induktion über $deg(f)$*

  Sei $n = deg(f)$.

  Für den Basisfall, $n = 0$, gilt $f(x) = a_0 in K without {0} eq.not
  0$ #sym.checkmark.

  Sei die Aussage nun bereits für ein $n in NN$ bewiesen und sei $deg(f) = n +
  1$. Sei $a in K$ nun eine Nullstelle von $f$. Aus der (a) wissen wir, dass
  $(x - a)$ ein Faktor von $f$ ist, also ein $q(x) in K[x]$ existiert mit
  $deg(q) = n$ und $f(x) = q(x) dot (x - a)$. Laut Induktionsvoraussetzung kann
  $q$ höchstens $n$ Nullstellen haben, somit kann $f$ höchstens $n + 1$
  Nullstellen haben.

  #sym.suit.diamond.stroked

+ Angenommen $f$ hätte eine Nullstelle an $a in K$, so folgte mit der (a), dass
  $(x - a)$ ein Teiler von $f$ ist. Somit existiert ein $g in K[x]$ sodass
  $
    f(x) = (x - a) dot g.
  $
  Da $f$ Grad größer gleich zwei hat muss $g$ Grad größer gleich eins haben und
  kann somit keine Einheit sein. Also folgt das $f$ reduzibel ist.

  Mit Kontraposition folgt nun die Aussage.

  #sym.suit.diamond.stroked

+ Bemerken wir zunächst, dass $f$ keine Teiler vom Grad eins haben kann, also
  der Form $a x + b$, da sonst $f$ eine Nullstelle in $- a^(-1) b$ hätte. Somit
  kann $f$ nur Faktoren mit Grad in ${0, 2, 3}$ haben. Somit muss mit der
  Additivität des Gradmaßes folgen, dass $f$ irreduzibel ist, da Faktoren mit
  Grad null, ausgenommen der Null selbst, Einheiten in $K[x]$ sind.

  #sym.suit.diamond.stroked
