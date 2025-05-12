#import "common.typ": *

#show: problemset(3)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#exercise([20 = 10 + 10])[
  Seien $X, Y$ metrische Räume und $f: X -> Y$. Zeigen Sie, dass folgende
  Aussagen äquivalent sind:
  + $f$ ist gleichmäßig stetig.
  + Für alle $(x_n), (y_n) in X^NN$ gilt
    $
      "wenn" #h(1em) lim_(n->infinity) distance(x_n, y_n) = 0,
      #h(1em) "dann" #h(1em) lim_(n->infinity) distance(f(x_n), f(y_n)) = 0.
    $
]

_Beweis_

*(1) $=>$ (2)*

Sei $epsilon > 0$. Wir wählen $delta > 0$ so, dass für alle $x, y in X$ mit
$distance(x, y) < delta$ gilt: $distance(f(x), f(y)) < epsilon$. Dies ist
möglich, da $f$ gleichmäßig stetig ist.

Seien $(x_n), (y_n) in X^NN$ Folgen mit
$lim_(n->infinity) distance(x_n, y_n) = 0$. Dann existiert ein $N in NN$, sodass
für alle $n >= N$ gilt: $distance(x_n, y_n) < delta$.

Aus der gleichmäßigen Stetigkeit von $f$ folgt dann, dass für alle $n >= N$
gilt: $distance(f(x_n), f(y_n)) < epsilon$.

Da $epsilon > 0$ beliebig war, folgt
$lim_(n->infinity) distance(f(x_n), f(y_n)) = 0$.

*(2) $=>$ (1)*

Wir beweisen dies durch Widerspruch. Angenommen, $f$ ist nicht gleichmäßig
stetig. Dann existiert ein $epsilon_0 > 0$, sodass für alle $delta > 0$ Punkte
$x, y in X$ existieren mit $distance(x, y) < delta$ aber
$distance(f(x), f(y)) >= epsilon_0$.

Für jedes $n in NN$ wählen wir $delta_n = 1 / n$ und finden entsprechende Punkte
$x_n, y_n in X$ mit $distance(x_n, y_n) < 1 / n$ aber
$distance(f(x_n), f(y_n)) >= epsilon_0$.

Somit haben wir Folgen $(x_n)$ und $(y_n)$ konstruiert, für die gilt:
$lim_(n->infinity) distance(x_n, y_n) = 0$, aber
$distance(f(x_n), f(y_n)) >= epsilon_0$ für alle $n in NN$.

Dies ist ein Widerspruch zur Voraussetzung (2). Daher muss $f$ gleichmäßig
stetig sein.

#pagebreak()

#exercise([30 = 10 + 10 + 10])[
  Seien $a, b in RR$ mit $a < b$. Sei $scr(T)([a,b], RR) subset.eq B([a,b], RR)$
  der Untervektorraum der Treppenfunktionen, das heißt der Untervektorraum der
  von den charakteristischen Funktionen
  $
    chi_([c,d]) : [a,b] -> RR
  $
  $
    x arrow.long.r
    cases(
      1 "falls" x in [c,d],
      0 "sonst"
    )
  $
  mit $[c,d] subset.eq [a,b]$ erzeugt wird. Der Folgenabschluss von
  $scr(T)([a,b], RR) subset.eq B([a,b], RR)$ wird mit $scr(R)scr(F)([a,b], RR)$
  bezeichnet. Die Elemente von $scr(R)scr(F)([a,b], RR)$ werden Regelfunktionen
  von $[a,b]$ nach $RR$ genannt. Es gibt eine lineare Abbildung
  $I: scr(T)([a,b]) -> RR$, so dass für alle $[c,d] subset.eq [a,b]$ gilt
  $
    I(chi_([c,d])) = d - c.
  $
  Die "Wohldefiniertheit" von $I$ müssen sie nicht beweisen.

  + Zeigen Sie, dass $I: scr(T)([a,b], RR) -> RR$ Lipschitz-stetig bzgl.
    $distance_("sup")$ ist.

  + Zeigen Sie, dass es eine eindeutige stetige Abbildung
    $
      scr(R)scr(F)([a,b], RR) -> RR
    $
    $
      f arrow.long.r integral_(a)^b f(x) d x
    $
    gibt, so dass für alle $t in scr(T)([a,b], RR)$ gilt
    $
      integral_(a)^b t(x) d x = I(t).
    $

    _Bemerkung._ Dieses Integral heißt das Regelintegral.

  + Seien $lambda in RR$ und $f in scr(R)scr(F)([a,b], RR)$. Zeigen Sie, dass
    $lambda f in scr(R)scr(F)([a,b], RR)$ und
    $
      integral_(a)^b (lambda f)(x) d x = lambda integral_(a)^b f(x) d x.
    $

  _Bemerkung._ Mit ähnlichen Argumenten zeigt man, dass das Regelintegral
  linear, gebietsadditiv, usw. ist.
]

