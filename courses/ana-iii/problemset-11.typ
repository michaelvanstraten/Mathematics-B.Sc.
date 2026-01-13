#import "common.typ": *

#show: problemset("11")

#exercise([30 = 10 + 10 + 10])[
  Seien $d in {2, ...} subset NN$,
  $U_d := (0, infinity) times (-pi, pi) times (-pi slash 2, pi slash 2)^(d-2)$
  und $P_d : U_d -> RR^d = RR^(d-1) plus.o RR$ definiert durch $P_2 := P$ und
  $
    P_d (r, alpha_1, ..., alpha_(n-1))
    := vec(P_(d-1) (r, alpha_1, ..., alpha_(n-2)) cos(alpha_(n-1)), r sin(alpha_(n-1)))
  $
  für $d != 2$.

  + Zeigen Sie, dass $P_d : U_d -> V_d := P_d$ ein $C^1$-Diffeomorphismus ist.

  + Zeigen Sie, dass $RR^d backslash V_d$ eine $lambda_d$-Nullmenge ist.

  + Zeigen Sie, dass
    $
      abs(det T_((r, alpha_1, ..., alpha_(n-1))) P) = r^(d-1) product_(k=1)^(d-1) cos(alpha_k)^(k-1).
    $
]

=== Lösung:

+ Wir zeigen per Induktion über $d$, dass $P_d : U_d -> V_d$ ein
  $C^1$-Diffeomorphismus ist.

  *Induktionsanfang ($d = 2$):* Siehe Analysis II.

  *Induktionsschritt ($d - 1 -> d$):*

  Sei $d >= 3$ und nehmen wir an, dass $P_(d-1) : U_(d-1) -> V_(d-1)$ ein
  $C^1$-Diffeomorphismus ist.

  $P_d$ ist $C^1$, da $P_d$ durch
  $
    P_d (r, alpha_1, ..., alpha_(d-1))
    = vec(P_(d-1) (r, alpha_1, ..., alpha_(d-2)) cos(alpha_(d-1)), r sin(alpha_(d-1)))
  $
  definiert ist und $P_(d-1)$, $cos$, $sin$ sowie die Multiplikation $C^1$ sind,
  folgt, dass $P_d$ als Komposition von $C^1$-Funktionen selbst $C^1$ ist.

  Sei $(x_1, ..., x_d) in V_d$. Wir definieren für $k = 2, ..., d$:
  $
    rho_k := sqrt(x_1^2 + ... + x_k^2).
  $
  Insbesondere ist $r = rho_d = sqrt(x_1^2 + ... + x_d^2)$.

  Aus der rekursiven Definition von $P_d$ folgt, dass
  $
    x_k = r sin(alpha_(k-1)) product_(j=k)^(d-1) cos(alpha_j)
    quad "für" k = 2, ..., d-1, quad "und" quad x_d = r sin(alpha_(d-1)).
  $
  Durch Induktion über $k$ zeigt man
  $rho_k = r product_(j=k)^(d-1) cos(alpha_j)$ für $k = 2, ..., d$.

  Somit können wir die Winkel rekursiv zurückgewinnen:
  $
    alpha_(d-1) & = arcsin(x_d / rho_d), \
        alpha_k & = arcsin(x_(k+1) / rho_(k+1)) quad "für" k = 2, ..., d-2, \
        alpha_1 & = "atan2"(x_2, x_1).
  $

  Die Umkehrabbildung $P_d^(-1) : V_d -> U_d$ ist also gegeben durch
  $
    P_d^(-1)(x_1, ..., x_d)
    := (rho_d, "atan2"(x_2, x_1), arcsin(x_3 / rho_3), ..., arcsin(x_d / rho_d)).
  $

  Die Funktionen $rho_k = sqrt(x_1^2 + ... + x_k^2)$ sind $C^1$ auf $V_d$, da
  dort $rho_k > 0$ gilt (weil für Punkte in $V_d$ mindestens $rho_2 > 0$ ist
  durch die Einschränkung von $alpha_1 in (-pi, pi)$). Die Funktionen $arcsin$
  und $"atan2"$ sind $C^1$ auf ihren jeweiligen Definitionsbereichen, und da
  $alpha_k in (-pi/2, pi/2)$ für $k >= 2$ und $alpha_1 in (-pi, pi)$, liegen die
  Argumente stets im Inneren dieser Bereiche.

  Somit ist $P_d^(-1)$ eine $C^1$-Abbildung, und $P_d : U_d -> V_d$ ist ein
  $C^1$-Diffeomorphismus.

  #sym.suit.diamond.stroked

