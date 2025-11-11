#import "common.typ": *

#show: problemset("3")

#set enum(numbering: "(i)", indent: 1em)

#exercise([20 = 10 + 10])[
  Vervollständigen Sie den Beweis von Proposition 4.3.

  + Sei $(X comma scr(A))$ ein meßbarer Raum. Seien
    $f comma g in scr(M)^+(X comma scr(A))$. Zeigen Sie, dass
    $f dot.c g in scr(M)^+(X comma scr(A))$.

  + Zeigen Sie, dass für jede Folge $(f_n) in scr(M)^+(X comma scr(A))^NN$
    $
      inf_(n in NN) f_n in scr(M)^+(X comma scr(A))
    $
    gilt und außerdem, dass für jede punktweise konvergente Folge
    $(f_n) in scr(M)^+(X comma scr(A))^NN$ auch
    $lim_(n arrow.r infinity) f_n in scr(M)^+(X comma scr(A))$ gilt.
]

=== Lösung
Benutzen wir den Fakt das $scr(B)([0, infinity])$ durch Quader der Form
$(a, infinity]$ mit $a in [0, infinity)$ erzeugt wird.

+ Sei $a in [0, infinity)$. Für alle $x in X$ gilt das $(f dot g)(x) > a$ genau
  dann wenn es $q in QQ$ gibt sodass $f(x) > q$ und $g(x) > a/q$. Also gilt
  $
    (f dot g)^(-1)((a, infinity])
    = union.big_(q in QQ)
    f^(-1)((q, infinity] inter [0, infinity] )
    inter
    g^(-1)\(\(a/q, infinity\] inter [0, infinity]\)
  $
  Da $QQ$ abzählbar ist und für alle $q in QQ$ folgt
  $
    f^(-1)((q, infinity inter [0, infinity]) in scr(A)
    "und"
    g^(-1)((a/q, infinity inter [0, infinity]) in scr(A)
  $
  folgt mit $Sigma$6 und $Sigma$3 das $(f dot g)^(-1)((a, infinity]) in scr(A)$
  ist.

+ Für alle $a in [0, infinity)$ gilt
  $
    \(inf_(n in NN) f_n\)^(-1)((a, infinity]) &= { x in X : inf_(n in NN) f_n (x) > a } \
    &= inter.big_(n in NN) { x in X : f_n (x) > a } \
    &= inter.big_(n in NN) f_n^(-1)((a, infinity]) in scr(A).
  $
  Also ist $inf_(n in NN) f_n in scr(M)^+ (X, scr(A))$.

  Außerdem gilt
  $
    (lim_(n -> infinity) f_n)^(-1)((a, infinity])
    & = {x in X : lim_(n -> infinity) f_n (x) > a} \
    & = union.big_(k in NN) inter.big_(n >= k in NN) {x in X : f_n (x) > a} \
    & = union.big_(k in NN) inter.big_(n >= k in NN) f_n^(-1)((a, infinity]) in scr(A).
  $
  Mit $Sigma$3+6 folgt nun
  $lim_(n arrow.r infinity) f_n in scr(M)^+(X comma scr(A))$.

#pagebreak()

#set enum(numbering: "(a).(i)", indent: 1em)

#exercise([30 = 10 + 10 + 10])[
  + Sei $(X comma scr(A) comma mu)$ ein Maßraum und
    $f in scr(M)^+(X comma scr(A))$.

    + Zeigen Sie die *#smallcaps[Markow]-Ungleichung*, das heißt für alle
      $epsilon > 0$ gilt
      $
        mu({x : f(x) gt.eq epsilon}) lt.eq 1/epsilon integral_X f mu.
      $

    + Zeigen Sie die *#smallcaps[Tschebyschew]-Ungleichung*, das heißt für alle
      $epsilon > 0$ und $p in [1 comma infinity)$ gilt
      $
        mu({x : f(x) gt.eq epsilon}) lt.eq 1/(epsilon^p) integral_X f^p mu.
      $

  + Sei $d in NN$. Bestimmen Sie das Maß
    $
      beta_n (square(v_0 comma dots.h.c comma v_d))
    $
    der von $v_0 comma dots.h.c comma v_d in RR^n$ aufgespannte Teilmenge
    $
      square(v_0 comma dots.h.c comma v_d) := {sum_(k=0)^d t_k v_k :
        (t_0 comma dots.h.c comma t_d) in [0 comma 1]^(d+1)}.
    $
]

=== Lösung

+ #linebreak()
  + Wählen wir $s in scr(S)^+(X, scr(A))$ so das $s <= f$ und
    $s(f^(-1)([epsilon,
          infinity])) = epsilon$ so folgt das
    $
      integral_X f mu & >= sum_(a in s(X)) a mu(s^(-1)(a)) \
                      & >= epsilon dot mu(s^(-1)(epsilon)) \
                      & = epsilon dot mu({ x : f(x) >= epsilon})
    $
    Woraus folgt das
    $
      mu({x : f(x) >= epsilon}) <= 1/epsilon integral_X f mu.
    $

  + TO-DO

+ Wir definieren $S := {v_0, ..., v_d}$ sowie die lineare Abbildung
  $T_S in op("End")(RR^n)$ durch
  $
    T_S := mat(; v_0, ..., v_(n-1); ;) quad "mit" v_i = 0 "für" i > d.
  $

  *Betrachten wir zunächst den Fall $d + 1 <= n$*. Dann gilt
  $
    T_S ([0,1]^n) & = { sum_(k=0)^(n-1) t_k v_k : (t_0, ..., t_(n-1)) in [0 comma 1]^n } \
    & = square(v_0, ..., v_(n-1)) \
    & = square(v_0, ..., v_d),
  $
  da $v_i = 0$ für $i > d$. Mit Satz 3.16 erhalten wir
  $
    beta_n (square(v_0, ..., v_d)) & = beta_n (T_S ([0,1]^n)) \
                                   & = abs(det(T_S)) beta_n ([0,1]^n) \
                                   & = abs(det(T_S)) dot delta_(d+1, n),
  $
  wobei $delta_(d+1, n)$ das Kronecker-Delta bezeichnet, d.h.
  $delta_(d+1, n) = 1$ falls $d+1 = n$ und $0$ sonst.

  *Betrachten wir nun den Fall $d + 1 > n$*.

  Für jede $n$-elementige Teilmenge $A subset S$ mit $abs(A) = n$ definieren wir
  $
    P(A) := sum_(v in S without A) v + square(A).
  $
  Dies ist eine Translation des von $A$ aufgespannten Parallelotops. Dann gilt
  $
    union.big_(A subset S : abs(A) = n) P(A) = square(S).
  $
  Zusätzlich gilt $beta_n (P(A)) = beta_n (square(A))$ (da Translation
  maßerhaltend ist) und $beta_n (P(A) inter P(B)) = 0$ für $A != B$, da die
  Schnittmengen in niederdimensionalen affinen Teilräumen liegen und somit
  Nullmengen sind.

  Somit folgt mit der Additivität des Maßes
  $
    beta_n (square(S)) & = beta_n (union.big_(A subset S : abs(A)=n) P(A)) \
                       & = sum_(A subset S : abs(A)=n) beta_n (P(A)) \
                       & = sum_(A subset S : abs(A)=n) beta_n (square(A)) \
                       & = sum_(A subset S : abs(A)=n) abs(det(T_A)),
  $
  wobei $T_A$ die durch die Vektoren in $A$ definierte lineare Abbildung ist
  (analog zu Fall $d + 1 <= n$).