_Beweis_


+ Für $f in scr(T)([a,b], RR)$ folgt aus der Definition, dass es eine endliche
  Folge von Stützstellen $a = t_0 < t_1 < ... < t_n = b$ sowie reelle Zahlen
  $c_1, ..., c_n$ gibt, sodass
  $
    f = sum_(i=1)^n c_i chi_([t_(i-1), t_i]).
  $
  Mit der Linearität von $I$ folgt somit
  $
    I(f) &= I(sum_(i=1)^n c_i chi_([t_(i-1), t_i])) \
    &= sum_(i=1)^n c_i I(chi_([t_(i-1), t_i])) \
    &= sum_(i=1)^n c_i (t_i - t_(i-1)).
  $

  Bemerken wir, dass für $c_max := max(c_1, ..., c_n)$ sowie
  $c_min := min(c_1, ..., c_n)$ folgt:
  $ c_min dot (b - a) <= I(f) <= c_max dot (b - a). $


  Seien $f, g in scr(T)([a,b], RR)$. Dann folgt:
  $
    abs(I(f) - I(g)) &=
    abs(sum_(i=1)^n c_i (t_i - t_(i-1)) - sum_(i=1)^m d_i (u_i - u_(i-1))) \
    &<= abs((b-a) (c_max - d_min)) \
    &= (b-a) distance_sup (f, g).
  $

+ Da $scr(R)scr(F)$ der Folgenabschluss von $scr(T)$ ist, folgt, dass $scr(T)$
  dicht in $scr(R)scr(F)$ liegt. Da $I$ Lipschitz-stetig und somit gleichmäßig
  stetig ist und $RR$ vollständig ist, folgt aus Proposition 5.6 (stetige
  Fortsetzung), dass es eine eindeutige Funktion
  $F : scr(R)scr(F)([a,b], RR) -> RR$ existiert, für welche
  $F|_(scr(T)([a,b], RR)) = I$ gilt.

+ Sei $f in scr(R)scr(F)([a,b], RR)$ sowie $lambda in RR$. Dann gibt es eine
  Folge $(f_n) in scr(T)([a,b], RR)^NN$, sodass $lim_(n -> infinity) f_n = f$
  ist. Da $f_n in scr(T)([a,b], RR)$ folgt auch, dass
  $lambda f_n in scr(T)([a,b], RR)$ ist. Betrachten wir nun:
  $
    lim_(n -> infinity) distance_sup (lambda f_n, lambda f) &=
    lim_(n -> infinity) sup_(x in [a,b]) abs(lambda f_n (x) - lambda f(x)) \
    &= abs(lambda) dot lim_(n -> infinity) sup_(x in [a,b]) abs(f_n (x) - f(x)) \
    &= abs(lambda) dot 0 = 0,
  $
  so folgt, dass $lambda f in scr(R)scr(F)([a,b], RR)$ ist, da es der Grenzwert
  einer Folge in $scr(T)([a,b], RR)$ ist.

  Da $ J(f) := integral_(a)^b f(x) d x $
  die stetige Fortsetzung von $I$ ist und somit ebenfalls stetig ist, folgt:
  $
    J(lambda f) &= J(lim_(n->infinity) lambda f_n) \
    &= lim_(n->infinity) J(lambda f_n) \
    &= lim_(n->infinity) I(lambda f_n) \
    &= lambda lim_(n->infinity) I(f_n) \
    &= lambda J(f).
  $
