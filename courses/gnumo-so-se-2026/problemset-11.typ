#import "common.typ": *

#show: problemset("11")

#exercise([Notwendige Optimalitätsbedingungen], [5])[
  + Sei $f in C^2(RR; RR)$ und $x_star in RR$ ein lokales Minimum von $f$. Dann
    gelten die notwendigen Optimalitätsbedingungen erster Ordnung
    $f'(x_star) = 0$ und zweiter Ordnung $f''(x_star) >= 0$.

  + Beweisen Sie unter Verwendung von (a), dass für ein lokales Minimum
    $x_star in RR^n$ von $F in C^2(RR^n; RR)$ die notwendigen
    Optimalitätsbedingungen erster Ordnung $nabla F(x_star) = 0$ und zweiter
    Ordnung $nabla^2 F(x_star)$ positiv semidefinit gelten.
]

=== Lösung

+ Da $x_star$ ein lokales Minimum von $f$ ist existiert ein $epsilon > 0$ so das
  für alle $y in RR$ mit $abs(x - y) < epsilon$ folgt das $f(y) - f(x) > 0$ ist.

  Somit folgt das
  $
    0 <= lim_(h arrow.br 0) (f(x_star + h) - f(x))/h = f'(x_star) = lim_(h
    arrow.tr 0) (f(x_star + h) - f(x))/h <= 0
  $
  also muss $f'(x_star) = 0$ sein.

  Taylorn wir nun $f$ an der stelle $x_star$ so folgt:
  $
    f(x) = f(x_star) + f'(x_star)(x - x_star) + 1/2 f''(x_star)(x - x_star)^2 + R_3 f(x, x_star)
  $
  und somit
  $
    (f(x) - f(x_star)) / (x - x_star)^2 = 1/2 f''(x_star) + R_3 f(x, x_star) / (x - x_star)^2.
  $

  Der Satz von Taylor sagt und das $R_3 f(x, x_star) / (x - x_star)^2$ gegen
  null geht, da $x_star$ das minimum ist folgt zusätzlich das $f(x) - f(x_star)$
  positiv und somit $f''(x_star) >= 0$ ist.

+ Definieren wir uns die Funktion $phi(delta) := F(x_star + delta d)$ für alle
  $d in RR^n$.

  Da $F$ differenzierbar ist und $x_star + delta d$ linear in $delta$ ist $phi$
  in $delta$ differenzierbar, mit der Kettenregel folgt:
  $
    phi'(delta) = nabla F(x_star + delta d)^top d
  $
  differenzieren wir ein zweites mal erhalten wir
  $
    phi''(delta) = d^top nabla^2 F(x_star + delta d) d.
  $

  Mit der (a) folgt nun das $x_star$ genau dann ein lokales Minimum von $F$ ist
  wenn $0$ ein lokales minimum von $phi$ ist, also muss gelten das $nabla
  F(x_star)^top d = 0$ ist für alle $d in RR^n$ also $nabla F(x_star) = 0$.

  Genaus so folgt das $d^top nabla^2 F(x_star) d >= 0$ aus $phi''(x_star) >= 0$,
  und somit $nabla^2 F(x_star)$ positiv semidefinit.

#pagebreak()

#exercise([Verfahren des steilsten Abstiegs], [5])[
  Die Funktion $f : RR -> RR$ sei gegeben vermöge
  $
    f(x) := cases(
      (3(1-x)^2)/4 - 2(1-x) & "falls " x > 1,
      (3(1+x)^2)/4 - 2(1+x) & "falls " x < -1,
      x^2 - 1 & "falls " abs(x) <= 1,
    )
  $

  Betrachten Sie das allgemeine Abstiegsverfahren mit Folge $(x_k)_(k in NN_0)$
  für die gilt

  - die Abstiegsrichtung ist gegeben durch $d^k = -f'(x_k)$,
  - die Schrittweite ist gegeben durch $s_0 = 1$ und $s_k > 0$ mit
    $f(x_k + s_k d^k) < f(x_k)$.

  + Untersuchen Sie die Konvergenz des Algorithmus für Startpunkte $x_0$ mit
    $abs(x_0) > 1$.

  + Zeichnen Sie den Graphen von $f$ und die ersten 4 Iterationsschritte zu
    einem Startwert $x_0$ aus (a) mit, wenn angemessen, Schrittweite $s_k = 1$.

  + Wie verhält sich der Algorithmus im Bezug auf Konvergenz für Startwerte
    $x_0$ mit $abs(x_0) <= 1$.
]

=== Lösung

#pagebreak()

