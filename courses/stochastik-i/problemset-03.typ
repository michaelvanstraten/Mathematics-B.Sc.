#import "common.typ": *
#import "@preview/colorful-boxes:1.4.3": colorbox

#show: problemset("3")

#exercise([3 + 3])[
  *Zähldichten*

  a) Für welche Werte $C in RR$ bilden die folgenden Funktionen eine Zähldichte
  auf $NN$?

  + $p_1(k) = C k^(-2)$
  + $p_2(k) = C 2^k / k!$

  Es sei $PP_i$ das durch $p_i$ bestimmte Wahrscheinlichkeitsmaß auf
  $(NN, scr(P)(NN))$. Bestimmen Sie $PP_i ((1, 5])$ und $PP_i (2 NN)$ für
  $i = 1, 2$.

  b)
  + Zeigen Sie, dass die Zähldichten der Binomial- und Poissonverteilung die
    Ungleichung $p(k-1) p(k+1) <= p(k)^2$ für alle $k in NN$ erfüllen.
  + Zeigen Sie, dass die Zähldichte $p(k) = 90 \/ (pi k)^4$, $k in NN$, die
    Ungleichung $p(k-1) p(k+1) >= p(k)^2$ für $k >= 2$ erfüllt.
  + Gibt es eine Zähldichte $p$ auf $NN_0$, sodass $p(k)^2 = p(k-1) p(k+1)$ für
    alle $k >= 1$ gilt?
]

=== Lösung

#pagebreak()

#exercise([3 + 3])[
  Wir betrachten das Dreieck $A B C$ mit den Punkten $A = (0, 1)$, $B = (0, 0)$,
  $C = (1, 0)$. Es werde ein Punkt $P$ innerhalb des Dreiecks $A B C$ rein
  zufällig ausgewählt. Es seien $L\/M\/N$ die Schnittpunkte der Linien $B C$ und
  $P A$ \/ $A C$ und $P B$ \/ $A B$ und $P C$. Geben Sie einen geeigneten
  Wahrscheinlichkeitsraum zur Modellierung des Experimentes an und beantworten
  Sie die folgenden Fragen:

  + Wie groß ist die Wahrscheinlichkeit, dass der Flächeninhalt des Dreiecks
    $L M N$ größer als der Flächeninhalt des Dreiecks $B L N$ ist?

  + Wie groß ist die Wahrscheinlichkeit, dass der Flächeninhalt des Dreiecks
    $L M N$ größer als der Flächeninhalt des Dreiecks $A N M$ ist?
]

=== Lösung

#colorbox(
  title: "Hinweis",
  color: "blue",
  radius: 2pt,
  width: auto,
)[
  Eine interaktive demo dieser Aufgabe kann unter folgendem link gefunden werde:

  #set text(blue)
  #link("https://www.shadertoy.com/view/73fGR4")
]

Ein geeigneter Wahrscheinlichkeitsraum ist
$
  Omega = { (x, y) in RR^2 : x > 0, y > 0, x + y < 1 },
$
also das Innere des Dreiecks $A B C$. Als Sigma-Algebra wählen wir die Borelsche
Sigma-Algebra auf $Omega$. Da der Punkt $P$ gleichverteilt im Dreieck ausgewählt
wird, ist das Wahrscheinlichkeitsmaß gegeben durch
$
  PP(E) = frac(cal(A)(E), cal(A)(Omega)).
$
Da
$
  cal(A)(Omega) = cal(A)(A B C) = 1 / 2
$
gilt, folgt also
$
  PP(E) = 2 cal(A)(E).
$

Sei nun
$
  P = (P_1, P_2) = (x, y) in Omega.
$

Die Punkte $L, M$ und $N$ lassen sich für jeden Punkt $P in Omega$ wie folgt
berechnen.

Für die Gerade durch $B$ und $P$ gilt
$
  f(t) = a t + b.
$
Da $B = (0, 0)$ auf der Geraden liegt, gilt
$
  f(0) = 0 => b = 0.
$
Außerdem gilt
$
  f(P_1) = P_2 => a = P_2 / P_1.
$
Die Gerade $A C$ hat die Gleichung
$
  y = 1 - x.
$
Für den Schnittpunkt $M$ von $P B$ mit $A C$ gilt daher
$
  P_2 / P_1 t = 1 - t.
$
Also
$
  t = 1 / (P_2 / P_1 + 1) = P_1 / (P_1 + P_2).
$
Somit ist
$
  M = (P_1 / (P_1 + P_2), P_2 / (P_1 + P_2)).
$

Für die Gerade durch $A$ und $P$ gilt
$
  g(t) = a t + b.
$
Da $A = (0, 1)$ auf der Geraden liegt, gilt
$
  g(0) = 1 => b = 1.
