#import "common.typ": *

#show: problemset("12")

#set enum(numbering: "(1)")

#exercise([20 = 5 + 5 + 10])[
  Berechnen Sie die Faltungen $(f * g)(t)$

  + $
      f = bb(1)_([0,1]) (t), quad g(t) = cases(
        t quad & t in [0, 1],
        1 quad & t in (1, 2],
        0 quad & "sonst"
      )
    $

  + $
      f = bb(1)_([0,1]) (t), quad g(t) = cases(
        e^(-t) quad & t in [0, infinity),
        0 quad & "sonst"
      )
    $

  + $g(t) = f(t) = exp(-abs(t))$.
]

=== Lösung:

+ Da $f(tau) = 1$ nur für $tau in [0, 1]$, gilt
  $
    (f * g)(t) = integral_0^1 g(t - tau) dif tau = integral_(t-1)^t g(u) dif u.
  $
  Nun integrieren wir $g$ über das Intervall $[t-1, t]$ relativ zu den
  Knickstellen $0, 1, 2$. Ergebnis:
  $
    (f * g)(t) = cases(
      0\, quad & t <= 0,
      t^2 slash 2\, quad & 0 < t < 1,
      -t^2 slash 2 + 2t - 1\, quad & 1 <= t <= 2,
      3 - t\, quad & 2 < t < 3,
      0\, quad & t >= 3.
    )
  $

+ Der Integrand ist nur für $t - tau >= 0$ (also $tau <= t$) ungleich 0. Damit:

  - Für $t <= 0$: kein Beitrag $(arrow.r.double 0)$.
  - Für $0 < t < 1$: $tau in [0, t]$:
    $
      integral_0^t e^(-(t - tau)) dif tau = e^(-t) integral_0^t e^tau dif tau = 1 - e^(-t).
    $
  - Für $t >= 1$: $tau in [0, 1]$:
    $
      integral_0^1 e^(-(t - tau)) dif tau = e^(-t) integral_0^1 e^tau dif tau = (e - 1)e^(-t).
    $

  Also
  $
    (f * g)(t) = cases(
      0\, quad & t <= 0,
      1 - e^(-t)\, quad & 0 < t < 1,
      (e - 1)e^(-t)\, quad & t >= 1.
    )
  $

+ Da $e^(-abs(t))$ gerade ist, ist $(f * g)(t)$ ebenfalls gerade. Es genügt also
  die Berechnung für $t >= 0$.

  Wir teilen das Integral an den Knickpunkten $tau = 0$ und $tau = t$ auf:
  $
    (f * g)(t) = integral_(-infinity)^0 e^(-(abs(tau) + abs(t - tau))) dif tau
    + integral_0^t e^(-(abs(tau) + abs(t - tau))) dif tau
    + integral_t^infinity e^(-(abs(tau) + abs(t - tau))) dif tau.
  $

  Für $tau <= 0$: $abs(tau) + abs(t - tau) = -tau + (t - tau) = t - 2tau$, also
  $
    integral_(-infinity)^0 e^(-(t - 2tau)) dif tau
    = e^(-t) [1/2 e^(2tau)]_(-infinity)^0
    = 1/2 e^(-t).
  $

  Für $0 <= tau <= t$: $abs(tau) + abs(t - tau) = tau + (t - tau) = t$, also
  $
    integral_0^t e^(-t) dif tau = t e^(-t).
  $

  Für $tau >= t$: $abs(tau) + abs(t - tau) = tau + (tau - t) = 2tau - t$, also
  $
    integral_t^infinity e^(-(2tau - t)) dif tau
    = e^t [-1/2 e^(-2tau)]_t^infinity
    = 1/2 e^(-t).
  $

  Summieren ergibt für $t >= 0$: $(f * g)(t) = (1 + t) e^(-t)$.

  Durch Symmetrie:
  $
    #box(stroke: black, inset: 8pt, $(f * g)(t) = (1 + abs(t)) e^(-abs(t))$).
  $

#pagebreak()

#exercise([30 = 3 + 9 + 9 + 9])[
  Es sei $(ell^2 (RR), norm(dot)_2)$ der Banachraum aller Folgen
  $(x_i)_(i in NN) subset RR$ sodass $sum_(i in NN) abs(x_i)^2 < infinity$.

  + Zeigen Sie, dass $ell^2$ ein Hilbertraum ist, indem Sie ein geeignetes
    inneres Produkt $chevron.l dot, dot chevron.r$ finden, sodass
    $norm((x_i)_(i in NN))_2 = chevron.l (x_i)_(i in NN), (x_i)_(i in NN) chevron.r$.

  + Für jeden abgeschlossenen Untervektorraum $U subset ell^2 (RR)$ ist die
    orthogonale Projektion $P_U : ell^2 (RR) -> ell^2 (RR)$ definiert als
    $
      P_U (v) = sum_(i in NN) chevron.l v, b_i chevron.r b_i
    $
    wobei $(b_i)_(i in NN)$ eine Basis von $U$ ist. Zeigen Sie:

    + für alle $u, v in ell^2 (RR)$ gilt
      $chevron.l P_U (v), u chevron.r = chevron.l v, P_U (u) chevron.r$

    + Für alle $v in ell^2 (RR)$ gilt
      $norm(P_U (v) - v) = inf_(u in U) norm(u - v)$

    + Zeigen Sie, dass $P_U$ genau dann ein kompakter Operator ist, wenn $U$
      endlichdimensional ist.

      *Hinweis:* Ein linearer Operator $T : X -> Y$ heißt _kompakt_, wenn für
      jede beschränkte Folge $(x_n) subset X$ die Folge $(T x_n)$ eine
      konvergente Teilfolge besitzt.
]

