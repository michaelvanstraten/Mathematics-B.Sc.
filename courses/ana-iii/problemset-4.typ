#import "common.typ": *

#show: problemset("4")

#exercise([30 = 10 + 5+ 5 + 10])[
  Seien $(X, scr(A), mu)$ ein Maßraum und $(X, macron(scr(A)), macron(mu))$
  seine Vervollständigung.

  + Vervollständigen Sie den Beweis von Satz 5.10. indem Sie die Eigenschaft
    (M2) nachweisen.

  + Zeigen Sie, dass $scr(M)^+(X, scr(A)) subset scr(M)^+(X, macron(scr(A)))$.

  + Zeigen Sie, dass für alle $f in scr(M)^+(X, scr(A))$
    $
      integral_X f mu = integral_X f macron(mu).
    $

  + Sei $f in scr(M)^+(X, scr(A))$. Zeigen Sie, dass wenn
    $
      integral_X f mu < infinity,
    $
    dann gilt $f(x) < infinity$ für $mu$-fast alle $x in X$.
]

=== Lösung:

+ Sei $(A_n) in macron(scr(A))^NN$ paarweise disjunkt. Dann existieren folgen
  $(A_n^plus.minus) in scr(A)^NN$ sodass für alle $n in NN$ gilt
  $
    A_n^- subset.eq A_n subset.eq A_n^+ quad
    "und" quad mu(A_n^+ without A_n^-) = 0.
  $

  Aus dem Beweis der Eigenschaft $Sigma$3 wissen wir zusätzlich das
  $
    macron(mu)(union.big_(n=1)^infinity A_n)
    = mu(union.big_(n=1)^infinity A_n^-).
  $

  Da alle $A_n$ paarweise disjunkt sind und $A_n^- subset.eq A_n$ folgt auch das
  alle $A_n^-$ paarweise disjunkt sind.

  Mit Eigenschaft M2 der Maßes $mu$ erhalten wir somit
  $
    mu(union.big_(n=1)^infinity A_n^-)
    = sum_(n=1)^infinity mu(A_n^-).
  $
  Das $macron(mu)$-Maß der $A_n$ ist allerdings definiert als das $mu$-Maß der
  $A_n^-$.

  Und so folgt Eigenschaft M2 für das $macron(mu)$-Maß
  $
    macron(mu)(union.big_(n=1)^infinity A_n)
    = sum_(n=1)^infinity macron(mu)(A_n).
  $

+ Die funktion $f : X -> [0, infinity]$ ist genau dann in $scr(M)^+(X, scr(A))$
  wenn $forall B in scr(B)([0, infinity])$ folgt das $A := f^(-1)(B) in scr(A)$
  ist.

  Die Menge $A$ ist genau dann in $macron(scr(A))$ wenn $A^plus.minus in scr(A)$
  existieren so das $A^- subset.eq A subset.eq A^+$ und $mu(A^+ \ A^-) = 0$ ist.
  Wählen wir $A^plus.minus = A$ so folgt $A in macron(scr(A))$ sofort.

+ TODO

+ Nehmen wir an das $f(x) = infinity$ auf einer nicht $mu$-null Menge. Dann
  konstruiere man ein $s in scr(S)^+(X, scr(A))$ mit
  $
    s(x) := cases(infinity quad & "wenn" x in f^(-1)(infinity), 0 & "sonst").
  $
  So folgt $s <= f$ und
  $
    integral_X s mu <= integral_X f mu
  $
  aber
  $
    integral_X s mu & = sum_(a in s(X)) a dot mu(s^(-1)(a)) \
                    & = infinity dot underbrace(mu(s^(-1)(infinity)), > 0) \
                    & = infinity.
  $

  Somit muss $f(x) < infinity$ für $mu$-fall alle $x in X$.

#pagebreak()

#exercise([20 = 10 + 5 + 5])[
  Sei $lambda > 0$. Wir betrachten $NN_0$ mit dem Zählmaß $mu_\#$. Die
  $p_lambda : NN_0 -> [0, infinity]$ definiert durch
  $
    p_lambda (k) := e^(-lambda) (lambda^k) / (k!)
  $
  ist trivialerweise $scr(P)(NN_0)$-meßbar. Das Maß
  $p_lambda mu_\# : scr(P)(NN_0) -> [0, infinity]$ ist die *Poisson-Verteilung*
  mit mittlerer Ereignisrate $lambda$.

  + Zeigen Sie, dass $p_lambda mu_\#$ ein *Wahrscheinlichkeitsmaß* ist, das
    heißt $p_lambda mu_\# (NN_0) = 1$.

  + Berechnen Sie den *Erwarungswert*
    $
      E_lambda := integral_(NN_0) n space p_lambda mu_\# (d n).
    $

  + Berechnen Sie die *Varianz*
    $
      "Var"_lambda := integral_(NN_0) (n - E_lambda)^2 space p_lambda mu_\# (d n).
    $
]

