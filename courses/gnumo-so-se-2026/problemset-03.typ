#import "common.typ": *

#import "@preview/zero:0.6.1": format-table, num, set-num

#show: problemset("3")

#exercise([Extrapolation nach Richardson], [5])[
  Aus der Analysis ist die Formel $bold(e) := lim_(h -> 0) (1 + h)^(1\/h)$
  bekannt. Runden Sie ihre Ergebnisse in den gesamten Teilaufgaben bitte stets
  auf 4 geltende Ziffern.

  + Bestimmen Sie für $h = 0.08$, $h = 0.04$ und $h = 0.02$ Approximationen an
    $bold(e)$ durch $E(h) = (1 + h)^(1\/h)$.

  + Bestimmen Sie die Extrapolation zum Limes $h arrow.br 0$, indem Sie das
    zugehörige quadratische Interpolationspolynom $p(x)$ zu den Werten aus
    Teilaufgabe (a), beginnend mit $x_0 = 0.08$ und dann absteigend, mittels des
    Neville Schemas für $p(0)$ auswerten. (Geben Sie das zugehörige Tableau an!)

  + Vergleichen Sie ihr Ergebnis aus (b) mit der Approximation an $bold(e)$ für
    $h = 0.001$ aus (a). Bestimmen Sie dazu den relativen Fehler in beiden
    Fällen unter der Annahme $bold(e) = 2.71828$. Erscheint die Extrapolation
    zum Limes für das gegebene Beispiel sinnvoll?
]

=== Lösung:

#set-num(round: (mode: "figures", precision: 4), exponent: (sci: 3))
#let E(h) = calc.pow(1 + h, 1 / h)
#let e_approx = 2.71828

#let xs = (0.08, 0.04, 0.02)
#let ys = xs.map(E)

#let neville(xs, ys, xi) = {
  let n = xs.len()
  let p = ys.enumerate().map(((i, y)) => (..(0,) * i, y, ..(0,) * (n - i - 1)))
  for l in range(1, n) {
    for k in range(0, n - l) {
      let q = (
        (p.at(k + 1).at(k + l) - p.at(k).at(k + l - 1))
          / (xs.at(k + l) - xs.at(k))
      )
      p.at(k).at(k + l) = p.at(k).at(k + l - 1) + (xi - xs.at(k)) * q
    }
  }
  p
}

#let tab = neville(xs, ys, 0)
#let approx_richadson = tab.at(0).at(2)