=== Lösung:

+ Definieren wir das innere Produkt wiefolgt
  $
    chevron.l (x_i)_(i in NN), (y_i)_(i in NN) chevron.r := sum_(i in NN) x_i y_i
  $
  so folgt das
  $
    & chevron.l (x_i)_(i in NN), (y_i)_(i in NN) chevron.r = sum_(i in NN) x_i x_i \
    & = sum_(i in NN) x_i^2 \
    & = sum_(i in NN) abs(x_i)^2 \
    & = norm((x_i)_(i in NN))_2^2
  $

  #sym.suit.diamond.stroked

+ #linebreak()
  + Für alle $u, v in ell^2 (RR)$ folgt
    $
      chevron.l P_U(v), u chevron.r
      &= chevron.l sum_(i in NN) chevron.l v, b_i chevron.r b_i, u chevron.r
      = sum_(i in NN) chevron.l v, b_i chevron.r chevron.l b_i, u chevron.r \
      &= sum_(i in NN) chevron.l u, b_i chevron.r chevron.l v, b_i chevron.r
      = chevron.l sum_(i in NN) chevron.l u, b_i chevron.r b_i, v chevron.r \
      &= chevron.l P_U(u), v chevron.r
      = chevron.l v, P_U(u) chevron.r.
    $

    #sym.suit.diamond.stroked

  + Zunächst zeigen wir, dass $v - P_U(v) perp U$. Für jedes $b_j$ gilt:
    $
      chevron.l v - P_U(v), b_j chevron.r
      &= chevron.l v, b_j chevron.r - chevron.l sum_(i in NN) chevron.l v, b_i chevron.r b_i, b_j chevron.r \
      &= chevron.l v, b_j chevron.r - sum_(i in NN) chevron.l v, b_i chevron.r chevron.l b_i, b_j chevron.r \
      &= chevron.l v, b_j chevron.r - chevron.l v, b_j chevron.r = 0.
    $
    Da $(b_i)$ eine Basis von $U$ ist, folgt $v - P_U(v) perp U$.

    Sei nun $u in U$ beliebig. Dann ist $P_U(v) - u in U$, also
    $v - P_U(v) perp P_U(v) - u$. Mit dem Satz von Pythagoras:
    $
      norm(v - u)^2 & = norm((v - P_U(v)) + (P_U(v) - u))^2 \
                    & = norm(v - P_U(v))^2 + norm(P_U(v) - u)^2 \
                    & >= norm(v - P_U(v))^2.
    $
    Gleichheit gilt genau dann, wenn $u = P_U(v)$. Also
    $
      norm(v - P_U(v)) = inf_(u in U) norm(v - u).
    $

    #sym.suit.diamond.stroked

  + $=>$

    Angenommen $U$ ist nicht endlichdimensional, dann lässt sich eine Basis
    $(b_i)_(i in NN)$ wählen sodass $(b_i)_j = 1 "für" j <= i$. Die folge
    $(e_i)_(i in NN)$ mit $(e_i)_j = delta_(i j)$ ist selbst beschränkte, da
    $norm(e_i) = 1 forall i in NN$. Die folgt $P_U ((e_i))$ ist jedoch nicht
    beschränkte da
    $
      P_U (e_i) = sum_(j in NN) chevron.l (e_i), b_j chevron.r b_j = b_i
    $
    und $lim_(n -> infinity) norm(b_i) = infinity$ ist. Da $P_U ((e_i))$ somit
    bestimmt divergiert kann es keine konvergente Teilfolge geben. Mit
    kontraposition folgt somit die Aussage.

    $arrow.l.double$

    Sei $(x_i)_(i in NN)$ eine beschränkte folgte in $ell^2 (RR)$. Wählen wir
    ${b_1, ..., b_n}$ als eine Basis von $U$ und $M in RR$ so dass
    $norm(x_i) <= M forall i in NN$.

    Somit folgt
    $
      P_U (x_i) = sum_(j=1)^n chevron.l x_i, b_j chevron.r b_j
    $
    mit der Cachy Schwarz Ungleichung folgt nun
    $
      norm((sum_(j=1)^n chevron.l x_i, b_j chevron.r b_j))
      <= sum_(j=1)^n norm(x_i) norm(b_j)^2
      <= n M sum_(j=1)^n norm(b_i)^2.
    $

    Mit dem Satz von Bolzano Weierstrass folgt nun das $P_U ((x_i))$ eine
    Konvergent Teilfolge haben muss.
