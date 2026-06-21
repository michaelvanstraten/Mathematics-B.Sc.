#import "common.typ": *

#show: problemset("7")

#exercise([Gauß-Quadratur I], [5])[
  Bestimmen Sie eine Gauß-Quadraturformel mit minimaler Knotenzahl, welche das
  folgende Integral für alle Polynome in $P_3([-1, 1])$ exakt integriert
  $
    I(f) := integral_(-1)^1 f(x) sqrt(abs(x)) dif x.
  $
]

=== Lösung

Definieren wir $w(x) := sqrt(abs(x))$ und den gewichteten Skalarproduktraum
durch

$
  (p, q)_w := integral_(-1)^1 p(x) q(x) w(x) dif x.
$

Da wir Exaktheit für alle Polynome in $P_3([-1,1])$ fordern, benötigen wir eine
Gauß-Quadraturformel der Ordnung $4 = 2 dot 1 + 2$. Also genügt die minimale
Knotenzahl $n + 1 = 2$.

Wir berechnen zunächst die orthogonalen Polynome $N_k$ beschrieben wie in
Bemerkung 3.38.

$
  N_0(x) = 1.
$

Für $N_1$ gilt

$
  N_1(x) & = x - (x, 1)_w / norm(1)_w^2 N_0(x) \
         & = x - 1 / norm(1)_w^2 integral_(-1)^1 x sqrt(abs(x)) dif x \
         & = x - 1 / norm(1)_w^2 dot 0 \
         & = x,
$

da $x sqrt(abs(x))$ ungerade ist.

Außerdem ist

$
  norm(1)_w^2 & = integral_(-1)^1 sqrt(abs(x)) dif x \
              & = 2 integral_0^1 x^(1/2) dif x \
              & = 2 [2/3 x^(3/2)]_0^1 \
              & = 4/3.
$

Nun berechnen wir $N_2$:

$
  N_2(x) & = x^2 - (x^2, 1)_w / norm(1)_w^2 dot 1
           - (x^2, x)_w / norm(x)_w^2 dot x \
         & = x^2
           - 1 / norm(1)_w^2 integral_(-1)^1 x^2 sqrt(abs(x)) dif x
           - (x^2, x)_w / norm(x)_w^2 dot x.
$

Dabei gilt

$
  integral_(-1)^1 x^2 sqrt(abs(x)) dif x & = 2 integral_0^1 x^2 sqrt(x) dif x \
                                         & = 2 integral_0^1 x^(5/2) dif x \
                                         & = 2 [2/7 x^(7/2)]_0^1 \
                                         & = 4/7.
$

Außerdem ist

$
  (x^2, x)_w
  = integral_(-1)^1 x^3 sqrt(abs(x)) dif x
  = 0,
$

da $x^3 sqrt(abs(x))$ ungerade ist. Also folgt

$
  N_2(x) & = x^2 - (4/7) / (4/3) \
         & = x^2 - 3/7.
$

Die Gauß-Knoten sind die Nullstellen von $N_2$:

$
  N_2(x) = 0
  quad <==>
  x^2 - 3/7 = 0.
$

Also

$
  x_0 = -sqrt(3/7),
  quad
  x_1 = sqrt(3/7).
$

Was noch fehlt ist die Gewichte $alpha_0, alpha_1$ unsere neuen Quadraturformel
$Q$ zu berechnen.

Da unsere Quadraturformel exakt auf $P_3$ sein soll reicht es aus folgendes
Gleichungssystem zu lösen:

$
    integral_(-1)^1 sqrt(abs(x)) dif x & = 4/3 = Q(1) = alpha_0 + alpha_1 \
  integral_(-1)^1 x sqrt(abs(x)) dif x & = 0 = Q(x) = 3/7 (alpha_0 - alpha_1).
$

Unsere Quadraturformel ergibt sich somit als
$
  Q(f) = 2/3 f(-sqrt(3/7)) + 2/3 f(sqrt(3/7))
$

#pagebreak()