#exercise([Exakte Schrittweitensteuerung], [5])[
  Zu gegebener symmetrisch positiv definiter Matrix $A in RR^(n times n)$ und
  beliebigem $b in RR^n$ mit $n in NN$ betrachte man die quadratische Funktion
  $f : RR^n -> RR$, $f(x) = 1/2 x^top A x + b^top x$. Weiterhin sei $y in RR^n$
  eine gegebene Abstiegsrichtung von $f$ im Punkt $x in RR^n$ und
  $
    delta_star := op("arg min", limits: #true)_(delta >= 0) f(x + delta y)
  $
  bezeichne die durch die Minimierungsregel gelieferte Schrittweite.

  + Begründen Sie, warum $delta_star$ wohldefiniert ist und $delta_star > 0$
    gilt.

  + Man betrachte $f$ von $x$ aus entlang der Richtung $y$, d.h. man untersuche
    die Funktion $phi : RR -> RR$, $delta |-> f(x + delta y)$. Welche Gestalt
    hat die Funktion $phi$, z.B. linear, quadratisch oder anders? Folgern Sie,
    dass $delta_star$ nicht nur wohldefiniert ist, sondern sogar eindeutig
    bestimmt ist.

  + Zeigen Sie, dass $delta_star$ für alle $gamma in (0, 0.5]$ der
    Armijo-Bedingung
    $
      f(x + delta_star y) - f(x) <= delta_star gamma nabla f(x)^top y
    $
    genügt, für alle $gamma > 0.5$ aber nicht.
]

=== Lösung

+ Sei
  $
    g := nabla f(x) = A x + b.
  $
  Da $y$ eine Abstiegsrichtung von $f$ im Punkt $x$ ist, gilt
  $
    g^top y = nabla f(x)^top y < 0.
  $
  Insbesondere ist $y != 0$. Da $A$ symmetrisch positiv definit ist, folgt
  $
    y^top A y > 0.
  $

  Wir betrachten
  $
    phi(delta) := f(x + delta y).
  $
  Dann ist
  $
    phi(delta)
    = f(x) + delta nabla f(x)^top y + 1/2 delta^2 y^top A y.
  $
  Diese Funktion ist wegen $y^top A y > 0$ eine nach oben geöffnete quadratische
  Funktion in $delta$. Daher besitzt sie auf $[0, infinity)$ ein Minimum.

  Aus
  $
    phi'(delta)
    = nabla f(x)^top y + delta y^top A y
  $
  folgt für den stationären Punkt
  $
    delta_star
    = - (nabla f(x)^top y) / (y^top A y).
  $
  Wegen $nabla f(x)^top y < 0$ und $y^top A y > 0$ gilt
  $
    delta_star > 0.
  $
  Also liegt der Minimierer im Inneren von $[0, infinity)$, und $delta_star$ ist
  wohldefiniert.

+ Betrachten wir $phi(delta)$:
  $
    phi(delta)
    = 1/2 (x + delta y)^top A (x + delta y) + b^top (x + delta y).
  $
  Ausmultiplizieren liefert
  $
    phi(delta)
    = f(x) + delta (A x + b)^top y + 1/2 delta^2 y^top A y.
  $
  Also ist $phi$ eine quadratische Funktion in $delta$.

  Da $A$ positiv definit ist und $y != 0$ gilt
  $
    y^top A y > 0.
  $

  Differenzieren wir $phi$ nach $delta$, so erhalten wir
  $
    phi'(delta)
    = (A x + b)^top y + delta y^top A y
    = nabla f(x)^top y + delta y^top A y.
  $
  Setzen wir nun null, so folgt
  $
    delta_star
    = - (nabla f(x)^top y) / (y^top A y)
    = - (y^top (A x + b)) / (y^top A y).
  $

+ Es gilt
  $
    f(x + delta y) - f(x)
    = delta nabla f(x)^top y + 1/2 delta^2 y^top A y.
  $
  Setzen wir $delta = delta_star$ ein. Zur Abkürzung schreiben wir
  $
    s := nabla f(x)^top y
    quad "und" quad
    q := y^top A y.
  $
  Dann gilt $s < 0$, $q > 0$ und
  $
    delta_star = - s / q.
  $
  Also folgt
  $
    f(x + delta_star y) - f(x)
    = delta_star s + 1/2 delta_star^2 q
    = - s^2 / q + 1/2 s^2 / q
    = - 1/2 s^2 / q.
  $
  Andererseits ist
  $
    delta_star gamma nabla f(x)^top y
    = (-s / q) gamma s
    = - gamma s^2 / q.
  $
  Die Armijo-Bedingung
  $
    f(x + delta_star y) - f(x)
    <= delta_star gamma nabla f(x)^top y
  $
  ist daher äquivalent zu
  $
    - 1/2 s^2 / q <= - gamma s^2 / q.
  $
  Da $s^2 / q > 0$ gilt, ist dies äquivalent zu
  $
    1/2 >= gamma.
  $
  Somit gilt die Armijo-Bedingung genau für
  $
    gamma <= 1/2.
  $
  Insbesondere gilt sie für alle $gamma in (0, 0.5]$, für alle $gamma > 0.5$
  aber nicht.
