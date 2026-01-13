#import "common.typ": *

#show: problemset("8")

#exercise([35 = 10 + 10 + 10 + 5])[
  Sei $nu gt.eq 0$. Die *#smallcaps[Bessel]-Funktion der Ordnung $nu$*,
  $J_nu : (0, infinity) -> CC$, ist definiert durch
  $
    J_nu (x) := ((x slash 2)^nu) / (sqrt(pi) Gamma(nu + 1 slash 2)) f_nu (x) quad "mit" quad f_nu (x) := integral_0^pi sin(t)^(2 nu) e^(-i x cos(t)) dif t.
  $

  + Zeigen Sie, dass
    $
      f_nu'' = f_(nu+1) - f_nu, quad (2 nu + 1) f_nu' = -x f_(nu+1)
    $
    und somit
    $
      f_nu'' + (2 nu + 1) / x f_nu' + f_nu = 0.
    $

  + Zeigen Sie, $J_nu$ die #smallcaps[Bessel]sche Differentialgleichung
    $
      J_nu'' + 1 / x J_nu' + (1 - nu^2 / x^2) J_nu = 0
    $
    erfüllt.

  + Zeigen Sie, dass
    $
      dif / (dif x) (x^(-nu) J_nu) = -x^(-nu) J_(nu+1).
    $

  + Zeigen Sie, dass
    $
      J_(1 slash 2) (x) = sqrt(2 / pi) (sin(x)) / sqrt(x).
    $
]

#exercise([15 = 10 + 5])[
  Seien $d in NN_0$, $A in scr(B)(RR^d)$, und $v in RR^(d+1)$. Der *Kegel mit
  Basis $A$ und Spitze $v$* ist
  $
    "cone"(A, v) := {(1 - t)(x, 0) + t v in RR^(d+1) : x in A, t in [0, 1]}.
  $

  + Bestimmen Sie $beta_(d+1) ("cone"(A, v))$.

  + Stellen Sie die Simplices $Delta(v_0, ..., v_n)$ als iterierte Kegel dar und
    bestimmen Sie $beta_d (Delta(v_0, ..., v_n))$ mit Hilfe dieser.
]
