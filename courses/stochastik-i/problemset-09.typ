#import "common.typ": *

#show: problemset("9")

#exercise([2 + 2 + 2])[
  Sei $phi_X$ die charakteristische Funktion einer reellwertigen
  Zufallsvariablen $X$ über $(Omega, scr(F), PP)$.

  + Zeigen Sie, dass $phi_X$ genau dann reellwertig ist, wenn die Verteilung von
    $X$ symmetrisch ist, also $PP(X in B) = PP(-X in B)$ für alle
    $B in cal(B)(RR)$ gilt.

  + Zeigen Sie: Falls ein $u_0 != 0$ mit $abs(phi_X (u_0)) = 1$ existiert, so
    gibt es ein $theta.alt in [0, 2pi)$, so dass
    $
      sum_(k in ZZ) PP(X = (2k pi + theta.alt) / u_0) = 1.
    $

  Sei die charakteristische Funktion $phi_X$ von $X$ reellwertig und
  nicht-negativ. Ferner seien $(X_n)_(n in NN)$ unabhängige, identisch verteilte
  Zufallsvariablen mit der gleichen Verteilung wie $X$ und es sei
  $N ~ "Poisson"(lambda)$ für ein $lambda > 0$, wobei $N$ unabhängig von
  $(X_n)_(n in NN)$ ist.

  + Zeigen Sie, dass die charakteristische Funktion von $Y := sum_(n=1)^N X_n$
    gegeben ist durch
    $
      phi_Y (u) = exp(lambda(phi_X (u) - 1)), quad u in RR.
    $
]

=== Lösung

+ Sei zunächst die Verteilung von $X$ symmetrisch. Dann haben $X$ und $-X$ die
  gleiche Verteilung und damit folgt für alle $u in RR$
  $
    phi_X(u) = phi_(-X)(u) = EE(e^(-i u X)) = overline(EE(e^(i u X))) = overline(phi_X(u)).
  $
  Also ist $phi_X(u) in RR$ für alle $u in RR$.

  Sei umgekehrt $phi_X$ reellwertig. Dann gilt für alle $u in RR$
  $
    phi_(-X)(u) = EE(e^(-i u X)) = overline(phi_X(u)) = phi_X(u).
  $
  Also stimmen die charakteristischen Funktionen von $X$ und $-X$ überein. Nach
  dem Eindeutigkeitssatz für charakteristische Funktionen folgt, dass $X$ und
  $-X$ die gleiche Verteilung besitzen. Somit gilt insbesondere
  $PP(X in B) = PP(-X in B)$ für alle $B in cal(B)(RR)$.

+ Die Funktion
  $f : [0, 2 pi) -> underbrace(overline(B_1) (0) without B_1(0), =: S^1)$
  definiert als $theta.alt mapsto e^(i theta.alt)$ ist bijektiv.

  Da $abs(phi_X(u_0)) = 1$ existiert somit ein $theta.alt in [0, 2 pi)$, sodass
  $phi_X(u_0) = e^(i theta.alt)$ ist. Somit folgt
  $
    e^(-i theta.alt) EE(e^(i u_0 X)) = EE(e^(i(u_0 X - theta.alt))) = 1.
  $
  Zudem gilt
  $
    EE(Re(e^(i(u_0 X - theta.alt)))) = Re(EE(e^(i(u_0 X - theta.alt)))) = Re(1) = 1,
  $
  da $e^(i(u_0 X - theta.alt))$ definitionsgemäß in $S^1$ liegt, folgt
  $Re(e^(i(u_0 X - theta.alt))) <= 1$, also gilt:
  $
    EE(1 - Re(e^(i(u_0 X - theta.alt)))) = 1 - 1 = 0
  $
  und $1 - Re(e^(i(u_0 X - theta.alt))) >= 0$, also muss
  $1 - Re(e^(i(u_0 X - theta.alt))) = 0$ gelten und somit
  $
    e^(i u_0 X) = e^(i theta.alt).
  $

  Da sich $f$ periodisch mit einer Periode von $2pi$ auf $RR$ fortsetzen lässt,
  folgt, dass
  $
    X = (theta.alt + 2 pi ZZ)/u_0 quad "f.s." quad.
  $

