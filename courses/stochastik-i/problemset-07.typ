#import "common.typ": *

#show: problemset("7")

#exercise([3 + 3])[
  *Terminale Ereignisse*

  + Im Folgenden sei $overline(RR) := RR union {-infinity, +infinity}$.

    + Es sei $X$ eine $overline(RR)$-wertige Zufallsvariable auf einem
      Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$ und $scr(G) subset scr(F)$
      eine $sigma$-Algebra, sodass $PP(B) in {0, 1}$ für jedes $B in scr(G)$
      gilt. Zeigen Sie: Ist $X$ $scr(G)$-$cal(B)(overline(RR))$-messbar, so
      existiert eine Konstante $c in overline(RR)$ mit $PP(X = c) = 1$.

    + Es sei $(X_n)_(n in NN)$ eine Folge unabhängiger, reellwertiger
      Zufallsvariablen auf einem Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$
      und sei $(a_n)_(n in NN) subset RR$ mit $a_n -> 0$ für $n -> infinity$.
      Zeigen Sie, dass Konstanten $c_-, c_+ in overline(RR)$ existieren, sodass
      $
        liminf_(n -> infinity) a_n (X_1 + dots + X_n) = c_- quad PP"-f.s."
      $
      $
        limsup_(n -> infinity) a_n (X_1 + dots + X_n) = c_+ quad PP"-f.s."
      $
      _Hinweis:_ Nutzen Sie das 0-1-Gesetz von Kolmogorov.

  + Es sei $(X_n)_(n in NN)$ eine Folge unabhängiger Zufallsvariablen auf einem
    Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$, die alle gleichverteilt auf
    $[0, 1]$ sind. Zeigen Sie, dass
    $
      limsup_(n -> infinity) 1 / log(n) log(1 / X_n) = 1 quad PP"-f.s."
    $
    _Hinweis:_ Nutzen Sie das erste und zweite Lemma von Borel-Cantelli.
]

=== Lösung

+ #linebreak()
  + Wegen der Messbarkeit von $X$ bezüglich $scr(G)$ gilt für alle $t in RR$ das
    $X^(-1)([-infinity, t]) = {X <= t} in scr(G)$, also ist $PP(X <= t) in {0,
      1}$.

    Definieren wir nun
    $
      c := inf_(t in RR) {t : PP(X <= t) = 1}
    $

    Ist $c in RR$, so gilt für jedes $m in NN$ (definition es Infimums)
    $
      PP(underbrace(X <= c + 1 / m, X_(m+))) = 1
      "und"
      PP(underbrace(X <= c - 1 / m, X_(m-))) = 0.
    $
    Bemerken wir das $X_(m-)$ und $X_(m-)$ disjunkt sind, also gilt
    $
      PP(c - 1 / m < X <= c + 1 / m) = PP(X_(m-) inter X_(m+)) = 1 - 0 = 1
    $
    für alle $m in NN$. Die folgte $X_(m-) inter X_(m+)$ ist monoton fallen also
    folgt
    $
      PP(inter_(m=1)^infinity {c - 1 / m < X <= c + 1 / m})
      = PP(X = c)
      = 1.
    $

    Ist $c = +infinity$, so gilt $PP(X <= m) = 0$ für alle $m in NN$. Daher
    $
      PP(X = +infinity)
      = PP(inter_(m=1)^infinity {X > m})
      = 1.
    $

    Ist $c = -infinity$, so folgt aus der Definition des Infimums
    $PP(X <= -m) = 1$ für alle $m in NN$. Also
    $
      PP(X = -infinity)
      = PP(inter_(m=1)^infinity {X <= -m})
      = 1.
    $

  + Definieren wir
    $
      S_n := X_1 + dots + X_n,
      quad
      X_* := liminf_(n -> infinity) a_n S_n,
      quad
      X^* := limsup_(n -> infinity) a_n S_n.
    $

    Für alle $N in NN$ gilt wegen $a_n -> 0$ und der Endlichkeit von $S_N$ das
    $
      a_n S_N -> 0.
    $
    Somit folgt
    $
      X_* & = liminf_(n -> infinity) a_n S_n \
          & = liminf_(n -> infinity) (a_n (S_n - S_N) + a_n S_N) \
          & = liminf_(n -> infinity) a_n (S_n - S_N) \
          & = liminf_(n -> infinity) a_n (X_(N + 1) + dots + X_n).
    $
    Also ist $X_*$ für jedes $N in NN$ $scr(T)_N$-messbar.

    Analog erhält man
    $
      X^*
      = limsup_(n -> infinity) a_n (X_(N + 1) + dots + X_n),
    $
    also ist auch $X^*$ für jedes $N in NN$ $scr(T)_N$-messbar.

    Damit sind $X_*$ und $X^*$ bezüglich der terminalen $sigma$-Algebra $scr(T)$
    messbar. Mit *Korollar 3.2.9* folgt das Konstanten
    $c_-, c_+ in overline(RR)$ existieren mit
    $
      PP(X_* = c_-) = 1
      "und"
      PP(X^* = c_+) = 1.
    $

