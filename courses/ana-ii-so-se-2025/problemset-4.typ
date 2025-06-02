#import "common.typ": *

#show: problemset(4)

#exercise([30 = 10 + 10 + 10])[
  Sei $f: RR -> RR$ eine Funktion. Sei $x_0 in RR$ und $(x_n) in RR^NN$ (soweit
  möglich) rekursiv definiert durch
  $
    x_n := N(x_(n-1)) #h(1em) "mit" #h(1em) N(x) := x - f(x) / (f'(x)).
  $
  Falls man $(x_n)$ tatsächlich definieren kann, $(x_n)$ konvergiert und für
  $xi := lim_(n->infinity) x_n$ gilt $xi = N(xi)$, dann ist $xi in RR$ eine
  Nullstelle von $f$, das heißt $f(xi) = 0$. Das nennt man das Newton-Verfahren.

  In dieser Übung finden wir hinreichende Bedingungen dafür, dass dieses
  Verfahren tatsächlich funktioniert.
  + Sei $f: RR -> RR$ zweimal stetig differenzierbar und $xi in RR$ eine
    Nullstelle von $f$. Sei $R > 0$ und $I := [xi - R, xi + R]$, so dass für
    alle $x in I$ gilt
    $
      f'(x) != 0 #h(1em) "und" #h(1em) abs(N'(x)) < 1.
    $
    Zeigen Sie, dass

    + $N(I) subset.eq I$ und
    + $N|_I : I -> I$ eine Kontraktion ist.

    Folgern Sie, dass das Newton-Verfahren für $x_0 in I$ gegen $xi$
    konvergiert.

    *Bemerkung.* Ohne die Voraussetzung $xi in I$ und $f(xi) = 0$, gilt (1.a)
    ggf. nicht und damit kann der Banachsche Fixpunktsatz nicht angewendet
    werden. Mit etwas mehr Arbeit reicht es aber, ein $xi in RR$ zu finden, so
    dass $f(xi)$ fast verschwindet, und etwas mehr an $N'(x)$ zu fordern.
  + Sei $c >= 0$. Sei $f: RR -> RR$ definiert durch
    $
      f(x) = x^3 - c.
    $
    Wie groß kann $R > 0$ sein, so dass für alle
    $x in I = [root(3, c) - R, root(3, c) + R]$ gilt
    $
      f'(x) != 0 #h(1em) "und" #h(1em) abs(N'(x)) <= 1 / 2 ?
    $
]

*Beweis:*

+ *Teil (a) und (b):* Sei $q := sup{abs(N'(x)) : x in I} < 1$ nach
  Voraussetzung. Da $N'$ stetig ist und $I$ kompakt, wird das Supremum
  angenommen.

  Für beliebige $x, y in I$ folgt aus dem Mittelwertsatz der
  Differentialrechnung: Es gibt ein $theta in [x, y]$ (bzw. $[y, x]$) mit
  $
    abs(N(x) - N(y)) = abs(N'(theta)) dot abs(x - y) <= q dot abs(x - y).
  $
  Somit ist $N|_I : I -> I$ Lipschitz-stetig mit Lipschitz-Konstante $q < 1$,
  d.h. eine Kontraktion.

  Für $N(I) subset.eq I$: Da $xi$ eine Nullstelle von $f$ ist, haben wir
  $f(xi) = 0$, also $N(xi) = xi - f(xi) / f'(xi) = xi - 0 / f'(xi) = xi$. Das
  heißt, $xi$ ist ein Fixpunkt von $N$.

  Für beliebiges $x in I$ gilt:
  $
    abs(N(x) - xi) = abs(N(x) - N(xi)) <= q dot abs(x - xi) <= q dot R < R.
  $
  Also $N(x) in [xi - R, xi + R] = I$, somit $N(I) subset.eq I$.

  Nach dem Banachschen Fixpunktsatz konvergiert die Folge $(x_n)$ für jeden
  Startwert $x_0 in I$ gegen den eindeutigen Fixpunkt $xi$ von $N|_I$.

+ Für $f(x) = x^3 - c$ haben wir $f'(x) = 3x^2$ und $xi = root(3, c)$ (da
  $f(xi) = 0$).

  Die Newton-Funktion ist:
  $
    N(x) = x - (x^3 - c) / (3x^2) = x - x / 3 + c / (3x^2) = (2x) / 3 + c / (3x^2).
  $

  Die Ableitung ist:
  $
    N'(x) = 2 / 3 - (2c) / (3x^3) = 2 / 3(1 - c / x^3).
  $

  Wir benötigen $abs(N'(x)) <= 1 / 2$ für alle
  $x in I = [root(3, c) - R, root(3, c) + R]$.

  Das ist äquivalent zu:
  $
    abs(2 / 3(1 - c / x^3)) <= 1 / 2
  $
  $
    abs(1 - c / x^3) <= 3 / 4
  $
  $
    -3 / 4 <= 1 - c / x^3 <= 3 / 4
  $
  $
    1 / 4 <= c / x^3 <= 7 / 4
  $

  Für $x in I$ mit $x > 0$ (was für $c > 0$ und hinreichend kleine $R$ gilt):
  $
    1 / 4 <= c / x^3 <= 7 / 4
  $
  $
    (4c) / 7 <= x^3 <= 4c
  $
  $
    root(3, (4c) / 7) <= x <= root(3, 4c)
  $

  Damit $I subset.eq [root(3, (4c) / 7), root(3, 4c)]$, benötigen wir:
  $
    root(3, c) - R >= root(3, (4c) / 7) #h(1em) "und" #h(1em) root(3, c) + R <= root(3, 4c)
  $

  Dies gibt uns:
  $
    R <= min{root(3, c) - root(3, (4c) / 7), root(3, 4c) - root(3, c)}
  $
  $
    R <= min{root(3, c)(1 - root(3, 4 / 7)), root(3, c)(root(3, 4) - 1)}
  $

  Da $root(3, 4) - 1 approx 0.587$ und $1 - root(3, 4 / 7) approx 0.176$, ist
  das Minimum durch den zweiten Term gegeben:
  $
    R <= root(3, c)(1 - root(3, 4 / 7)).
  $

  Zusätzlich müssen wir sicherstellen, dass $f'(x) = 3x^2 != 0$ für alle
  $x in I$. Das ist erfüllt, solange $0 in.not I$, d.h. $root(3, c) - R > 0$,
  also $R < root(3, c)$.

  Daher ist die maximale Wahl:
  $
    R = root(3, c)(1 - root(3, 4 / 7)) = root(3, c)(1 - (4 / 7)^(1 / 3)).
  $


#pagebreak()

#exercise([20 = 10 + 10])[
  Betrachten Sie die Beweisskizze von Satz 6.10 aus der Vorlesung.
  + Zeigen Sie, dass $iota(X) subset.eq overline(X)$ dicht ist.
  + Zeigen Sie, dass $overline(X)$ vollständig ist.

  Tipps finden Sie im Skript.
]
