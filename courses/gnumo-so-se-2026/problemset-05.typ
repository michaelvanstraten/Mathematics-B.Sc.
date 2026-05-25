#import "@preview/cetz-plot:0.1.3": chart, plot
#import "@preview/cetz:0.4.2"
#import "@preview/zero:0.6.1": format-table, num, set-num

#import "common.typ": *

#show: problemset("5")

#set-num(round: (mode: "figures", precision: 3), exponent: (sci: 3))

#exercise([Legendre-Polynome], [5])[
  + Bestimmen Sie die Bestapproximation im $L^2$-Sinne an $f(x) = bold(e)^x$ auf
    $[-1, 1]$ im Raum $S = "span"{L_0(x), L_1(x), L_2(x)}$. Dabei bezeichne
    $L_j(x)$ für $j = 0, 1, 2$ das $j$-te Legendre-Polynom. Geben Sie die
    Koeffizienten der Bestapproximation in dieser Basis von $S$ an.

  + Zeigen Sie, dass die Legendre-Polynome $L_n$ für alle $n in NN_0$ der
    folgenden Differentialgleichung genügen
    $
      (1 - x^2) y''(x) - 2x y'(x) + n(n + 1) y(x) = 0.
    $
    Betrachten Sie dazu die Funktion $g(x) = (x^2 - 1)^n$ und verwenden Sie die
    Leibnizregel zur Bestimmung von höheren Ableitungen eines Produktes, um auf
    beiden Seiten der Gleichung
    $
      (x^2 - 1) g'(x) = 2n x g(x)
    $
    die $(n + 1)$-te Ableitung zu bilden.
]

=== Lösung

+ Aus _Korollar 2.32_ folgen die Koeffizienten der Gauß'schen Bestapproximations
  Aufgabe mittels Legendre-Polynomen als:
  $
    alpha_j = ((L_j, f))/norm(L_j)_(L^2([-1, 1]))^2
  $

  Für $L_0 = 1$ mit $norm(L_0)_(L^2([-1,1]))^2 = integral_(-1)^1 1 dif x = 2$
  ergibt sich:
  $
    (L_0, f) & = integral_(-1)^1 e^x dif x \
             & = [e^x]_(-1)^1 \
             & = e - e^(-1) \
             & = (e^2 - 1)/e,
  $
  also
  $
    alpha_0 = (e^2 - 1)/(2e).
  $

  Für $L_1 = x$ mit
  $
    norm(L_1)_(L^2([-1, 1]))^2 = integral_(-1)^1 x^2 dif x = [1/3 x^3]_(-1)^1 = 2/3
  $
  und (via Integration durch Teile)
  $
    (L_1, f) & = integral_(-1)^1 x e^x dif x \
             & = [x e^x - e^x]_(-1)^1 \
             & = (e - e) - (-e^(-1) - e^(-1)) \
             & = 2/e,
  $
  ergibt sich
  $
    alpha_1 = (2 slash e)/(2 slash 3) = 3/e.
  $

  Für $L_2 = 1/2 (3x^2 - 1)$ berechnen wir
  $
    norm(L_2)_(L^2([-1, 1]))^2
    = 1/4 integral_(-1)^1 (3x^2 - 1)^2 dif x
    = 1/4 integral_(-1)^1 (9x^4 - 6x^2 + 1) dif x
    = 1/4 [9/5 x^5 - 2x^3 + x]_(-1)^1
    = 1/4 dot 8/5 = 2/5.
  $
  Nutzen wir das $integral x^2 e^x dif x = (x^2 - 2x + 2) e^x + C$:
  $
    (L_2, f) & = 1/2 integral_(-1)^1 (3x^2 - 1) e^x dif x \
             & = 1/2 lr([3(x^2 - 2x + 2) e^x - e^x]_(-1)^1) \
             & = 1/2 lr([(3x^2 - 6x + 5) e^x]_(-1)^1) \
             & = 1/2 ((3 - 6 + 5) e - (3 + 6 + 5) e^(-1)) \
             & = 1/2 (2e - 14 e^(-1)) = e - 7/e = (e^2 - 7)/e,
  $
  also
  $
    alpha_2 = ((e^2 - 7) slash e)/(2 slash 5) = (5(e^2 - 7))/(2e).
  $