+ Wir betrachten nur $n >= 2$, da der erste Index den $limsup$ nicht verändert.
  Für $epsilon > 0$ definieren wir uns
  $
    A_n^epsilon
    := {1 / log(n) log(1 / X_n) >= 1 + epsilon}
    = {X_n <= 1 / n^(1 + epsilon)}.
  $
  Da $X_n$ gleichverteilt auf $[0, 1]$ ist, gilt
  $
    PP(A_n^epsilon) = 1 / n^(1 + epsilon).
  $
  Somit folgt
  $
    sum_(n=2)^infinity PP(A_n^epsilon)
    = sum_(n=2)^infinity 1 / n^(1 + epsilon)
    < infinity.
  $
  Nach dem ersten Lemma von Borel-Cantelli treten die Ereignisse $A_n^epsilon$
  nur endlich oft ein. Folglich gilt
  $
    limsup_(n -> infinity) 1 / log(n) log(1 / X_n) <= 1 + epsilon
    quad PP"-f.s."
  $
  Für alle rationalen $epsilon > 0$ gleichzeitig folgt
  $
    limsup_(n -> infinity) 1 / log(n) log(1 / X_n) <= 1
    quad PP"-f.s."
  $

  Sei nun $epsilon in (0, 1)$ und definieren wir
  $
    B_n^epsilon
    := {1 / log(n) log(1 / X_n) >= 1 - epsilon}
    = {X_n <= 1 / n^(1 - epsilon)}.
  $
  Dann gilt
  $
    PP(B_n^epsilon) = 1 / n^(1 - epsilon)
  $
  und somit
  $
    sum_(n=2)^infinity PP(B_n^epsilon)
    = sum_(n=2)^infinity 1 / n^(1 - epsilon)
    = infinity.
  $
  Die Ereignisse $(B_n^epsilon)_(n >= 2)$ sind unabhängig, da die
  Zufallsvariablen $(X_n)_(n in NN)$ unabhängig sind. Nach dem zweiten Lemma von
  Borel-Cantelli treten die Ereignisse $B_n^epsilon$ unendlich oft ein. Also
  gilt
  $
    limsup_(n -> infinity) 1 / log(n) log(1 / X_n) >= 1 - epsilon
    quad PP"-f.s."
  $
  Für alle rationalen $epsilon in (0, 1)$ gleichzeitig folgt
  $
    limsup_(n -> infinity) 1 / log(n) log(1 / X_n) >= 1
    quad PP"-f.s."
  $

  Also folgt die Aussage.

#pagebreak()

#exercise([2 + 2 + 2])[
  Es sei $(Omega, scr(F), PP)$ ein Wahrscheinlichkeitsraum.

  + Es sei $X >= 0$ eine reellwertige Zufallsvariable auf $(Omega, scr(F), PP)$
    und $g : RR_+ -> RR_+$ eine monoton wachsende, stetig differenzierbare
    Funktion mit $g(0) = 0$. Zeigen Sie, dass
    $
      EE[g(X)] = integral_0^(+infinity) g'(t) PP(X >= t) dif t.
    $

  + Es sei $Y$ eine $ZZ$-wertige Zufallsvariable auf $(Omega, scr(F), PP)$.
    Zeigen Sie, dass
    $
      EE[Y] = sum_(k=0)^infinity PP(Y > k) - sum_(k=-infinity)^0 PP(Y < k).
    $

  + Es sei $Z$ eine reellwertige Zufallsvariable auf $(Omega, scr(F), PP)$ mit
    stetiger Verteilungsfunktion $F_Z$. Zeigen Sie, dass
    $
      integral_RR F_Z (z) PP_Z (dif z) = 1/2.
    $
    _Hinweis:_ Verwenden Sie den Satz von Fubini-Tonelli.
]

