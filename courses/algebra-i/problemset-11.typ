#import "common.typ": *

#show: problemset("11")

#aufgabe[
  Sei $f(x) = x^3 + 2x + 1 in FF_3 [x]$.

  + Zeigen Sie, dass $f$ irreduzibel ist.

  + Sei $L slash FF_3$ eine Körpererweiterung und $alpha in L$ eine Nullstelle
    von $f$. Zeigen Sie, dass $f$ drei verschiedene Nullstellen in
    $FF_3 (alpha)$ besitzt.

    _Tipp:_ Bestimmen Sie den Frobenius-Automorphismus
    $phi in op("Aut")(FF_3 (alpha) slash FF_3)$ der in Aufgabe 1 in der Übung
    der Woche 10 definiert wurde. Wie wirkt dieser sich auf Nullstellen von $f$
    aus?

  + Bestimmen Sie das Minimalpolynom von $beta = alpha^2 + 1$ über $FF_3$.
]

=== Lösung:

+ Bemerken wir das ein Polynom vom Grad drei genau dann reduzibel, wenn es eine
  Nullstelle über den Körper besitzt.

  Werten $f$ auf $FF_3 = {0, 1, 2}$ aus so folgt:
  $
    f(0) & = 0 + 0 + 1 = 1 eq.not 0, \
    f(1) & = 1 + 2 + 1 = 4 equiv 1 eq.not 0, \
    f(2) & = 8 + 4 + 1 = 13 equiv 1 eq.not 0.
  $

  Also hat $f$ keine Nullstelle in $FF_3$, folglich keinen Linearfaktor, und ist
  somit irreduzibel.

+ Sei $K = FF_3 (alpha)$. Da $f$ irreduzibel vom Grad $3$ ist und $alpha$ eine
  Nullstelle ist, ist $f$ das Minimalpolynom von $alpha$ über $FF_3$. Somit gilt
  $[K : FF_3] = 3$, also $K tilde.equiv FF_(3^3) = FF_27$ ist ein endlicher
  Körper.

  Wir definieren den Frobenius-Automorphismus
  $
    phi : K -> K, quad phi(x) = x^3.
  $
  Dieser liegt in $op("Aut")(K slash FF_3)$.

  Da die Koeffizienten von $f$ in $FF_3$ liegen, gilt
  $
    f(phi(x)) = phi(f(x)) quad "für alle" x in K.
  $
  Insbesondere, falls $f(alpha) = 0$, dann
  $
    0 = phi(f(alpha)) = f(phi(alpha)) = f(alpha^3),
  $
  also ist $alpha^3$ ebenfalls eine Nullstelle. Wir erhalten
  $
    f(alpha^9) = f((alpha^3)^3) = 0.
  $
  Somit sind $alpha, alpha^3, alpha^9$ Nullstellen von $f$ in $K$.


  Falls $alpha^3 = alpha$, dann ist $alpha$ fixiert unter Frobenius, also
  $alpha in FF_3$. Aber $f$ hat keine Nullstelle in $FF_3$ nach (a),
  Widerspruch. Also $alpha^3 eq.not alpha$.

  Falls $alpha^9 = alpha$, zwingt dieselbe Argumentation (fixiert unter $phi^2$,
  dessen Fixkörper ebenfalls $FF_3$ ist) wieder $alpha in FF_3$, Widerspruch.
  Also $alpha^9 eq.not alpha$.

  Falls $alpha^9 = alpha^3$, dann potenzieren wir beide Seiten hoch drei:
  $(alpha^9)^3 = alpha^27 = (alpha^3)^3 = alpha^9$. In $FF_27$ gilt
  $alpha^27 = alpha$, also $alpha = alpha^9 = alpha^3$, was
  $alpha^3 eq.not alpha$ widerspricht.

+ Aus $f(alpha) = 0$ folgt:
  $
    alpha^3 + 2 alpha + 1 = 0 ==> alpha^3 = -2 alpha - 1 equiv alpha + 2 quad (mod 3).
  $

  Sei $beta = alpha^2 + 1$. Dann ist $alpha^2 = beta - 1 = beta + 2$.

  Nun nutzen wir $alpha^3 = alpha dot.c alpha^2$:
  $
    alpha^3 = alpha(beta + 2).
  $

  Aber auch $alpha^3 = alpha + 2$. Somit
  $
             alpha(beta + 2) & = alpha + 2 \
    ==> alpha beta + 2 alpha & = alpha + 2 \
      ==> alpha beta + alpha & = 2 \
         ==> alpha(beta + 1) & = 2.
  $

  Also ist $beta eq.not -1$ und
  $
    alpha = frac(2, beta + 1).
  $

  Quadrieren wir dies und nutzen $alpha^2 = beta + 2$:
  $
    alpha^2 = frac(4, (beta + 1)^2) equiv frac(1, (beta + 1)^2) = beta + 2.
  $
  Somit
  $
    1 = (beta + 2)(beta + 1)^2.
  $
  Wir entwickeln in $FF_3$. Zunächst
  $(beta + 1)^2 = beta^2 + 2 beta + 1 equiv beta^2 - beta + 1$. Dann
  $
    (beta + 2)(beta^2 - beta + 1) = beta^3 + beta^2 + 2 beta + 2.
  $
  Also wird die Gleichung $1 = (beta + 2)(beta + 1)^2$ zu
  $
        1 & = beta^3 + beta^2 + 2 beta + 2 \
    ==> 0 & = beta^3 + beta^2 + 2 beta + 1.
  $
  Somit ist $beta$ eine Nullstelle von
  $
    g(x) = x^3 + x^2 + 2x + 1 in FF_3[x].
  $

  Wir prüfen, dass $g$ keine Nullstelle in $FF_3$ hat:
  $
    g(0) & = 1 eq.not 0, \
    g(1) & = 1 + 1 + 2 + 1 = 5 equiv 2 eq.not 0, \
    g(2) & = 8 + 4 + 4 + 1 = 17 equiv 2 eq.not 0.
  $

  Also hat $g$ keinen Linearfaktor, ist somit irreduzibel vom Grad $3$. Daher
  ist es das Minimalpolynom.