+ Sei $g(x) = (x^2 - 1)^n$. Mit der Kettenregel ergibt sich
  $
    g'(x) = 2n x (x^2 - 1)^(n - 1),
  $
  und Multiplikation mit $(x^2 - 1)$ liefert die im Hinweis angegebene Identität
  $
    (x^2 - 1) g'(x) = 2n x (x^2 - 1)^n = 2n x g(x).
  $
  Wir bilden nun auf beiden Seiten die $(n + 1)$-te Ableitung mittels der
  Leibnizregel
  $
    (u v)^((m)) = sum_(k = 0)^m binom(m, k) u^((k)) v^((m - k)).
  $
  Da $(x^2 - 1)$ ein Polynom vom Grad $2$ ist, verschwinden alle Ableitungen
  $(x^2 - 1)^((k)) = 0$ für $k >= 3$, und für den Faktor $x$ gilt analog
  $x^((k)) = 0$ für $k >= 2$. Für die linke Seite erhalten wir:
  $
    ((x^2 - 1) g'(x))^((n + 1))
    & = (x^2 - 1) g^((n + 2)) + binom(n + 1, 1) dot 2x dot g^((n + 1))
    + binom(n + 1, 2) dot 2 dot g^((n)) \
    & = (x^2 - 1) g^((n + 2)) + 2(n + 1) x g^((n + 1)) + n(n + 1) g^((n)),
  $

  Für die rechte Seite folgt
  $
    (2n x g(x))^((n + 1)) = 2n x g^((n + 1)) + 2n (n + 1) g^((n)).
  $
  Somit folgt
  $
    (1 - x^2) g^((n + 2)) - 2x g^((n + 1)) + n(n + 1) g^((n)) = 0.
  $
  Aus der Vorlesung kennen wir die folgende darstellung von $L_n$:
  $
    L_n (x) = 1/(2^n n!) g^((n))(x),
  $
  Somit folgt
  $
    (1 - x^2) L_n^'' (x) - 2x L_n^' (x) + n(n + 1) L_n(x) = 0.
  $

#pagebreak()

#let p_samples = (
  (3.3334, 1.630, 0.8657, 0.4323, 0.2646, 0.1699, 0.1146),
  (0.482, 1.034, 2.027, 4.247, 7.164, 11.48, 17.60),
)

#let v_samples = (
  (0.197, 0.139, 0.068, 0.0427, 0.027, 0.015, 0.009, 0.008),
  (21.5, 21, 19, 16.5, 14.5, 11, 8.5, 7),
)


#exercise([Ausgleichprobleme], [5])[
  + In folgender Tabelle wurde der Druck $p$ (in kp/cm²) eines gesättigten
    Dampfes in Abhängigkeit vom speziefischen Volumen $v$ (in m³/kp) gemessen.
    Die Modellierung lässt dabei auf einen funktionalen Zusammenhang der Form
    $p = f(v) = 1\/(a v + b)$ schließen. Bestimmen Sie die Parameter
    $a, b in RR$, sodass $f$ eine Kleinste-Quadrate-Approximation an die
    experimentell bestimmte Tabelle ist.

    #figure(
      table(
        columns: 8,
        align: center,
        $v$, ..p_samples.at(0).map(v => $#v$),
        $p$, ..p_samples.at(1).map(p => $#p$),
      ),
    )

  + Die _Michaelis-Menten_ Gleichung tritt in der chemischen Kinetik auf und hat
    die Form
    $
      v([S]) = frac(v_"max" [S], K_M + [S]).
    $
    Bestimmen Sie die beiden Konstanten $v_"max"$ und $K_M$, sodass die obige
    Funktion $v([S])$ eine Kleinste-Quadrate-Approximation bezüglich der
    experimentell bestimmten Tabelle darstellt. (Dabei bezeichnet $v$ die
    Geschwindigkeiten einer enzymkatalysierten Reaktion bei verschiedenen
    Substratkonzentrationen $[S]$.)

    #figure(
      table(
        columns: 9,
        align: center,
        $[S]$, ..v_samples.at(0).map(s => $#s$),
        $v$, ..v_samples.at(1).map(v => $#v$),
      ),
    )

    _Hinweis._ Für beide Aufgabenteile bietet es sich an mit modifizierten
    Datensätzen zu rechnen. Sie dürfen diese neuen Datensätze mit einem
    Computeralgebrasystem bestimmen (dabei ist auf 4 Ziffern zu runden). Auch
    das zugehörige Kleinste-Quadrate Problem darf numerisch gelöst werden.
]

=== Lösung

Wählen wir uns zunächst den Funktionen Raum $S := P_1$ also der Raum der Polynom
mit Grad $<= 1$. Als Basis auf diesen Raum wählen wir ${1, x}$.

#let basis = (x => 1, x => x)
#let dot(u, v) = u.zip(v).map(((a, b)) => a * b).sum()

#let gram-matrix(basis, x) = basis.map(phi_i => basis.map(phi_j => dot(
  x.map(phi_i),
  x.map(phi_j),
)))

