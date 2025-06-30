#import "common.typ": *
#import "@preview/colorful-boxes:1.4.3": colorbox

#show: problemset(7)

#exercise([10])[
  Sei $U subset RR^n$ offen, $f : U -> RR$ eine Abbildung, $x in U$,
  $v in RR^n$. Sei $epsilon > 0$, so dass für alle $t in (-epsilon, epsilon)$
  gilt $x + t v in U$. Wir definieren $gamma : (-epsilon, epsilon) -> U$ durch
  $gamma(t) := x + t v$.

  Zeigen Sie, dass die Abbildung $f$ genau dann an der Stelle $x$ in Richtung
  von $v$ differenzierbar ist, wenn die Funktion
  $f compose gamma : (-epsilon, epsilon) -> RR$ an der Stelle $0$
  differenzierbar ist. Zeigen Sie auch, dass in diesem Fall
  $
    partial_v f(x) = (f compose gamma)'(0).
  $
]

*Beweis*

"$=>$"

Nach der Kettenregel (Satz 10.12) gilt das wenn $gamma$ an der Stelle $0$
defierenzierbar ist und $f$ an der stelle $gamma(0) = x$ differenzierbar ist das
ist $f compose gamma$ an der stelle $0$ differenzierbar.

"$arrow.l.double$"

*Bemerken wir zunächst folgendes:*

Sei $g: RR -> RR$ differenzierbar in der $0$ nach der Definition aus Analysis I.
So folgt das für alle $epsilon > 0$ ein $delta > 0$ existert so das wenn $abs(t)
in RR < delta$ das
$
      & abs(frac(g(t) - g(x), t) - g'(0))   && < epsilon        \
  <=> & abs(frac(g(t) - g(x) - t g'(0), t)) && < epsilon        \
  <=> & abs(g(t) - g(x) - t g'(0))          && < abs(t) epsilon
$
Definieren wir $T_x g(t) := g'(x) t$ so folgt das $g$ auch #smallcaps(
  "Frechet",
)-differenzierbar an der stelle $0$ ist. ($T_x g(t)$ ist offensichtlich linear
in $t$).

Somit folgt das wenn $f compose gamma$ an der Stelle $0$ differenzierbar ist
dann folgt das für alle $epsilon > 0$ ein $delta > 0$ existiert so das wenn
$t in RR$ mit $abs(t - 0) <= delta$ folgt das
$
  & abs((f compose gamma)(t) - (f compose gamma)(0) - t (f compose gamma)'(0))
  & < epsilon abs(t)
$
für $abs(dot)$ als Norm auf $RR$.

Setzen wir die defintion von $gamma$ ein und definieren $partial_v f(x) = (f
  compose gamma)'(0)$ so folgt die differenzierbarkeit von $f$ an der stelle $x$
in richtung $v$
$
  abs(f(x + t v) - f(x) - t partial_v f(x)) < epsilon abs(t).
$


#pagebreak()

#exercise([20])[
  Die Drehgruppe $"SO"(3)$ ist definiert durch
  $
    "SO"(3) := {A in RR^(3 times 3) : A^T A = I, det(A) = 1}.
  $

  Wir definieren $R_z : RR -> "SO"(3) subset RR^(3 times 3)$ und
  $R_y : RR -> "SO"(3) subset RR^(3 times 3)$ durch
  $
    R_z(theta) := mat(
      cos(theta), -sin(theta), 0;
      sin(theta), cos(theta), 0;
      0, 0, 1
    )
    quad "und" quad
    R_y(theta) := mat(
      cos(theta), 0, -sin(theta);
      0, 1, 0;
      sin(theta), 0, cos(theta)
    ).
  $

  Hierbei beschreiben $R_z(theta)$ und $R_y(theta)$ Rotationen mit Winkel
  $theta$ um die $z$- bzw. $y$-Achse. Sei $E : RR^3 -> "SO"(3) subset RR^3$
  definiert durch
  $
    E(phi, theta, psi) := R_z(phi) R_y(theta) R_z(psi).
  $

  Es ist eine Tatsache (die Sie nicht beweisen müssen), dass $E$ surjektiv ist,
  das heißt jede beliebige Drehung kann bewirkt werden, indem man zuerst um die
  $z$-Achse dreht, dann um die $y$-Achse dreht und dann noch einmal um die
  $z$-Achse dreht. Die entsprechenden Winkel $phi, theta, psi$ heißen die
  Eulerwinkel.

  Zeigen Sie, dass $E : RR^3 -> RR^(3 times 3)$ stetig differenzierbar ist und
  berechnen Sie $T E$.

  *Tipp.* Nutzen Sie die Tatsache, dass $E$ in faktorisierter Form gegeben
  wurde. Widerstehen Sie der Versuchung, $E$ konkret auszurechnen und
  anschließend wild los zu rechnen.

  *Bemerkung.* Die Abbildung wird physikalisch realisiert durch die Kardansche
  Aufhängung. Die Abbildung $T_(phi,theta,psi) E : RR^3 -> RR^(3 times 3)$ ist
  meistens aber nicht immer injektiv. An den kritischen Winkeln, für die
  $T_(phi,theta,psi) E$ nicht injektiv ist, tritt das Phänomen des sogenannten
  Gimbal Lock auf.
]

#pagebreak()

#exercise([10])[
  Wir definieren $gamma : [0, 1] -> RR^2$ durch
  $
    gamma(t) := vec(cos(pi t), sin(pi t)).
  $

  Zeigen Sie, dass es kein $t in (0, 1)$ gibt, so dass
  $
    gamma(1) - gamma(0) = dot(gamma)(t).
  $
]