+ Definieren wir uns zunächst $Y_k := sum_(n=1)^k X_n$. Da $N$ Poisson-verteilt
  ist, gilt
  $
    bb(1) = sum_(k = 0)^infinity bb(1)_(N = k),
  $
  also folgt
  $
    phi_Y (u) & = EE(e^(i u Y)) \
              & = EE(e^(i u Y) bb(1)) \
              & = EE(sum_(k = 0)^infinity e^(i u Y) bb(1)_(N = k)) \
              & = sum_(k = 0)^infinity EE(e^(i u Y) bb(1)_(N = k)) \
              & = sum_(k = 0)^infinity EE(e^(i u Y_k) bb(1)_(N = k)).
  $

  Da $N$ unabhängig von $(X_n)_(n in NN)$ ist, folgt mit einer kleinen Rechnung,
  dass auch $e^(i u Y_n)$ und $bb(1)_(N = k)$ unabhängig sind; da $N$
  Poisson-verteilt ist, folgt:
  $
    phi_Y (u) & = sum_(k = 0)^infinity EE(e^(i u Y_k)) e^(-lambda) lambda^k / k!.
  $

  Da die $X_n$ alle unabhängig und gleichverteilt wie $X$ sind, folgt
  $
    phi_Y (u) & = sum_(k = 0)^infinity EE(e^(i u X))^k e^(-lambda) lambda^k / k! \
              & = sum_(k = 0)^infinity phi_X (u)^k e^(-lambda) lambda^k / k! \
              & = e^(-lambda) sum_(k = 0)^infinity (phi_X (u) lambda)^k / k! \
              & = e^(-lambda) e^(phi_X (u) lambda) \
              & = e^(lambda (phi_X (u) - 1)).
  $

#pagebreak()

#exercise([2 + 4])[
  Es seien $X, Y$ unabhängige, identisch verteilte, reellwertige
  Zufallsvariablen. Außerdem nehmen wir an, dass auch $X + Y$ und $X - Y$
  unabhängig sind.

  + Zeigen Sie, dass für alle $u in RR$,
    $
      phi_X (2u) = phi_X (u)^3 phi_X (-u).
    $

  + Es gelte zudem: $EE(X) = 0$, $EE(X^2) = 1$. Zeigen Sie, dass
    $X ~ cal(N)(0, 1)$.

    _Hinweis:_ Zeigen Sie zunächst, dass die Funktion
    $psi(u) := phi_X (u) \/ phi_X (-u)$ die Funktionalgleichung
    $psi(u) = psi(u \/ 2^n)^(2^n)$ für alle $n in NN$ erfüllt und folgern Sie,
    dass $phi_X$ symmetrisch sein muss.
]

=== Lösung

#pagebreak()

#exercise([3 + 3])[
  Wir betrachten zwei Folgen reellwertiger Zufallsvariablen $(X_n)_(n in NN)$
  und $(Y_n)_(n in NN)$ auf einem Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$.

  + Angenommen $X_n attach(arrow, t: d) X$ und $Y_n attach(arrow, t: p) c$ für
    eine Konstante $c$. Zeigen Sie, dass $X_n Y_n attach(arrow, t: d) c X$ und
    für $c != 0$ auch
    $X_n \/ Y_n bb(1)_({Y_n != 0}) attach(arrow, t: d) X \/ c$.

  + Angenommen $X_n attach(arrow, t: d) 0$ und $Y_n attach(arrow, t: p) Y$.
    Zudem sei $g : RR^2 -> RR$ stetig. Zeigen Sie, dass
    $g(X_n, Y_n) attach(arrow, t: p) g(0, Y)$.
]

=== Lösung