=== Lösung

+ Da $g(0) = 0$ ist folgt für alle $omega in Omega$ das
  $
    g(X(omega)) & = integral_0^(X(omega)) g'(t) dif t \
                & = integral_0^infinity g'(t) compose bb(1)_{t <= X(omega)} dif t.
  $

  Mit Fubini Folgt nun:
  $
    E[g(x)] & = integral_Omega g(X(omega)) PP(dif omega) \
    & = integral_Omega integral_0^infinity g'(t) bb(1)_{t <= X(omega)} dif t PP(dif omega) \
    & = integral_0^infinity g'(t) integral_Omega bb(1)_{t <= X(omega)} PP(dif omega) dif t \
    & = integral_0^infinity g'(t) PP(t <= X) dif t
  $

+ TODO
+ TODO

#pagebreak()

#exercise([4 + 2])[
  *Zufallsvektoren*

  + Es sei $(X, Y)$ ein $RR^2$-wertiger Zufallsvektor auf einem
    Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$ mit Dichte
    $
      f_((X,Y))(x, y) = 1/4 (1 + x y) bb(1)_([-1,1]^2)(x, y),
      quad (x, y) in RR^2.
    $

    + Berechnen Sie die folgenden Erwartungswerte, sofern diese existieren:
      $
        EE[X bb(1)_({X < 1/2})], quad EE[1/X], quad EE[X Y].
      $

    + Sind die Zufallsvariablen $X$ und $Y$ unabhängig?

  + Es seien $X$ und $Y$ zwei unabhängige Zufallsvariablen auf einem
    Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$, wobei $X ~ "Exp"(lambda)$ für
    ein $lambda > 0$ sei und $Y ~ "Geom"(p)$ für ein $p in (0, 1)$ sei.
    Berechnen Sie $PP(X > Y)$.
]

=== Lösung

#pagebreak()

#exercise([1 + 1 + 2 + 1 + 1])[
  Es sei $(Omega, scr(F), PP)$ ein Wahrscheinlichkeitsraum und $X >= 0$ eine
  reellwertige Zufallsvariable auf $(Omega, scr(F), PP)$. Es bezeichne $EE_PP$
  den Erwartungswert bezüglich $PP$ und es gelte $EE_PP (X) = 1$. Wir definieren
  eine Mengenfunktion $QQ : scr(F) -> RR$ mittels $QQ(A) := EE_PP (X bb(1)_A)$.

  + Zeigen Sie, dass $QQ$ ein Wahrscheinlichkeitsmaß auf $(Omega, scr(F))$ ist.

  + Zeigen Sie, dass für alle $A in scr(F)$ aus $PP(A) = 0$ auch $QQ(A) = 0$
    folgt. Finden Sie ein Beispiel dafür, dass die Umkehrung nicht gilt.

  + Zeigen Sie, dass $EE_QQ (Y) = EE_PP (X Y)$ für alle nicht-negativen
    Zufallsvariablen $Y$ gilt, wobei $EE_QQ$ der Erwartungswert bezüglich $QQ$
    sei.

  Im Folgenden gelte zusätzlich, dass $PP(X > 0) = 1$.

  + Zeigen Sie, dass $1/X$ bezüglich $QQ$ integrierbar ist.

  + Wir definieren eine weitere Mengenfunktion $R : scr(F) -> RR$ als
    $R(A) := EE_QQ (1/X bb(1)_A)$ für $A in scr(F)$. Zeigen Sie, dass $R = PP$
    ist.
]

=== Lösung