#let rhs-vector(phi, x, y) = phi.map(fi => dot(y, x.map(fi)))

#let det2(m) = m.at(0).at(0) * m.at(1).at(1) - m.at(1).at(0) * m.at(0).at(1)

#let inv2(m) = {
  let d = det2(m)
  (
    (m.at(1).at(1) / d, -m.at(0).at(1) / d),
    (-m.at(1).at(0) / d, m.at(0).at(0) / d),
  )
}

#let solve2(A, b) = {
  let Ai = inv2(A)
  (dot(Ai.at(0), b), dot(Ai.at(1), b))
}

+ Bemerken wir zunächst das $f(v)$ nicht in $S$ liegt. Betrachten wir jedoch
  $1/p$ so liegt dies sehrwohl in $P_1$. Transformieren wir nun unseren
  Datensatz mit der annamhe $tilde(p) = 1/p$ so folgt:

  #let xs = p_samples.at(0)
  #let ys = p_samples.at(1).map(y => 1 / y)

  #figure(
    {
      show table: format-table()
      table(
        columns: 8,
        align: center,
        $v$, ..xs.map(x => [#x]),
        $tilde(p)$, ..ys.map(y => [#num(y)]),
      )
    },
    caption: [Transformierter Datensatz.],
  )

  Die Bestapproximation von $tilde(p)$ in $S$ ergibt sich als:

  #let solution = solve2(gram-matrix(basis, xs), rhs-vector(
    basis,
    xs,
    ys,
  ))

  $
    tilde(p) = a v + b approx #num(solution.at(1)) x + #num(solution.at(0))
  $

  #figure(
    cetz.canvas({
      plot.plot(
        size: (10, 3),
        x-label: $v$,
        y-label: rotate(90deg, reflow: true, $tilde(p)$),
        y-tick-step: 0.5,
        {
          plot.add(
            mark: "o",
            style: (stroke: none),
            xs.zip(ys),
          )
          plot.add(domain: (0, 4), x => solution.at(0) + solution.at(1) * x)
        },
      )
    }),
    caption: [Bestapproximation in $P_1$ des modifizierten Datensatzes.],
  )

  Transformieren wir wieder zurück, also $p = 1/tilde(p)$ so erhalten wir:

  #figure(
    cetz.canvas({
      plot.plot(
        size: (10, 3),
        x-label: $v$,
        y-label: rotate(90deg, reflow: true)[$p$],
        y-tick-step: 10,
        y-min: -2.5,
        y-max: 25,
        {
          plot.add(
            mark: "o",
            style: (stroke: none),
            p_samples.at(0).zip(p_samples.at(1)),
          )
          plot.add(domain: (0.05000001, 4), samples: 100, x => (
            1 / (solution.at(0) + solution.at(1) * x)
          ))
        },
      )
    }),
    caption: [Kleinste-Quadrate-Approximation $p = 1/(a v + b)$ des
      Datensatzes.],
  )

