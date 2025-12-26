#import "common.typ": *

#show: problemset("9")

#exercise([30 = 10 + 10 + 10])[
  + Sei $f : (0, 1)^2 -> RR$ definiert durch
    $
      f(x, y) := cases(
        x^(-2) quad & "wenn" y lt.eq x,
        -y^(-2) quad & "wenn" x < y.
      )
    $
    Zeigen Sie, dass $f in.not scr(L)^1 ((0, 1)^2, scr(B)((0, 1)^2), beta_2)$
    und berechnen Sie
    $
      integral_0^1 integral_0^1 f(x, y) dif x dif y quad
      "und" quad integral_0^1 integral_0^1 f(x, y) dif y dif x.
    $

  + Zeigen Sie, dass für alle $z, w in RR^2$ die Abbildung $[0, 1] -> CC$,
    $t |-> t^(z-1) (1-t)^(w-1)$ integrierbar ist.

  + Es seien $f, g in scr(L)^1 (RR^n, scr(B), beta_n)$. Die _Faltung_ $f * g$
    ist definiert als
    $
      (f * g)(x) = integral_(RR^n) f(y) g(x - y) dif y.
    $
    Zeigen Sie, dass $f * g in scr(L)^1 (RR^n, scr(B), beta_n)$
]

=== Lösung:

+ Berechnen wir zunächst
  $
    integral_0^1 integral_0^1 f(x, y) dif x dif y & = \
    integral_0^1 (integral_0^y f(x, y) dif x + integral_y^1 f(x, y) dif x) dif y &= \
    integral_0^1 (integral_0^y -y^(-2) dif x + integral_y^1 x^(-2) dif x) dif y &= \
    integral_0^1 (-y^(-1) + integral_y^1 x^(-2) dif x) dif y &= \
    integral_0^1 (-y^(-1) - x^(-1) bar_y^1) dif y &= \
    integral_0^1 (-y^(-1) - 1 + y^(-1)) dif y &= \
    - 1
  $
  Andersherum gilt allerdings dass,
  $
    integral_0^1 integral_0^1 f(x, y) dif y dif x & = \
    integral_0^1 (integral_0^x f(x, y) dif y + integral_x^1 f(x, y) dif y) dif x &= \
    integral_0^1 (integral_0^x x^(-2) dif y + integral_x^1 y^(-2) dif y) dif x &= \
    integral_0^1 (x^(-1) + integral_x^1 y^(-2) dif y) dif x &= \
    integral_0^1 (x^(-1) + y^(-1) bar_x^1) dif x &= \
    1
  $

  Der Satz von Fubini sagt uns aber, dass wenn $f in scr(L)^1 ((0, 1)^2,
    scr(B)((0, 1)^2), beta_2)$, dass die Integrale vertauscht werden können. Mit
  der Kontraposition folgt also $f in.not scr(L)^1 ((0, 1)^2, scr(B)((0,
        1)^2), beta_2)$.

+ Bemerken wir zunächst, dass für $z = a + b i$, $w = c + d i$ gilt, dass
  $
    overline(z w) = overline(a c - b d + (a d + b c)i)
    = a c - b d - (a d + b c)i = overline(z) dot overline(w),
  $
  und somit
  $
    abs(z w) = sqrt(z w overline(z w))
    = sqrt(z overline(z)) sqrt(w overline(w)) = abs(z) abs(w).
  $

  Zusätzlich gilt für $e^z$, dass
  $
    abs(e^z) = abs(e^(Re(z) + Im(z) i)) = abs(e^Re(z)) abs(e^(Im(z) i)) =
    abs(e^Re(z)) sqrt(e^0) = abs(e^(Re(z))).
  $

  Also folgt, dass

  $
    integral_0^1 abs(t^(z-1) (1-t)^(w-1)) dif t
    &= integral_0^1 abs(t^(z-1)) abs((1-t)^(w-1)) dif t \
    &= integral_0^1 abs(t^(Re(z)-1)) abs((1-t)^(Re(w)-1)) dif t \
    &<= integral_0^1 abs(t^(Re(z)-1)) abs(1^(Re(w)-1)) dif t \
    &= integral_0^1 abs(t^(Re(z)-1)) dif t \
    &= integral_0^1 t^(Re(z)-1) dif t \
    &= t^Re(z)/ Re(z) bar_0^1 < infinity
  $

+ Definieren wir $h(x) = abs((f * g)(x))$. Der Satz von Tonelli sagt uns, dass
  wenn $h in scr(M)^+(RR^(2n), RR^n times.o RR^n)$,
  $
    integral_(RR^n) abs(integral_(RR^n) f(x)g(y-x) dif x) dif y \
    &<= integral_(RR^n) integral_(RR^n) abs(f(x)g(y-x)) dif x dif y \
    &= integral_(RR^n) integral_(RR^n) abs(f(x))abs(g(y-x)) dif x dif y \
    &= integral_(RR^n) integral_(RR^n) abs(f(x))abs(g(y-x)) dif y dif x \
    &= integral_(RR^n) abs(f(x)) integral_(RR^n) abs(g(y-x)) dif y dif x \
    &= integral_(RR^n) abs(f(x)) integral_(RR^n) abs(g(z)) dif z dif x
  $
  Da $f,g in scr(L)^1 (RR^n, scr(B), beta_n)$, existieren $N, M in RR$, sodass
  $
    integral_(RR^n) abs(f(x)) dif x <= N, integral_(RR^n) abs(g(z)) dif z <= M.
  $

  Somit folgt, dass
  $
    integral_(RR^n) abs(f(x)) integral_(RR^n) abs(g(z)) dif z dif x
    &<= M integral_(RR^n) abs(f(x)) dif x \
    &<= M N < infinity
  $