#pagebreak()

#aufgabe[
  Sei $p$ eine Primzahl und
  $K := QQ[x] slash (x^(p-1) + x^(p-2) + ... + x + 1)$.

  + Zeigen Sie, dass $K$ ein Körper ist.

  + Sei $xi in K$ die Äquivalenzklasse von $x$. Geben Sie eine Basis des
    $QQ$-Vektorraums $K$ an, welche nur aus Polynomen in $xi$ besteht.

  + Zeigen Sie, dass $xi^p = 1$ gilt. Man nennt $xi$ eine _(primitive) $p$-te
    Einheitswurzel_. Finden Sie neben $xi$ alle weitere Nullstellen des Polynoms
    $f(y) = y^p - 1$. Zerlegen Sie $f(y) in K[y]$ in Linearfaktoren.

  + Finden Sie alle Körperhomomorphismen $K arrow.hook CC$ in
    $op("Hom")_QQ (K, CC)$. Wieviele gibt es?
]

=== Lösung:

#pagebreak()

#aufgabe[
  + Geben Sie ein Beispiel für eine Körpererweiterung $L slash K$ und
    $sigma : L -> L$ ein Körperhomomorphismus mit $sigma bar_K = op("id")_K$ an,
    sodass $sigma$ kein Isomorphismus ist.

  + Sei $L slash K$ eine Körpererweiterung mit $[L : K] = 2^k$. Sei $f in K[x]$
    ein kubisches Polynom, d.h. $op("deg")(f) = 3$. Zeigen Sie: Besitzt $f$ eine
    Nullstelle in $L$, dann besitzt es bereits eine Nullstelle in $K$.

  + Sei $K$ ein Körper und $f in K[x]$ ein Polynom von Grad $n$ und sei $L$ der
    Zerfällungskörper von $f$ über $K$. Beweisen Sie $[L : K] <= n!$.
]

=== Lösung:

+ Sei $K = QQ$ und $L = QQ(t)$ der rationale Funktionenkörper in einer
  transzendenten Variablen $t$.

  Definiere
  $
    sigma : QQ(t) -> QQ(t), quad sigma(f(t)) = f(t^2).
  $

  Dann gilt $sigma$ ist ein Körperhomomorphismus (Substitution $t |-> t^2$
  respektiert Addition, Multiplikation und $1$). $sigma bar_QQ = op("id")_QQ$,
  da rationale Zahlen bei Substitution unverändert bleiben. $sigma$ ist nicht
  surjektiv, also kein Isomorphismus: $t in.not op("im")(sigma)$.

  Angenommen $t = sigma(p(t) slash q(t)) = p(t^2) slash q(t^2)$ mit Polynomen
  $p, q in QQ[t]$, $q eq.not 0$. Dann $t dot q(t^2) = p(t^2)$. Die rechte Seite
  enthält nur *gerade* Exponenten, die linke Seite wegen des Faktors $t$ nur
  ungerade Exponenten. Widerspruch.

+ Sei $alpha in L$ eine Nullstelle von $f$. Das Minimalpolynom
  $m_alpha (x) in K[x]$ von $alpha$ über $K$ teilt $f$. Da $deg(f) = 3$, gilt
  $
    deg(m_alpha) in {1, 3}.
  $

  Nach Bemerkung 1.10 teilt $[K(alpha) : K] = deg(m_alpha)$ den Grad
  $[L : K] = 2^k$. Also ist $[K(alpha) : K]$ eine Zweierpotenz.

  Falls $deg(m_alpha) = 3$, wäre $[K(alpha) : K] = 3$, aber $3 divides.not 2^k$.
  #sym.arrow.zigzag.

+ Seien $alpha_1, ..., alpha_r$ die verschiedenen Nullstellen von $f$ und
  $L = K(alpha_1, ..., alpha_r)$ der Zerfällungskörper.

  Betrachte die Sequence
  $
    K = K_0 subset.eq K_1 subset.eq ... subset.eq K_r = L, quad K_i := K(alpha_1, ..., alpha_i).
  $

  Was wiederumg liefert das
  $
    [L : K] = product_(i=1)^r [K_i : K_(i-1)].
  $

  Über $K_(i-1)$ ist $alpha_i$ Nullstelle eines Polynoms vom Grad
  $<= n - (i - 1)$ (das Restpolynom nach Abspalten der Linearfaktoren
  $(x - alpha_1), ..., (x - alpha_(i-1))$).

  Das Minimalpolynom von $alpha_i$ über $K_(i-1)$ teilt dieses Restpolynom, also
  $
    [K_i : K_(i-1)] = deg(m_(alpha_i, K_(i-1))) <= n - (i - 1).
  $

  Damit folgt
  $
    [L : K] <= product_(i=1)^r (n - (i - 1)) <= product_(i=1)^n (n - (i - 1)) = n!.
  $