+ Bemerken wir zunächst, dass $v([S])$ nicht in $P_1$ liegt. Transformieren wir
  jedoch den Datensatz mit $tilde(S) := 1/[S]$ und $tilde(v) := 1/v$ so folgt:

  #let xs = v_samples.at(0).map(x => 1 / x)
  #let ys = v_samples.at(1).map(y => 1 / y)

  Der modifizierte Datensatz ist somit:
  #figure(
    {
      show table: format-table()
      table(
        columns: 9,
        align: center,
        $tilde(S)$, ..xs.map(x => [#num(x)]),
        $tilde(v)$, ..ys.map(y => [#num(y)]),
      )
    },
    caption: [Transformierter Datensatz.],
  )

  Kehren wir beide Seiten der _Michaelis-Menten_ Gleichung um, so erhalten wir
  $
    1/v = frac(K_M + [S], v_"max" [S]) = frac(K_M, v_"max") tilde(S) + 1/v_"max",
  $
  also eine lineare Funktion in $tilde(S)$. Damit liegt $tilde(v)$ in $P_1$ und
  die Bestapproximation ergibt sich als:

  #let solution = solve2(gram-matrix(basis, xs), rhs-vector(
    basis,
    xs,
    ys,
  ))

  $
    tilde(v) = frac(K_M, v_"max") tilde(S) + 1/v_"max" approx #num(solution.at(1)) tilde(S) + #num(solution.at(0))
  $

  #figure(
    cetz.canvas({
      plot.plot(
        size: (10, 3),
        x-label: $tilde(S)$,
        y-label: rotate(90deg, reflow: true, $tilde(v)$),
        y-max: 0.16,
        y-tick-step: 0.025,
        {
          plot.add(
            mark: "o",
            style: (stroke: none),
            xs.zip(ys),
          )
          plot.add(domain: (0, 140), x => solution.at(0) + solution.at(1) * x)
        },
      )
    }),
    caption: [Bestapproximation in $P_1$ des modifizierten Datensatzes.],
  )

  #let v_max = 1 / solution.at(0)
  #let K_M = solution.at(1) * v_max

  Aus den Koeffizienten
  $
    alpha_0 = 1/v_"max" "und" alpha_1 = K_M/v_"max"
  $
  ergibt sich
  $
    v_"max" = 1/alpha_0 approx #num(v_max)
    "und" K_M = alpha_1 v_"max" approx #num(K_M).
  $
  Transformieren wir wieder zurück, also $v = 1/tilde(v)$ und
  $[S] = 1/tilde(S)$, so erhalten wir:

  #figure(
    cetz.canvas({
      plot.plot(
        size: (10, 3),
        x-label: $[S]$,
        y-label: rotate(90deg, reflow: true, $v$),
        y-max: 25,
        y-tick-step: 5,
        {
          plot.add(
            mark: "o",
            style: (stroke: none),
            v_samples.at(0).zip(v_samples.at(1)),
          )
          plot.add(domain: (0, 0.225), s => v_max * s / (K_M + s))
        },
      )
    }),
    caption: [Kleinste-Quadrate-Approximation der _Michaelis-Menten_
      Gleichung.],
  )

#pagebreak()

#exercise([Numerische Integration], [5])[
  + Beweisen Sie die folgende Fehlerabschätzung für die Quadratur mit der
    Trapezregel. Es sei $f in C^2([a, b])$, dann ist die Trapezregel
    $T(f) := 1/2 (b - a)(f(a) + f(b))$ von Ordnung 2 und es gilt für
    $I(f) := integral_a^b f(x) dif x$ und eine Zwischenstelle $xi in (a, b)$,
    dass
    $
      I(f) - T(f) = -(b - a)^3 / 12 f''(xi).
    $

    _Hinweis._ Betrachten Sie $integral_a^b f(x) q''(x) dif x$ mit $q''(x) = 1$
    für ein quadratisches Polynom $q$ und wenden Sie partielle Integration an.

  + Es seien $h := (b - a) \/ 3$ sowie $x_1 = a + h$ und $x_2 = b$ gegeben.
    Bestimmen Sie die maximale Ordnung der Quadraturformel
    $
      integral_a^b f(x) dif x approx 9/4 h f(x_1) + 3/4 h f(x_2).
    $
]

=== Lösung