#exercise([Gauß-Quadratur II], [5])[
  Für $f : [-1, 1] -> RR$ soll das gewichtete Integral
  $
    I(f) := integral_(-1)^1 x^2 f(x) dif x
  $
  mit Hilfe einer Quadraturformel $Q(f) := alpha f(hat(x)) + beta f(-hat(x))$
  mit $hat(x) in (0, 1]$ und Gewichten $alpha, beta in RR$ approximiert werden.

  + Bestimmen Sie sowohl $hat(x)$ als auch $alpha, beta$ derart, dass $Q$ exakt
    ist für alle Polynome vom Grad höchstens 2.

  + Bestimmen Sie das maximale $k in NN$ derart, dass $Q$ mit den Parametern aus
    (a) noch exakt ist für alle Polynome vom Grad höchstens $k$.

  + Kann der Wert $k$ aus (b) erhöht werden, indem man eine andere
    Quadraturformel $tilde(Q)(f) := gamma f(tilde(x)_1) + delta f(tilde(x)_2)$
    mit neuen Knoten $tilde(x)_1, tilde(x)_2 in [-1, 1]$ und Gewichten
    $gamma, delta in RR$ verwendet?
]

=== Lösung

Quadratur formel der Form
$
  Q(f) := sum_(i=1)^n a_i f(x_i)
$
sind linear sofern die $a_i$ und $x_i$ nicht von $f$ abhängig sind. Um zu zeigen
das $Q$ exakt auf $P_n$ ist genügt es somit zu zeigen das $Q$ exakt auf der
Menge der Basiselemente ist.

+ Fordern wie das $Q$ die Basiselemente ${1, x, x^2}$ exakt interpoliert
  erhalten wir folgendes Gleichungssystem:
  $
    I(1) &= [1/3 x^3]_(-1)^1 = 2/3 = Q(1) = alpha + beta \
    I(x) = [1/4 x^4]_(-1)^1 = 0 = Q(x) = hat(x)(a - b)
    I(x^2) = [1/5 x^5]_(-1)^1 = 2/5 = Q(x^2) = hat(x)^2(a + b)
  $
  welche
  $
    alpha = beta = 1/3 "und" hat(x) = sqrt(3/5)
  $
  exakt lösen.

+ Bemerken wir das
  $
    I(x^3) = [1/6 x^6]_(-1)^1 = 0 = Q(x^3) = 1/3 hat(x)^3 - 1/3 hat(x)^3
  $
  aber
  $
    I(x^4) = [1/7 x^7]_(-1)^1 = 2/7 != Q(x^4) = 6/25.
  $

  Also interpoliert $Q$ alle Polynome vom Grad $<= 3$ exakt.

+ Nein, der wert $k$ auf (b) kann nicht erhöht werden. Dafür betrachtet man
  folgendes Polynom gewählt wie in Satz 3.28,
  $
    p(x) = (x - tilde(x)_1)^2 (x - tilde(x)_2)^2.
  $
  Dieses Polynom ist in den Stützstellen $tilde(x)_{1,2}$ null, dessen Integral
  ist aber nicht gleich null.

#pagebreak()

#exercise([Uneigentliche Integrale], [5])[
  In dieser Aufgabe wird die numerische Integration des folgenden uneigentlichen
  Integrals untersucht
  $
    I(f) := integral_0^infinity bold(e)^(-x) f(x) dif x.
  $

  + Bestimmen Sie die Gauß-Quadraturformel mit zwei Stützstellen zur
    Approximation des uneigentlichen Integrals $I(f)$.

  + Vergleichen Sie die Approximation von $I(f)$ durch die Gaußsche
    Quadraturformel aus (a) mit der Approximation von $I(f)$ durch die
    Simpson-Regel bzw. die Gauß-Legendre Quadratur mit drei Stützstellen für
    $integral_0^(10) g(x) dif x$ mit $g(x) = bold(e)^(-x) f(x)$ exemplarisch für
    die Funktionen $f(x) = 1$ und $f(x) = x^4$. Diskutieren Sie die Ergebnisse.

    _Hinweis._ Die Gauß-Legendre Quadratur und Simpsonregel dürfen numerisch und
    ohne Angabe des Rechenweges ausgewertet werden.
]

=== Lösung

+ Definieren wir $w(x) := e^(-x)$ und den gewichteten Skalarproduktraum durch
  $
    (p, q)_w := integral_0^infinity p(x) q(x) w(x) dif x.
  $

  Wir berechnen zunächst die orthogonalen Polynome $N_k$ beschrieben wie in
  Bemerkung 3.38.

  #pdf.attach(
    "problemset-07.py",
    relationship: "supplement",
    mime-type: "text/python",
    description: "Raw Oxygen readings from the Arctic experiment",
  )