+ Wir erhalten folgende Werte:
  #figure(
    {
      show table: format-table(none, auto, auto, auto)
      table(
        columns: 4,
        align: center,
        [$h$], ..xs.map(x => $#x$),
        [$E(h)$], ..ys.map(y => [#y]),
      )
    },
    caption: [Approximationen $E(h)$ an $bold(e)$.],
  )

+ #figure(
    {
      show table: format-table(none, auto, auto, auto, auto)
      table(
        columns: 5,
        [i], [$x = h$], [$P_(i,0)$], [$P_(i,1)$], [$P_(i,2)$],
        ..xs
          .enumerate()
          .map(((i, x)) => ([#i], [$#x$], ..tab.at(i).map(str)))
          .flatten(),
      )
    },
    caption: [Neville-Tableau zur Auswertung $p(0)$],
  )

+ #let h_fine = 0.001
  #let err_direct = calc.abs((e_approx - E(h_fine)) / e_approx)
  #let err_richardson = calc.abs((e_approx - approx_richadson) / e_approx)

  Für $h = #h_fine$ folgt
  $ E(h) = #num(E(h_fine)). $

  Damit ergeben sie die relativen Fehler
  $
    abs(bold(e) - P(0, 2)) / abs(bold(e)) approx #num(err_richardson), quad
    abs(bold(e) - E(h)) / abs(bold(e)) approx #num(err_direct).
  $

  Der relative Fehler der Extrapolation ist um eine Größenordnung kleiner, das
  Verfahren erscheint hier also sinnvoll.

#pagebreak()

#exercise([Kubische Splines], [5])[
  + Welche Eigenschaften eines natürlichen kubischen Splines besitzt die
    folgende Funktion und welche nicht?
    $
      f(x) = cases(
        (x + 1) + (x + 1)^3 & "für" x in [-1, 0]\,,
        4 + (x - 1) + (x - 1)^3 & "für" x in (0, 1].
      )
    $

  + Man bestimme alle Koeffizienten $a, b, c, d, e in RR$, sodass die folgende
    Funktion ein kubischer Spline ist
    $
      g(x) = cases(
        a (x - 2)^2 + b (x - 1)^3 & "für" x in (-infinity, 1]\,,
        c (x - 2)^2 & "für" x in (1, 3)\,,
        d (x - 2)^2 + e (x - 3)^3 & "für" x in [3, infinity).
      )
    $

  + Für welche Koeffizienten $a, b, c, d, e in RR$ interpoliert der kubische
    Spline $g(x)$ die Paare
    $
      (x_0, y_0) = (0, 26), quad (x_1, y_1) = (1, 7) quad "und" quad
      (x_2, y_2) = (4, 25)?
    $
    Ist die Lösung eindeutig bestimmt?
]

=== Lösung:

+ #set enum(numbering: "1.")
  + *Stückweise $P_3$*: $checkmark$
  + *Natürliche Randbedingungen*: $checkmark$
    $
      f''(-1) = 6(-1 + 1) = 0 = 6(1 - 1) = f''(1)
    $
  + *$f in C^2([-1, 1])$*:
    $
      & f(-0) = 2 = f(+0) quad           & checkmark \
      & f'(-0) = 4 = f'(+0) quad         & checkmark \
      & f''(-0) = 6 != -6 = f''(+0) quad & crossmark
    $

    Also gilt $f in C^1([-1,1])$, aber $f in.not C^2([-1,1])$.

+ Kubische Splines sind $C^2$, somit müssen die Teilpolynome an den Stützstellen
  für $k = 0, .., 2$ übereinstimmen.

  Für $k = 0$ folgt
  $
    lim_(x arrow.tr 1) g(x) = a = c = lim_(x arrow.br 1) g(x)
    and
    lim_(x arrow.tr 3) g(x) = c = d = lim_(x arrow.br 3) g(x),
  $
  also folgt $a = c = d$

  Für $k = 1$ folgt
  $
    lim_(x arrow.tr 1) g'(x) = -2a = -2c = lim_(x arrow.br 1) g'(x)
    and
    lim_(x arrow.tr 3) g'(x) = 2c = 2d = lim_(x arrow.br 3) g'(x),
  $
  also folgt $a = c = d$ wiederum.

  Für $k = 2$ folgt
  $
    lim_(x arrow.tr 1) g''(x) = 2a = 2c = lim_(x arrow.br 1) g''(x)
    and
    lim_(x arrow.tr 3) g''(x) = 2c = 2d = lim_(x arrow.br 3) g''(x),
  $
  also folgt $a = c = d$ wiederum.

  Also ist $a = c = d$ fest und $b, e in RR$ frei wählbar.

+ Wir setzen die Interpolationsbedingungen ein. Da $x_0 = 0 in (-infinity, 1]$,
  $x_1 = 1 in (-infinity, 1]$ und $x_2 = 4 in [3, infinity)$, gilt
  $
    g(0) & = a(0 - 2)^2 + b(0 - 1)^3 = 4a - b && attach(=, t: !) 26, \
    g(1) & = a(1 - 2)^2 + b(1 - 1)^3 = a      && attach(=, t: !) 7, \
    g(4) & = d(4 - 2)^2 + e(4 - 3)^3 = 4d + e && attach(=, t: !) 25.
  $

  Aus der zweiten Gleichung folgt $a = 7$ und mit Teilaufgabe (b) somit
  $a = c = d = 7$. Einsetzen in die erste und dritte Gleichung liefert
  $
    b = 4a - 26 = 28 - 26 = 2, quad
    e = 25 - 4d = 25 - 28 = -3.
  $

  Insgesamt erhalten wir also
  $
    a = c = d = 7, quad b = 2, quad e = -3.
  $

  Da die Spline-Bedingungen aus (b) bereits $a = c = d$ erzwingen und somit nur
  noch drei freie Parameter $a, b, e$ verbleiben, sind diese durch die drei
  Interpolationsbedingungen eindeutig festgelegt. Die Lösung ist somit
  *eindeutig bestimmt*.

#pagebreak()

#exercise([Interpolationsfehler kubischer Splines], [5])[
  Für $f in C^2([a, b])$, eine Zerlegung $a = x_0 < x_1 < dots < x_n = b$ des
  Intervalls $[a, b]$ und den interpolierenden natürlichen kubischen Spline
  $s in S_h^(3,2)([a, b])$ mit $f(x_j) = s(x_j)$ für $j = 0, dots, n$ und
  $s''(a) = 0 = s''(b)$ gilt
  $
    norm(f^((k)) - s^((k)))_(L^2([a,b])) <= C_"PF"^(2-k) h_max^(2-k)
    norm(f'')_(L^2([a,b])) quad "für" k = 0, 1, 2.
  $
  Dabei sei $h_max := max{x_j - x_(j-1) : j = 1, dots, n}$ die maximale
  Netzweite der Zerlegung und $C_"PF"$ die beste Konstante, sodass folgende
  Abschätzungen (die nicht mehr zu beweisen sind) für beliebige Intervalle
  $[alpha, beta]$ gelten
  $
    norm(g)_(L^2([alpha,beta])) <= C_"PF" abs(beta - alpha)
    norm(g')_(L^2([alpha,beta]))
    quad "für alle" g in C^1([alpha, beta]) "mit" g(alpha) = 0 = g(beta),
  $
  $
    norm(g)_(L^2([alpha,beta])) <= C_"PF" abs(beta - alpha)
    norm(g')_(L^2([alpha,beta]))
    quad "für alle" g in C^1([alpha, beta]) "mit" integral_alpha^beta g(x) dif x = 0.
  $
]

=== Lösung:

#let l2(x, a: $alpha$, b: $beta$) = $||#x||_(L^2([#a, #b]))$
#let l2square(x, a: $alpha$, b: $beta$) = $||#x||^2_(L^2([#a, #b]))$
#let l2innerp(x, y) = $chevron.l #x, #y chevron.r_(L^2([alpha, beta]))$

Definieren wir zunächst $e := f - s$

*Fall $k = 2$:*

Betrachten wir zunächst den Fall $k = 2$ so vereinfacht sich die Abschätzungen
zu
$
  l2(f^''- s^'') <= l2(f'').
$

So folgt
$
  l2square(f'') & = l2square(f'' - s'' + s'') \
                & = l2square(underbrace(f'' - s'', = e'') + s'') \
                & = l2square(e'') + 2 l2innerp(e'', s'') + l2square(s'')
$

Wäre jetzt $l2innerp(e'', s'') = 0$ dann hätten wir unsere Aussage.

$
  l2innerp(e'', s'') & = integral_alpha^beta e'' s'' d x \
  & = sum_(i = 0)^(n-1) integral_(x_i)^(x_(i+1)) e'' s'' d x \
  & attach(=, t: text("P.I.")) sum_(i = 0)^(n-1) (
    [e' s'']_(x_i)^(x_(i+1)) - integral_(x_i)^(x_(i+1)) e' s''' d x
  ) \
  & attach(=, t: text("P.I.")) sum_(i = 0)^(n-1) (
    [e' s'']_(x_i)^(x_(i+1)) - [e s''']_(x_i)^(x_(i + 1))
    + underbrace(
      integral_(x_i)^(x_(i+1)) e s'''' d x, = 0 "da"
      s in P_3
    )
  ) \
  &= sum_(i = 0)^(n-1) e'(x_(i+1)) s''(x_(i+1)) - e'(x_i) s''(x_i)
  - sum_(i = 0)^(n-1) (e(x_(i+1)) s'''(x_(i+1)) - e(x_i) s'''(x_i)) \
  &= e'(beta) underbrace(s''(beta), = 0) - e'(alpha) underbrace(s''(alpha), = 0)
  - sum_(i = 0)^(n-1) (
    underbrace(e(x_(i+1)), = 0) s'''(x_(i+1))
    - underbrace(e(x_i), = 0) s'''(x_i)
  ) \
  &= 0 quad checkmark.
$

*Fall $k = 1$:*

#let l2i(x) = l2(x, a: $x_i$, b: $x_(i+1)$)
#let l2isquare(x) = l2square(x, a: $x_i$, b: $x_(i+1)$)

Da $s$ den Funktionswert von $f$ in den Stützstellen interpoliert, gilt
$e(x_j) = f(x_j) - s(x_j) = 0$ für alle $j = 0, dots, n$. Damit folgt für jedes
Teilintervall $[x_i, x_(i+1)]$
$
  integral_(x_i)^(x_(i+1)) e'(x) dif x = e(x_(i+1)) - e(x_i) = 0,
$
also lässt sich die zweite Ungleichung lässt sich auf $g = e'$ anwenden:
$
  l2i(e') <= C_"PF" (x_(i+1) - x_i) l2i(e'') <= C_"PF" h_max l2i(e'').
$

Quadrieren und Aufsummieren über $i = 0, dots, n-1$ liefert
$
  l2square(e') = sum_(i=0)^(n-1) l2isquare(e')
  <= C_"PF"^2 h_max^2 sum_(i=0)^(n-1) l2isquare(e'')
  = C_"PF"^2 h_max^2 l2square(e'').
$

Mit dem Ergebnis aus dem Fall $k = 2$ folgt schließlich
$
  l2(f' - s') <= C_"PF" h_max l2(e'') <= C_"PF" h_max l2(f''). quad checkmark
$

*Fall $k = 0$:*

Wegen $e(x_i) = 0 = e(x_(i+1))$ auf jedem Teilintervall lässt sich die erste
Ungleichung auf $g = e$ anwenden:
$
  l2i(e) <= C_"PF" (x_(i+1) - x_i) l2i(e') <= C_"PF" h_max l2i(e').
$

Quadrieren und Aufsummieren liefert analog zum Fall $k = 1$
$
  l2square(e) <= C_"PF"^2 h_max^2 l2square(e').
$

Kombination mit dem Ergebnis aus dem Fall $k = 1$ ergibt
$
  l2(f - s) <= C_"PF" h_max l2(e') <= C_"PF"^2 h_max^2 l2(f''). quad checkmark
$
