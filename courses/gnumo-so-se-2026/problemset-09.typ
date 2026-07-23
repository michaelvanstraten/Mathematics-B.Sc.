#import "common.typ": *
#import "@preview/zero:0.6.1": num, set-num

#set-num(round: (mode: "figures", precision: 7), exponent: (sci: 2))

#show: problemset("9")

#exercise([Iterative Verfahren], [5])[
  + Es seien $a > 0$ und $0 < delta < 1\/a$ gegeben. Geben Sie ein lokal
    quadratisch konvergentes Verfahren zur Bestimmung von $1\/a$ auf dem
    Intervall $[a^(-1) - delta, a^(-1) + delta]$ an so, dass die zugehörige
    Verfahrensfunktion ohne Division auskommt. Bestimmen Sie den lokalen
    Konvergenzradius für ihre gewählte Verfahrensfunktion.

  + Man berechne mit einem Fehler kleiner als $10^(-6)$ die Nullstelle $z = pi$
    der reellen Funktion $f(x) = sin(x)$ mittles

    + einer Intervallschachtelung zum Startintervall $[2, 4]$;

    + einer Fixpunktiteration $x_j = x_(j-1) + f(x_(j-1))$ zum Startwert
      $x_0 = 4$;

    + dem Newton-Verfahren $x_j = x_(j-1) - f'(x_(j-1))^(-1) f(x_(j-1))$ zum
      Startwert $x_0 = 4$.

    Geben Sie die Anzahl der benötigten Iterationen für jedes Verfahren sowie
    die jeweilige Approximation an die Nullstelle $z$ an. Für die
    Intervallschachtelung nehmen Sie den Mittelpunkt ihres letzten betrachteten
    Intervalls. Runden Sie auf 7 geltende Ziffern. Warum konvergiert in diesem
    Fall die einfache Fixpunktiteration genauso schnell wie das
    Newton-Verfahren?

    _Hinweis._ Sie dürfen für die Rechnungen in dieser Aufgabe auf ein
    Computeralgebrasystem zurückgreifen.
]

=== Lösung

#let MAX_ITER = int(10e5)
#let EPS = 1e-6