+ Wir bestimmen zunächst explizit die Menge $RR^d without V_d$.

  Aus der Konstruktion von $P_d$ in Teil (a) folgt, dass ein Punkt
  $(x_1, ..., x_d) in RR^d$ genau dann in $V_d$ liegt, wenn
  $(x_1, ..., x_d) != 0$ (da $r > 0$), und $"atan2"(x_2, x_1) in (-pi, pi)$,
  d.h. nicht $x_2 = 0$ und $x_1 <= 0$.

  Die Bedingungen an $alpha_k in (-pi/2, pi/2)$ für $k >= 2$ sind automatisch
  erfüllt, da $arcsin$ stets Werte in $[-pi/2, pi/2]$ liefert und für Punkte mit
  $rho_k > 0$ das Argument $x_(k+1)/rho_(k+1) in (-1, 1)$ liegt.

  Somit gilt
  $
    RR^d without V_d = {(x_1, 0, x_3, ..., x_d) in RR^d : x_1 <= 0}.
  $

  Diese Menge ist in der Hyperebene $H := {x in RR^d : x_2 = 0}$ enthalten.

  Wir wissen das Hyperebenen Maß null haben, und somit folgt mit der
  Vollständigkeit von $lambda_d$ das $RR^d without V_d$ eine Nullmenge ist.

  #sym.suit.diamond.stroked

+ TODO

#pagebreak()

#exercise([20 = 10 + 10])[
  Wir betrachten die obere Halbebene
  $
    HH := {z in CC : Im z > 0}.
  $

  Die Menge $HH$ ist das zugrundeliegende Modell der zweidimensionalen
  hyperbolischen Geometrie. In dieser Geometrie sind die Geraden Kreise, die
  senkrecht auf der reellen Achse stehen, oder parallele Verschiebungen der
  imaginären Achse, das heißt Teilmengen der Form
  $
    {z in HH : abs(z - x_0) = r}, quad x_0 in RR, r > 0, quad "sowie" quad {z in HH : Re z = x_0}, quad x_0 in RR.
  $

  Insbesondere gibt es durch zwei verschiedene $z, w in HH$ genau eine Gerade.
  Das Parallelenaxiom der euklidischen Geometrie ist jedoch verletzt. Das
  hyperbolische Volumen auf $HH$ ist das Borel-Maß
  $
    op("vol")_("hyp") : cal(B)(HH) -> [0, infinity] quad "definiert durch" quad op("vol")_("hyp") (A) := integral_A (Im z)^(-2) beta^2 (dif z).
  $

  + Seien $a, b, c in HH$ drei verschiedene Punkte. Die drei Geraden zwischen
    diesen Punkten umschließen das hyperbolische Dreieck $Delta_(a,b,c)$. Seien
    $alpha, beta, gamma >= 0$ die Innenwinkel dieses Dreiecks. Zeigen Sie, dass
    $
      op("vol")_("hyp") (Delta_(a,b,c)) = pi - alpha - beta - gamma.
    $

  + Jedes
    $
      T := mat(a, b; c, d) in S L_2 (RR)
    $
    definiert eine Möbiustransformation $mu_T : HH -> HH$ durch
    $
      mu_T (z) := (a z + b) / (c z + d).
    $

    Zeigen Sie, dass die Möbiustransformationen volumenerhaltend sind, das heißt
    für alle $T in S L_2 (RR)$ und $A in cal(B)(HH)$ gilt
    $
      op("vol")_("hyp") (mu_T (A)) = op("vol")_("hyp") (A).
    $
]

=== Lösung:

+ TODO

+ Aus Analysis II wissen wir das $mu_T$ ein $C^infinity$ Diffeomorphismus ist
  mit
  $
    det(T_x mu_T) = (|c z + d|)^(-4).
  $
  Mit dem Transformationssatz folgt nun, dass für alle $A in cal(B)(HH)$
  $
    op("vol")_("hyp") (mu_T (A)) & = integral_(mu_T (A)) (Im w)^(-2) beta^2 (dif w) \
    &= integral_(A) (Im mu_T (z))^(-2) |det(T_z mu_T)| beta^2 (dif z) \
    &= integral_(A) (Im mu_T (z))^(-2) 1/(|c z + d|)^4 beta^2 (dif z) \
    &= integral_(A) (|c z + d|)^4 / (Im z)^2 1/(|c z + d|)^4 beta^2 (dif z) \
    &= integral_(A) (Im z)^(-2) beta^2 (dif z) \
    &= op("vol")_("hyp") (A)
  $

#pagebreak()