$
Außerdem gilt
$
  g(P_1) = P_2,
$
also
$
  a P_1 + 1 = P_2
$
und damit
$
  a = (P_2 - 1) / P_1.
$
Für den Schnittpunkt $L$ mit $B C$ gilt $g(L_1) = 0$. Daher folgt
$
  (P_2 - 1) / P_1 L_1 + 1 = 0
$
und somit
$
  L_1 = P_1 / (1 - P_2).
$
Also gilt
$
  L = (P_1 / (1 - P_2), 0).
$

Analog erhält man für den Schnittpunkt $N$ von $P C$ mit $A B$:
$
  N = (0, P_2 / (1 - P_1)).
$

Wir schreiben nun
$
  L = (L_1, 0), quad M = (M_1, M_2), quad N = (0, N_2).
$
Dann gilt insbesondere
$
  M_1 + M_2 = 1.
$

Der Flächeninhalt des Dreiecks $L M N$ ergibt sich als Differenz zwischen dem
Flächeninhalt des umfassenden Dreiecks $A B C$ und den Flächeninhalten der drei
Randdreiecke $B L N$, $C L M$ und $A N M$:
$
  cal(A)(L M N)
  =
  cal(A)(A B C)
  -
  cal(A)(B L N)
  -
  cal(A)(C L M)
  -
  cal(A)(A N M).
$

Dabei ist
$
  cal(A)(A B C) = 1 / 2,
$
$
  cal(A)(B L N) = 1 / 2 L_1 N_2,
$
$
  cal(A)(C L M) = 1 / 2 (1 - L_1) M_2,
$
und
$
  cal(A)(A N M) = 1 / 2 M_1 (1 - N_2).
$

Damit folgt
$
  cal(A)(L M N)
  =
  1 / 2
  -
  1 / 2 L_1 N_2
  -
  1 / 2 (1 - L_1) M_2
  -
  1 / 2 M_1 (1 - N_2).
$

Also
$
  cal(A)(L M N)
  =
  1 / 2 (
    1
    - L_1 N_2
    - (1 - L_1) M_2
    - M_1 (1 - N_2)
  ).
$

Durch Ausmultiplizieren ergibt sich
$
  cal(A)(L M N)
  =
  1 / 2 (
    1
    - L_1 N_2
    - M_2
    + L_1 M_2
    - M_1
    + M_1 N_2
  ).
$

Also
$
  cal(A)(L M N)
  =
  1 / 2 (
    1
    - M_1
    - M_2
    - L_1 N_2
    + L_1 M_2
    + M_1 N_2
  ).
$

Wegen $M_1 + M_2 = 1$ folgt
$
  cal(A)(L M N)
  =
  1 / 2 (
    L_1 M_2
    + M_1 N_2
    - L_1 N_2
  ).
$

Da die Punkte hier innerhalb des Dreiecks liegen, ist der Ausdruck nichtnegativ.

Setzt man nun
$
  L_1 = P_1 / (1 - P_2),
  quad
  M_1 = P_1 / (P_1 + P_2),
  quad
  M_2 = P_2 / (P_1 + P_2),
  quad
  N_2 = P_2 / (1 - P_1),
$
so erhält man
$
  cal(A)(L M N)
  =
  frac(P_1 P_2 (1 - P_1 - P_2), (1 - P_1)(1 - P_2)(P_1 + P_2)).
$

+ Zunächst betrachten wir die Bedingung
  $
    cal(A)(L M N) > cal(A)(B L N).
  $

  Es gilt
  $
    cal(A)(B L N)
    =
    1 / 2 L_1 N_2
    =
    1 / 2 dot P_1 / (1 - P_2) dot P_2 / (1 - P_1).
  $

  Also
  $
    cal(A)(B L N)
    =
    frac(P_1 P_2, 2 (1 - P_1)(1 - P_2)).
  $

  Die Ungleichung lautet somit
  $
    frac(P_1 P_2 (1 - P_1 - P_2), (1 - P_1)(1 - P_2)(P_1 + P_2))
    >
    frac(P_1 P_2, 2 (1 - P_1)(1 - P_2)).
  $

  Da $P in Omega$ gilt, sind alle Faktoren, durch die wir teilen, positiv. Daher
  folgt
  $
    frac(1 - P_1 - P_2, P_1 + P_2) > 1 / 2.
  $

  Dies ist äquivalent zu
  $
    2 (1 - P_1 - P_2) > P_1 + P_2.
  $

  Also
  $
    2 > 3 P_1 + 3 P_2.
  $

  Damit ist
  $
    P_1 + P_2 < 2 / 3.
  $

  Gesucht ist also die Wahrscheinlichkeit, dass der zufällige Punkt $P$ im
  Teilgebiet
  $
    E_1 = { (P_1, P_2) in Omega : P_1 + P_2 < 2 / 3 }
  $
  liegt.

  Dieses Teilgebiet ist ein rechtwinkliges Dreieck mit Kathetenlänge $2 / 3$.
  Daher gilt
  $
    cal(A)(E_1) = 1 / 2 dot (2 / 3)^2 = 2 / 9.
  $

  Somit folgt
  $
    PP(E_1)
    =
    frac(cal(A)(E_1), cal(A)(Omega))
    =
    frac(2 / 9, 1 / 2)
    =
    4 / 9.
  $

  Also ist
  $
    PP(cal(A)(L M N) > cal(A)(B L N)) = 4 / 9.
  $