=== Lösung:

+ Wenn $p$ $mu$-meßbar ist sagt uns Satz 4.25 das dass Ma0 $p mu$ konkret
  wiefolgt ausgerechnet werden kann
  $ (p mu)(A) = integral_X p 1_A mu. $

  Also folgt für das $p_lambda mu_\#$ Maß und $N_0 subset scr(P)(N_0)$ das
  $
    (p_lambda mu_\#)(N_0) = integral_N_0 p_lambda 1_N_0 mu_\#.
  $
  Mit der Identität aus Beispiel 4.12 folgt nun
  $
    integral_N_0 p_lambda 1_N_0 mu_\# & = sum_(n=0)^infinity p_lambda (n) \
    & = sum_(n=0)^infinity e^(-lambda) lambda^n/n! \
    & = e^(-lambda) sum_(n=0)^infinity lambda^n/n! \
    & = e^(-lambda) e^lambda \
    & = 1.
  $

+ Wenn $p$ $mu$-meßbar ist sagt uns Satz 4.25 das dass integral mit Maß $p mu$
  über die Funktion $f$ als das integral mit dem Maß $mu$ über die Funktion
  $f dot p$ geschrieben werden kann.

  Wenn wir dies auf die Defintion des Erwarungswerts an so folgt
  $
    E_lambda & = integral_(NN_0) n space p_lambda mu_\# (d n) \
             & = integral_(NN_0) n dot p_lambda mu_\# (d n) \
             & = sum_(n=0)^infinity n dot p_lambda \
             & = e^(-lambda) sum_(n=0)^infinity n lambda^n / n! \
             & = e^(-lambda) sum_(n=1)^infinity n lambda^n / n! \
             & = lambda e^(-lambda) sum_(n=1)^infinity lambda^(n-1) / (n-1)! \
             & = lambda e^(-lambda) sum_(n=0)^infinity lambda^n / n! \
             & = lambda.
  $

+ Mit dem gleichen Trick wie in der (b) folgt
  $
    "Var"_lambda & = integral_(NN_0) (n - E_lambda)^2 space p_lambda mu_\# (d n) \
    & = integral_(NN_0) (n^2 - 2 E_lambda n + E_lambda^2) dot p_lambda mu_\# \
    & = integral_(NN_0) n^2 dot p_lambda mu_\#
    - 2 E_lambda underbrace(integral_(NN_0) n p_lambda, = lambda) mu_\#
    + E_lambda^2 underbrace(integral_(NN_0) p_lambda mu_\#, = 1) \
    & = integral_(NN_0) n^2 dot p_lambda mu_\#
    - 2 underbrace(E_lambda, = lambda) dot lambda
    + underbrace(E_lambda, = lambda)^2 \
    & = integral_(NN_0) n^2 dot p_lambda mu_\# - lambda^2 \
    & = e^(-lambda) sum_(n=0)^infinity n^2 lambda^n/n! - lambda^2 \
    & = e^(-lambda) sum_(n=1)^infinity (n(n-1) + n) lambda^n/n! - lambda^2 \
    & = e^(-lambda) sum_(n=1)^infinity n(n-1) lambda^n/n!
    + underbrace(e^(-lambda) sum_(n=1)^infinity n lambda^n/n!, = E_lambda)
    - lambda^2 \
    & = e^(-lambda) sum_(n=1)^infinity n(n-1) lambda^n/n! + lambda - lambda^2 \
    & = lambda^2 e^(-lambda) sum_(n=2)^infinity lambda^(n-2)/(n-2)!
    + lambda - lambda^2 \
    & = lambda^2 e^(-lambda) sum_(n=2)^infinity lambda^(n-2)/(n-2)!
    + lambda - lambda^2 \
    & = lambda^2 dot 1 + lambda - lambda^2 \
    & = lambda.
  $