#pagebreak()

#exercise([20 = 10 + 10])[
  + Zeigen Sie, dass für $phi in RR$ mit $|phi| < pi / 4$ die Funktion
    $
      x |-> exp(-e^(2 i phi) x^2)
    $
    zu $scr(L)^1 (RR, CC)$ gehört. Zeigen Sie, dass
    $
      F(phi) := integral_(-infinity)^infinity exp(-e^(2 i phi) x^2) dif x
      = sqrt(pi) e^(-i phi).
    $

  + Berechnen Sie für $a in RR$ die Integrale
    $
      integral_(-infinity)^infinity e^(-x^2) sin(a x^2) dif x,
      quad integral_(-infinity)^infinity e^(-x^2) cos(a x^2) dif x.
    $
]

=== Lösung:

+ Zeigen wir zunächst $scr(L)^1$. Wir schreiben
  $
    e^(2 i phi) = cos(2 phi) + i sin(2 phi).
  $
  Für $|phi| < pi / 4$ gilt $|2 phi| < pi / 2$, also $Re(e^(2 i phi)) = cos(
    2
    phi
  ) > 0$.

  Damit folgt
  $
    abs(exp(-e^(2 i phi) x^2))
    = exp(-Re(e^(2 i phi)) x^2)
    = exp(-cos(2 phi) x^2).
  $
  Da $cos(2 phi) > 0$ für $|phi| < pi / 4$, ist $exp(-cos(2 phi) x^2)$
  integrierbar über $RR$, denn
  $
    integral_(-infinity)^infinity exp(-cos(2 phi) x^2) dif x
    = sqrt(pi / cos(2 phi)) < infinity.
  $
  Also gehört $x |-> exp(-e^(2 i phi) x^2)$ zu $scr(L)^1 (RR, CC)$.

  Berechnen wir nun $F(phi)$. Verwenden wir die Substitution $y = e^(i phi)
  x$, dann ist $dif x = e^(-i phi) dif y$ und
  $
    F(phi) & = integral_(-infinity)^infinity exp(-e^(2 i phi) x^2) dif x \
           & = integral_(-infinity)^infinity exp(-(e^(i phi) x)^2) dif x \
           & = e^(-i phi) integral_(-infinity)^infinity exp(-y^2) dif y \
           & = e^(-i phi) sqrt(pi).
  $
  Bemerken wir, dass die Kontur des Integrals in der komplexen Ebene gedreht
  werden kann, solange $|phi| < pi / 4$, sodass der Integrand entlang der neuen
  Kontur exponentiell abfällt.

+ Verwenden wir die Euler-Formel:
  $
    e^(i a x^2) = cos(a x^2) + i sin(a x^2).
  $
  Damit gilt
  $
    integral_(-infinity)^infinity e^(-x^2) e^(i a x^2) dif x
    = integral_(-infinity)^infinity e^(-x^2) cos(a x^2) dif x
    + i integral_(-infinity)^infinity e^(-x^2) sin(a x^2) dif x.
  $

  Andererseits können wir schreiben
  $
    integral_(-infinity)^infinity e^(-x^2) e^(i a x^2) dif x
    &= integral_(-infinity)^infinity e^(-(1 - i a) x^2) dif x \
    &= integral_(-infinity)^infinity exp(-e^(2 i phi) x^2) dif x,
  $
  wobei $e^(2 i phi) = 1 - i a$. Aus $e^(2 i phi) = cos(2 phi) + i sin(2 phi)
  = 1 - i a$ folgt
  $
    cos(2 phi) = 1, quad sin(2 phi) = -a.
  $

  Allgemein gilt für $e^(2 i phi) = 1 - i a$, dass
  $
    e^(-i phi) = 1 / sqrt(e^(2 i phi)) = 1 / sqrt(1 - i a).
  $

  Mit der Formel aus Teil (a) erhalten wir
  $
    integral_(-infinity)^infinity e^(-(1 - i a) x^2) dif x
    = sqrt(pi) / sqrt(1 - i a)
    = sqrt(pi) / sqrt(sqrt(1 + a^2)) e^(-i / 2 arctan(-a))
    = sqrt(pi / sqrt(1 + a^2)) e^(i / 2 arctan(a)).
  $

  Bemerken wir, dass durch Rationalisierung $1 / sqrt(1 - i a) = sqrt(
    (1 + i
    a) / (1 + a^2)
  ) = (sqrt(1 + a^2) (cos(theta / 2) + i sin(theta / 2))) /
  sqrt(1 + a^2)$, wobei $theta = arctan(a)$.

  Somit gilt, dass
  $
    sqrt(pi / sqrt(1 + a^2)) (cos(arctan(a) / 2) + i sin(arctan(a) / 2))
    = integral_(-infinity)^infinity e^(-x^2) cos(a x^2) dif x
    + i integral_(-infinity)^infinity e^(-x^2) sin(a x^2) dif x.
  $

  Durch Vergleich von Real- und Imaginärteil folgt:
  $
    integral_(-infinity)^infinity e^(-x^2) cos(a x^2) dif x
    &= sqrt(pi / sqrt(1 + a^2)) cos(1 / 2 arctan(a)), \
    integral_(-infinity)^infinity e^(-x^2) sin(a x^2) dif x
    &= sqrt(pi / sqrt(1 + a^2)) sin(1 / 2 arctan(a)).
  $