+ Nun betrachten wir die Bedingung
  $
    cal(A)(L M N) > cal(A)(A N M).
  $

  Es gilt
  $
    cal(A)(A N M)
    =
    1 / 2 M_1 (1 - N_2).
  $

  Mit
  $
    M_1 = P_1 / (P_1 + P_2)
  $
  und
  $
    N_2 = P_2 / (1 - P_1)
  $
  folgt
  $
    1 - N_2
    =
    1 - P_2 / (1 - P_1)
    =
    (1 - P_1 - P_2) / (1 - P_1).
  $

  Also ist
  $
    cal(A)(A N M)
    =
    1 / 2 dot P_1 / (P_1 + P_2) dot (1 - P_1 - P_2) / (1 - P_1).
  $

  Somit lautet die Ungleichung
  $
    frac(P_1 P_2 (1 - P_1 - P_2), (1 - P_1)(1 - P_2)(P_1 + P_2))
    >
    frac(1, 2) dot P_1 (1 - P_1 - P_2) / ((P_1 + P_2)(1 - P_1)).
  $

  Wieder sind alle Faktoren positiv. Durch Kürzen erhält man
  $
    P_2 / (1 - P_2) > 1 / 2.
  $

  Dies ist äquivalent zu
  $
    2 P_2 > 1 - P_2.
  $

  Also
  $
    3 P_2 > 1.
  $

  Daher gilt
  $
    P_2 > 1 / 3.
  $

  Gesucht ist also die Wahrscheinlichkeit, dass der zufällige Punkt $P$ im
  Teilgebiet
  $
    E_2 = { (P_1, P_2) in Omega : P_2 > 1 / 3 }
  $
  liegt.

  Dieses Teilgebiet ist ein rechtwinkliges Dreieck mit Kathetenlänge $2 / 3$.
  Daher gilt
  $
    cal(A)(E_2) = 1 / 2 dot (2 / 3)^2 = 2 / 9.
  $

  Somit folgt
  $
    PP(E_2)
    =
    frac(cal(A)(E_2), cal(A)(Omega))
    =
    frac(2 / 9, 1 / 2)
    =
    4 / 9.
  $

  Also ist
  $
    PP(cal(A)(L M N) > cal(A)(A N M)) = 4 / 9.
  $

#pagebreak()

#exercise([3 + 2 + 1])[
  Im Punkt $(0, p) in RR^2$ mit $p > 0$ befindet sich eine Quelle radioaktiver
  Strahlung, die gleichmäßig Partikel in alle Richtungen, die die $x$-Achse
  irgendwann treffen, ausstößt. Für $a < b in RR$ bezeichne $C_(a, b)$ das
  Ereignis, dass ein rein zufällig ausgewähltes Partikel die $x$-Achse im
  Interval $[a, b]$ treffe.

  a) Stellen Sie ein geeignetes Modell $(Omega, scr(F), PP)$ auf. Berechnen Sie
  $PP(C_(a, b))$.

  b) Wir definieren
  $
    F(b) := lim_(a -> -infinity) PP(C_(a, b)).
  $
  Zeigen Sie, dass $F$ eine Verteilungsfunktion auf $RR$ ist.

  c) Zeigen Sie, dass $1 - F(x) tilde p / (pi x)$ für große $x$.
]

=== Lösung

#pagebreak()

#exercise([2 + 1 + 1 + 1 + 1])[
  Es sei $F : RR -> [0, 1]$ gegeben durch
  $
    F(x) = sum_(n=1)^infinity 2^(-n) bb(1)_([1\/n, infinity))(x).
  $

  Zeigen Sie, dass es sich um die Verteilungsfunktion eines
  Wahrscheinlichkeitsmaßes $PP$ auf $(RR, cal(B)(RR))$ handelt, und berechnen
  Sie die folgenden Wahrscheinlichkeiten:
  $
    PP([1\/10, infinity)), quad PP({0}), quad PP((-5, 1\/2)), quad PP(QQ).
  $
]

=== Lösung