+ Um zu zeigen, dass $X_n Y_n$ in Verteilung gegen $c X$ konvergiert, müssen wir
  zeigen, dass für alle Stetigkeitsstellen $t$ von $c X$ gilt, dass
  $
    PP(X_n Y_n <= t) -> PP(c X <= t)
  $

  O.B.d.A. nehmen wir an, dass $0 < epsilon < c$ und $t > 0$ ist, dann folgt:
  $
    PP(X_n Y_n <= t) & = PP(X_n Y_n <= t, abs(Y_n - c) <= epsilon)
                       + PP(X_n Y_n <= t, abs(Y_n - c) > epsilon) \
                     & = PP(c X_n + X_n (Y_n - c) <= t, abs(Y_n - c) <= epsilon)
                       + PP(X_n Y_n <= t, abs(Y_n - c) > epsilon)
  $

  Schätzen wir $Y_n - c$ gegen $-epsilon$ ab, so folgt, dass
  $
    PP(c X_n + X_n (Y_n - c) <= t, abs(Y_n - c) <= epsilon) <= PP(X_n <= t/(c - epsilon))
  $
  Andererseits können wir $Y_n - c$ gegen $epsilon$ abschätzen und erhalten
  $
    PP(c X_n + X_n (Y_n - c) <= t, abs(Y_n - c) <= epsilon) >= PP(X_n <= t/(c + epsilon)).
  $
  Zusätzlich gilt natürlich
  $PP(X_n Y_n <= t, abs(Y_n - c) > epsilon) <= PP(abs(Y_n - c) > epsilon)$.

  Zusammen erhalten wir
  $
    PP(X_n <= t/(c + epsilon)) - PP(abs(Y_n - c) > epsilon) <= PP(X_n Y_n <= t)
    <= PP(X_n <= t/(c - epsilon)) + PP(abs(Y_n - c) > epsilon)
  $
  Da $Y_n$ in Wahrscheinlichkeit gegen $c$ konvergiert, folgt
  $
    lim_(n -> infinity) PP(X_n <= t/(c + epsilon)) <= lim_(n -> infinity) PP(X_n Y_n <= t)
    <= lim_(n -> infinity) PP(X_n <= t/(c - epsilon)) "(1)".
  $

  Die Stelle $t/c$ ist genau dann eine Stetigkeitsstelle der Verteilungsfunktion
  von $X$, wenn $t$ eine Stetigkeitsstelle von $c X$ ist. Da $X$ an der Stelle
  $t/c$ stetig ist und (1) für alle $0 < epsilon < c$ gilt, folgt
  $lim_(n -> infinity) PP(X_n Y_n <= t) = lim_(n -> infinity)
  PP(c X <= t)$.

  Sei nun $c != 0$. Wir definieren
  $
    Z_n := 1 / Y_n bb(1)_({Y_n != 0}).
  $
  Dann gilt $Z_n attach(arrow, t: p) 1 / c$. Denn für $epsilon > 0$ wählen wir
  $delta > 0$ so klein, dass aus $abs(y - c) <= delta$ bereits $y != 0$ und
  $abs(1/y - 1/c) <= epsilon$ folgt. Damit gilt
  $
    PP(abs(Z_n - 1/c) > epsilon) <= PP(abs(Y_n - c) > delta) -> 0.
  $
  Wenden wir nun den bereits gezeigten Produktfall auf $X_n$ und $Z_n$ an, so
  folgt
  $
    X_n Z_n = X_n / Y_n bb(1)_({Y_n != 0}) attach(arrow, t: d) X / c.
  $

#pagebreak()

#exercise([2 + 2 + 2])[
  Es sei $(X_n)_(n in NN)$ eine Folge von unabhängigen, reellwertigen
  Zufallsvariablen auf einem Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$.

  + Angenommen alle $X_n$, $n in NN$, sind gleichverteilt auf ${0, 1, dots, 9}$.
    Zeigen Sie, dass $Y_n := sum_(i=1)^n X_i 10^(-i)$, $n in NN$, in Verteilung
    gegen eine auf $[0, 1]$ gleichverteilte Zufallsvariable $Y$ konvergiert.
    Konvergiert die Folge $(Y_n)_(n in NN)$ auch $PP$-fast sicher gegen eine auf
    $[0, 1]$ gleichverteilte Zufallsvariable?

  + Angenommen alle $X_n$, $n in NN$, sind $"Cauchy"(0,1)$-verteilt und
    $
      M_n := max{X_1, X_2, dots, X_n}, quad n in NN.
    $
    Zeigen Sie, dass $pi M_n \/ n$ in Verteilung gegen eine Zufallsvariable $M$
    mit Verteilungsfunktion $F_M (x) = exp(-1\/x) bb(1)_((0,infinity))(x)$,
    $x in RR$, konvergiert.

  + Angenommen alle $X_n$, $n in NN$, sind normalverteilt, d.h.
    $X_n ~ cal(N)(mu_n, sigma_n^2)$, $n in NN$, und es gilt
    $X_n attach(arrow, t: d) X$. Zeigen Sie, dass die Verteilung von $X$ dann
    auch eine (möglicherweise degenerierte) Normalverteilung ist.
]

=== Lösung