+ Für jedes $A in scr(F)$ gilt wegen $X >= 0$
  $
    QQ(A) = EE_PP (X bb(1)_A) >= 0.
  $
  Außerdem ist
  $
    QQ(Omega) = EE_PP (X bb(1)_Omega) = EE_PP (X) = 1.
  $

  Seien nun $(A_n)_(n in NN) subset scr(F)$ paarweise disjunkt. Dann gilt
  punktweise
  $
    bb(1)_(union_(n=1)^infinity A_n)
    = sum_(n=1)^infinity bb(1)_(A_n).
  $
  Mit monotoner Konvergenz folgt
  $
    QQ(union_(n=1)^infinity A_n) & = EE_PP (X bb(1)_(union_(n=1)^infinity A_n)) \
                                 & = EE_PP (sum_(n=1)^infinity X bb(1)_(A_n)) \
                                 & = sum_(n=1)^infinity EE_PP (X bb(1)_(A_n)) \
                                 & = sum_(n=1)^infinity QQ(A_n).
  $
  Also ist $QQ$ ein Wahrscheinlichkeitsmaß auf $(Omega, scr(F))$.

+ Sei $A in scr(F)$ mit $PP(A) = 0$. Dann gilt $bb(1)_A = 0$ für $PP$-fast alle
  $omega$, also auch $X bb(1)_A = 0$ für $PP$-fast alle $omega$. Somit folgt
  $
    QQ(A) = EE_PP (X bb(1)_A) = 0.
  $

  Die Umkehrung gilt im Allgemeinen nicht. Sei zum Beispiel $Omega = {0, 1}$ mit
  der Potenzmengen-$sigma$-Algebra, $PP({0}) = PP({1}) = 1 / 2$ und
  $
    X = 2 bb(1)_({1}).
  $
  Dann ist $X >= 0$ und $EE_PP (X) = 1$. Für $A = {0}$ gilt aber
  $
    QQ(A) = EE_PP (X bb(1)_({0})) = 0,
  $
  während
  $
    PP(A) = 1 / 2 != 0.
  $

+ Beweisen wir die Aussage über Massstheoretische Induktion. Zunächst gilt für
  Indikatorfunktionen $Y = bb(1)_A$ mit $A in scr(F)$ nach Definition von $QQ$
  $
    EE_QQ (bb(1)_A) = QQ(A) = EE_PP (X bb(1)_A).
  $

  Ist nun $Y = sum_(k=1)^m alpha_k bb(1)_(A_k)$ eine einfache nicht-negative
  Zufallsvariable mit $alpha_k >= 0$, so folgt aus der Linearität
  $
    EE_QQ (Y) & = sum_(k=1)^m alpha_k EE_QQ (bb(1)_(A_k)) \
              & = sum_(k=1)^m alpha_k EE_PP (X bb(1)_(A_k)) \
              & = EE_PP (X Y).
  $

  Sei nun $Y >= 0$ beliebig. Dann existieren einfache nicht-negative
  Zufallsvariablen $(Y_n)_(n in NN)$, die punktweise monoton wachsend gegen $Y$
  konvergieren. Mit monotoner Konvergenz bezüglich $QQ$ und $PP$ folgt
  $
    EE_QQ (Y)
    = lim_(n -> infinity) EE_QQ (Y_n)
    = lim_(n -> infinity) EE_PP (X Y_n)
    = EE_PP (X Y).
  $

+ Auf der Menge ${X = 0}$ definieren wir $1 / X$ beliebig, etwa als $0$. Wegen
  $PP(X > 0) = 1$ und b) gilt auch $QQ(X = 0) = 0$, also spielt diese Wahl
  bezüglich $QQ$ keine Rolle. Mit c) erhalten wir
  $
    EE_QQ (1 / X)
    = EE_PP (X (1 / X))
    = EE_PP (bb(1)_({X > 0}))
    = PP(X > 0)
    = 1.
  $
  Also ist $1 / X$ bezüglich $QQ$ integrierbar.

+ Für jedes $A in scr(F)$ gilt mit c)
  $
    R(A)
    = EE_QQ (1 / X bb(1)_A)
    = EE_PP (X (1 / X) bb(1)_A)
    = EE_PP (bb(1)_A bb(1)_({X > 0}))
    = PP(A),
  $
  da $PP(X > 0) = 1$. Somit gilt $R = PP$.