+ Für $alpha := 1/a$ wählen wir die Newton-Iteration angewandt auf
  $g(x) = 1/x - a$. Nach Vereinfachung erhält man die Verfahrensfunktion
  $
    phi(x) := x - g(x)/(g'(x)) = 2x - a x^2 = x(2 - a x).
  $

  Für den Fehler $e_j := x_j - alpha$ gilt sogar exakt
  $
    e_(j+1)
    = phi(alpha + e_j) - alpha
    = -a e_j^2.
  $
  Somit ist das Verfahren lokal quadratisch konvergent. Ist
  $abs(e_0) < 1/a = alpha$, so folgt
  $
    abs(e_(j+1)) = a abs(e_j)^2 < abs(e_j),
  $
  und damit $e_j -> 0$. Die Randpunkte gehören nicht mehr zum Konvergenzbereich:
  Für $x_0 = 0$ bleibt die Iteration etwa bei $0$. Der lokale Konvergenzradius
  dieser Verfahrensfunktion ist also
  $
    rho = 1/a.
  $
  Wegen $delta < 1/a$ liegt das gesamte vorgegebene Intervall im lokalen
  Konvergenzbereich.

+ #let interval-method(
    a,
    b,
    f: calc.sin,
    z: calc.pi,
  ) = {
    let x = 0
    for k in range(MAX_ITER) {
      x = (a + b) / 2
      (a, b) = if f(a) * f(x) < 0 { (a, x) } else { (x, b) }
      if (calc.abs(z - x) < EPS) { return (x, k + 1) }
    }
    (x, MAX_ITER)
  }

  #let fixpoint-method(x_0, f: calc.sin, z: calc.pi) = {
    let x = x_0
    for k in range(MAX_ITER) {
      x = x + f(x)
      if (calc.abs(z - x) < EPS) { return (x, k + 1) }
    }
    (x, MAX_ITER)
  }

  #let newton-method(x_0, f: calc.sin, ftic: calc.cos, z: calc.pi) = {
    let x = x_0
    for k in range(MAX_ITER) {
      x = x - f(x) / ftic(x)
      if (calc.abs(z - x) < EPS) { return (x, k + 1) }
    }
    (x, MAX_ITER)
  }

  #let interval-result = interval-method(2, 4)
  #let fixpoint-result = fixpoint-method(4)
  #let newton-result = newton-method(4)

  Für $epsilon = 10^(-6)$ ergeben die drei Verfahren:

  #figure(
    table(
      columns: 4,
      align: (left, center, right, right),
      [*Verfahren*], [*Iterationen*], [*Approximation*], [*Fehler*],
      [Intervallschachtelung],
      [#interval-result.at(1)],
      [#num(interval-result.at(0))],
      [#num(calc.abs(calc.pi - interval-result.at(0)))],

      [Fixpunktiteration],
      [#fixpoint-result.at(1)],
      [#num(fixpoint-result.at(0))],
      [#num(calc.abs(calc.pi - fixpoint-result.at(0)))],

      [Newton-Verfahren],
      [#newton-result.at(1)],
      [#num(newton-result.at(0))],
      [#num(calc.abs(calc.pi - newton-result.at(0)))],
    ),
  )

  Für die einfache Fixpunktiteration mit $G(x) = x + sin(x)$ und das
  Newton-Verfahren $N(x) = x - tan(x)$ setzen wir $e_j := x_j - pi$. Dann gilt
  wegen $sin(pi + e) = -sin(e)$ und $tan(pi + e) = tan(e)$:
  $
    G(pi + e) - pi & = e - sin(e)
                     = e^3/6 + O(e^5), \
    N(pi + e) - pi & = e - tan(e)
                     = -e^3/3 + O(e^5).
  $
  Beide Iterationen haben hier also Konvergenzordnung $3$. Deshalb benötigt die
  einfache Fixpunktiteration in diesem Spezialfall genauso viele Schritte wie
  das Newton-Verfahren.

#pagebreak()

#exercise([Mehrdimensionales Newton-Verfahren], [5])[
  Gegeben sei das nichtlineare Gleichungssystem
  $
    F(x, y) := mat(x^3 + y^3 - 11; x^3 - y^3 - 7) = mat(0; 0).
  $
  Es soll die Existenz eines Fixpunktes in $Q := [2, 3] times [1, 2]$ für das
  Newton-Verfahren gezeigt werden. Gehen Sie dazu wie folgt vor:

  + Formulieren Sie die Iterationsfunktion $Phi(x, y)$ für das Newton-Verfahren
    zur Bestimmung einer Nullstelle von $F$ in $RR^2$.

  + Zeigen Sie $Phi(Q) subset.eq Q$ sowie
    $sup_((x,y) in Q) norm(J Phi)_infinity < 1$ und folgern Sie die Existenz
    eines Fixpunktes. Hierbei bezeichne $J Phi$ die Jacobi-Matrix der
    Iterationsfunktion $Phi$.
]

=== Lösung

+ Die Jacobi-Matrix von $F$ ist
  $
    J_((x,y)) F = mat(3x^2, 3y^2; 3x^2, -3y^2).
  $
  Auf $Q$ gilt $x,y > 0$, also ist $J_((x,y)) F$ invertierbar mit
  $
    J_((x, y)) F^(-1)
    = 1/6 mat(1/(x^2), 1/(x^2); 1/(y^2), -1/(y^2)).
  $
  Damit lautet die Iterationsfunktion
  $
    Phi(x, y) & = mat(x; y) - J F(x, y)^(-1) F(x, y) \
              & = mat(x; y)
                - 1/6 mat(1/(x^2), 1/(x^2); 1/(y^2), -1/(y^2))
                mat(x^3 + y^3 - 11; x^3 - y^3 - 7) \
              & = mat((2x)/3 + 3/x^2; (2y)/3 + 2/(3y^2)).
  $

+ Definieren wir $Phi(x, y) =: mat(phi_1(x); phi_2(y))$ so folgt
  $
    (phi_1)'(x) = 2/3 - 6/x^3, quad (phi_2)'(y) = 2/3 - 4/(3y^3).
  $

  Die Ableitung $(phi_1)'$ ist auf $[2, 3]$ streng monoton wachsend und hat ihre
  einzige Nullstelle bei $x = 9^(1/3)$. Daher ist dort das Minimum von $phi_1$
  gegeben als $phi_1(9^(1/3)) = 9^(1/3) > 2$. Wegen
  $
    phi_1(2) = 25/12
    quad "und" quad
    phi_1(3) = 7/3
  $
  ist $phi_1([2, 3]) subset.eq [2, 3]$.

  Analog ist $(phi_2)'$ auf $[1, 2]$ streng monoton wachsend und hat ihre
  einzige Nullstelle bei $y = 2^(1/3)$. Also ist das Minimum
  $phi_2(2^(1/3)) = 2^(1/3) > 1$, und wegen
  $
    phi_2(1) = 4/3
    quad "und" quad
    phi_2(2) = 3/2
  $
  gilt $phi_2([1, 2]) subset.eq [1, 2]$. Insgesamt folgt somit
  $
    Phi(Q) subset.eq Q.
  $

  Die Jacobi-Matrix der Iterationsfunktion ist diagonal:
  $
    J_((x, y)) Phi
    = mat(2/3 - 6/x^3, 0; 0, 2/3 - 4/(3y^3)).
  $
  Für die erste Diagonalkomponente gilt auf $[2,3]$
  $
    sup_(x in [2,3]) abs(2/3 - 6/x^3)
    = max(1/12, 4/9)
    = 4/9,
  $
  und für die zweite Diagonalkomponente auf $[1,2]$
  $
    sup_(y in [1,2]) abs(2/3 - 4/(3y^3))
    = max(2/3, 1/2)
    = 2/3.
  $
  Daher ist bezüglich der Maximumsnorm
  $
    sup_((x,y) in Q) norm(J_((x, y)) Phi)_infinity
    = max(4/9, 2/3)
    = 2/3 < 1.
  $
  Da $Q$ abgeschlossen und konvex ist, folgt aus dem Mittelwertsatz, dass $Phi$
  auf $Q$ eine Kontraktion ist. Mit $Phi(Q) subset.eq Q$ liefert der Banach'sche
  Fixpunktsatz die Existenz sogar Eindeutigkeit eines Fixpunktes von $Phi$ in
  $Q$. Wegen der Invertierbarkeit von $J_((x,y)) F$ auf $Q$ ist jeder Fixpunkt
  von $Phi$ zugleich eine Nullstelle von $F$.

#pagebreak()

#exercise([Gedämpftes Newton-Verfahren], [5])[
  Aus der Vorlesung ist bekannt, dass es sich beim Newton-Verfahren um ein lokal
  quadratisch konvergentes Verfahren handelt. Um globale Konvergenz des
  Newton-Verfahrens zu ermöglichen betrachtet man das gedämpfte Newton-Verfahren
  mit $theta_k in (0, 1]$ für $k in NN$ in der folgenden Form
  $
    x_(k+1) = x_k - theta_k f(x_k) / f'(x_k).
  $
  Eine geschickte Wahl von $theta_k$ ermöglicht es globale Konvergenz sicher zu
  stellen. Zeigen Sie dazu die folgende Aussage ohne explizit auf die Resultate
  aus Satz 4.21 zurückzugreifen:

  Es sei $[a, b]$ ein nicht-leeres Intervall und die Funktion $f in C^2([a, b])$
  habe eine Nullstelle $z in (a, b)$. Weiterhin gelte
  $m := min_(x in [a,b]) abs(f'(x)) > 0$ und es sei
  $M := max_(x in [a,b]) abs(f''(x))$. Dann kann man für einen beliebigen
  Startwert $x_0 in [a, b]$ eine Folge $(theta_k)_(k in NN)$ finden, sodass das
  gedämpfte Newton-Verfahren gegen eine Nullstelle $z$ konvergiert. Sobald
  $x_k in K_(rho.alt) (z)$ mit $rho.alt := m \/ (2M)$ kann insbesondere
  $theta_k = 1$ gewählt werden.

  _Hinweis._ Führen Sie für $f(x_(k+1))$ eine Taylorentwicklung mit
  quadratischem Restglied um $f(x_k)$ aus. Diskutieren Sie das erhaltene
  quadratische Polynom in $theta_k$, abhängig von $f(x_k)$, $f'(x_k)$ und $M$,
  geeignet, um zu zeigen, dass $theta_k$ stets passend gewählt werden kann,
  sodass $abs(f(x_(k+1))) < q abs(f(x_k))$ für ein $q in (0, 1)$ gilt.
]

=== Lösung
