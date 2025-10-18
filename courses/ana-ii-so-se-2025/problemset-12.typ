#import "common.typ": *

#show: problemset(12)

#exercise([20])[
  Finden Sie die Lösung $x : RR -> RR^2$ des Anfangswertproblems
  $
    forall t in RR : quad dot(x)(t) & = mat(1, -1; 1, 1) x(t) \
                               x(0) & = vec(1, 0).
  $
]

=== Lösung:

Nach Proposition 20.8 (lineare gewöhnliche Differentialgleichung mit konstanten
Koeffizienten) besitzt ein Anfangswertproblem der Form
$
  dot(x)(t) = A x(t), quad x(0) = x_0
$
mit $A in RR^(2 times 2)$ die eindeutige Lösung
$
  x(t) = exp(t A) dot x_0.
$

Für
$
  A = mat(1, -1; 1, 1), quad x_0 = vec(1, 0)
$
berechnen wir die Matrix-Exponentialfunktion explizit.

Schreiben wir
$
  A = I_2 + B, quad B := mat(0, -1; 1, 0), quad B^2 = - I_2.
$

Da $A, B$ komutieren, können wir die Funktionalgleichung von $exp$ anwenden. Das
bekannte Ergebnis aus Übung 6 an der stelle $B$ ergibt somit als
$
  exp(t B) = I_2 cos t + B sin t.
$

Damit folgt
$
  exp(t A) = exp(t I_2 + t B) = e^t dot exp(t B) = e^t (I_2 cos t + B sin t) = e^t dot mat(cos t, -sin t; sin t, cos t).
$

Einsetzen von $x_0$ ergibt schließlich
$
  x(t) = e^t dot mat(cos t, -sin t; sin t, cos t) dot vec(1, 0) = e^t dot vec(cos t, sin t).
$

Also lautet die eindeutige Lösung
$
  forall t in RR : quad x(t) = e^t dot vec(cos t, sin t).
$

#pagebreak()

#exercise([20])[
  Seien $(t_0, x_0) in RR^2$. Finden Sie (wenn möglich) die Lösung $x : I -> RR$
  des Anfangswertproblems
  $
    forall t in I : quad dot(x)(t) & = sqrt(1 - x(t)^2) \
                            x(t_0) & = x_0
  $
  mit möglichst großem Intervall $I subset.eq RR$.
]

=== Lösung:

Betrachten wir die Gleichung
$
  dot(x)(t) = sqrt(1 - x(t)^2), quad x(t_0) = x_0.
$

*Fall 1*: $abs(x_0) > 1$

Für $abs(x_0) > 1$ ist $1 - x_0^2 < 0$ und die rechte Seite nicht reell
definiert. Es existiert also keine reelle Lösung.

*Fall 2*: $abs(x_0) = 1$

Dann gilt $sqrt(1 - x_0^2) = 0$ und damit $dot(x)(t_0) = 0$. Da der rechte
Funktionswert nur an den Stellen $x = plus.minus 1$ verschwindet, bleibt eine
Lösung konstant:
$
  x(t) equiv x_0, quad I = RR.
$

*Fall 3*: $abs(x_0) < 1$

Die Gleichung ist separierbar:
$
  (d x)/(sqrt(1 - x^2)) = d t.
$
Integriert man beide Seiten, erhält man
$
  integral_(x_0)^(x(t)) (1 - s^2)^(-1/2) d s = integral_(t_0)^t 1 d tau = t - t_0.
$
Da $integral (1 - s^2)^(-1/2) d s = arcsin(s)$, folgt
$
  arcsin(x(t)) - arcsin(x_0) = t - t_0
  quad => quad x(t) = sin(t - t_0 + arcsin(x_0)).
$

Die rechte Seite der Differentialgleichung ist immer nicht-negativ, daher muss
auch $dot(x)(t) >= 0$ gelten, das heißt
$
  cos(t - t_0 + arcsin(x_0)) >= 0.
$
Das ist genau dann erfüllt, wenn
$
  abs(t - t_0 + arcsin(x_0)) <= pi/2.
$
Daraus ergibt sich das maximale Lösungsintervall
$
  I = (t_0 - arcsin(x_0) - pi/2, t_0 - arcsin(x_0) + pi/2).
$
An den Randpunkten erreicht $x(t)$ den Wert $plus.minus 1$; danach würde
$dot(x)(t)$ das Vorzeichen wechseln und die Gleichung verletzen.

*Zusammenfassung*
$
  x(t) = cases(
    sin(t - t_0 + arcsin(x_0)) quad "falls" abs(x_0) < 1 "mit" I = (t_0 - arcsin(x_0) - pi/2 comma t_0 - arcsin(x_0) + pi/2),
    x_0 quad "falls" abs(x_0) = 1 "mit" I = RR,
    "keine Lösung" quad "falls" abs(x_0) > 1
  ).
$

#pagebreak()

#exercise([20])[
  Sei $D : RR -> RR$ die #smallcaps[Dirichlet]funktion, das heißt
  $
    D(x) = cases(
      1 quad "falls" x in QQ,
      0 quad "falls" x in.not QQ
    )
  $

  Sei $x : RR -> RR$, so dass
  $
    forall t in RR : dot(x)(t) = D(x(t)).
  $

  Zeigen Sie, dass $x$ konstant ist.
]


=== Beweis:

Nach dem #smallcaps[Darboux]schen Satz erfüllt die Ableitung $dot(x)$ einer
differenzierbaren Funktion die Zwischenwerteigenschaft, das heißt $dot(x)(RR)$
ist zusammenhängend.

Da $D$ nur die Werte $0$ und $1$ annimmt, gilt $dot(x)(t) = D(x(t)) in {0, 1}$
für alle $t in RR$. Die einzigen zusammenhängenden Teilmengen von ${0, 1}$ sind
${0}$ oder ${1}$. Da $RR$ zusammenhängend ist, muss $dot(x)$ konstant sein:
$
  dot(x)(t) equiv 0 quad "oder" quad dot(x)(t) equiv 1.
$

Fall 1: Angenommen $dot(x)(t) equiv 1$. Dann ist $x(t) = t + C$ für eine
Konstante $C in RR$. Da rationale und irrationale Zahlen dicht in $RR$ liegen,
nimmt $x(t) = t + C$ sowohl rationale als auch irrationale Werte an. Somit
wechselt $D(x(t))$ zwischen $0$ und $1$, im Widerspruch zu
$dot(x)(t) = D(x(t)) = 1$.

Fall 2: Also ist $dot(x)(t) equiv 0$, das heißt $x(t) equiv C$ für eine
Konstante $C in RR$. Einsetzen in die Differentialgleichung ergibt
$
  0 = dot(x)(t) = D(x(t)) = D(C).
$
Folglich ist $D(C) = 0$, also $C in RR without QQ$.

Somit sind die einzigen Lösungen die konstanten Funktionen $x(t) equiv C$ mit
$C in RR without QQ$.

