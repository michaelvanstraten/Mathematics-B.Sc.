#import "common.typ": *

#show: problemset("6")

#exercise([30 = 5 + 5 + 10 + 10])[
  Sei $d in NN$.

  + Zeigen Sie, dass das $beta_d$ *von außen regulär* ist, das heißt für alle
    $A in scr(B)(RR^d)$ gilt
    $
      beta_d (A) = inf{beta_d (U) : U subset RR^d "ist offen und" A subset.eq U}.
    $

  + Zeigen Sie, dass das $beta_d$ *von innen regulär* ist, das heißt für alle
    $A in scr(B)(RR^d)$ gilt
    $
      beta_d (A) = sup{beta_d (K) : K subset RR^d "ist kompakt und" K subset.eq A}.
    $

  + Zeigen Sie, dass $lambda_d$ ebenfalls von außen und von innen regulär ist.

  + Sei $A subset.eq RR^d$. Zeigen Sie, dass $A in scr(L)(RR^d)$, genau dann
    wenn es für alle $epsilon > 0$ eine offene Teilmenge
    $U_epsilon subset.eq RR^d$ und eine abgeschlossene Teilmenge
    $F_epsilon subset RR^d$ gibt, sodass
    $
      F_epsilon subset.eq A subset.eq U_epsilon quad "und" quad beta_d (U_epsilon \\ F_epsilon) lt.eq epsilon.
    $
]

=== Lösung:

+ Bemerken wir kurz, dass für alle $A, B in scr(B)(RR^d)$ mit $A subset.eq B$
  auf Grund der $sigma$-Additivität gilt:
  $
    beta_d (B) & = beta_d (A union (B without A)) \
               & = beta_d (A) + beta_d (B without A).
  $

  Wir zeigen zunächst "$gt.eq$": Aus der Monotonie des Maßes folgt direkt
  $beta_d (A) lt.eq beta_d (U)$ für jede offene Menge $U$ mit $A subset.eq U$.
  Also ist $beta_d (A)$ eine untere Schranke.

  Für "$lt.eq$": Sei $epsilon > 0$ beliebig. Nach *Satz 9.4* existiert eine
  offene Menge $U subset.eq RR^d$ mit $A subset.eq U$ und
  $beta_d (U without A) lt.eq epsilon$.

  Mit unserer Bemerkung folgt:
  $
    beta_d (U) = beta_d (A) + beta_d (U without A) lt.eq beta_d (A) + epsilon.
  $

  Da $epsilon > 0$ beliebig war, folgt
  $inf{beta_d (U) : U "offen", A subset.eq U} lt.eq beta_d (A)$.

  Zusammen erhalten wir die Gleichheit.

+ Sei $A in scr(B)(RR^d)$. Zunächst zeigen wir "$lt.eq$": Aus der Monotonie
  folgt direkt $beta_d (K) lt.eq beta_d (A)$ für jede kompakte Menge
  $K subset.eq A$. Also ist $beta_d (A)$ eine obere Schranke.

  Für "$gt.eq$": Sei $epsilon > 0$ beliebig. Da
  $RR^d without A in scr(B)(RR^d)$, existiert nach *Satz 9.4* eine offene Menge
  $U$ mit $RR^d without A subset.eq U$ und
  $beta_d (U without (RR^d without A)) lt.eq epsilon$.

  Setze $F := RR^d without U$. Dann gilt:
  - $F$ ist abgeschlossen (als Komplement einer offenen Menge),
  - $F subset.eq A$ (da $RR^d without A subset.eq U$ äquivalent zu
    $RR^d without U subset.eq A$ ist),
  - $beta_d (A without F) = beta_d (A inter U) = beta_d (U without (RR^d without A)) lt.eq epsilon$.

  Falls $beta_d (A) < infinity$: Wähle eine kompakte Menge $K subset.eq F$ mit
  $beta_d (F) lt.eq beta_d (K) + epsilon$ (möglich, da $beta_d$ $sigma$-endlich
  ist). Dann folgt:
  $
    beta_d (A) & = beta_d (K) + beta_d (F without K) + beta_d (A without F) \
               & lt.eq beta_d (K) + epsilon + epsilon = beta_d (K) + 2 epsilon.
  $

  Falls $beta_d (A) = infinity$: Für jedes $M > 0$ existiert eine kompakte Menge
  $K subset.eq A$ mit $beta_d (K) gt.eq M$ (da $beta_d$ $sigma$-endlich ist).

  Da $epsilon > 0$ beliebig war, folgt die Gleichheit.

+ Da $lambda_d$ die Vervollständigung von $beta_d$ ist, folgt die Regularität
  von $lambda_d$ aus der Regularität von $beta_d$ und der Konstruktion der
  Vervollständigung: Für $A in scr(L)(RR^d)$ existieren $B, C in scr(B)(RR^d)$
  mit $B subset.eq A subset.eq C$ und $lambda_d (C without B) = 0$. Die
  Regularität von $beta_d$ überträgt sich dann auf $lambda_d$.

+ "$=>$": Sei $A in scr(L)(RR^d)$ und $epsilon > 0$. Nach Definition der
  Vervollständigung existiert $B in scr(B)(RR^d)$ mit $A subset.eq B$ und
  $lambda_d (B without A) = 0$.

  Nach (a) existiert eine offene Menge $U$ mit $B subset.eq U$ und
  $beta_d (U without B) lt.eq epsilon slash 2$.

  Nach (a) existiert auch eine abgeschlossene Menge $F subset.eq A$ mit
  $beta_d (A without F) lt.eq epsilon slash 2$.

  Dann gilt: $F subset.eq A subset.eq U$ und
  $
    beta_d (U without F) lt.eq beta_d (U without B) + beta_d (B without A) + beta_d (A without F) lt.eq epsilon.
  $

  "$arrow.l.double$": Sei für alle $epsilon > 0$ eine offene Menge $U_epsilon$
  und eine abgeschlossene Menge $F_epsilon$ mit
  $F_epsilon subset.eq A subset.eq U_epsilon$ und
  $beta_d (U_epsilon without F_epsilon) lt.eq epsilon$ gegeben.

  Für $epsilon_n = 1 slash n$ setze $B := sect.big_(n=1)^infinity U_(1 slash n)$
  und $C := union.big_(n=1)^infinity F_(1 slash n)$.

  Dann gilt $C subset.eq A subset.eq B$, und da
  $beta_d (U_(1 slash n) without F_(1 slash n)) -> 0$ für $n -> infinity$, folgt
  $lambda_d (B without C) = 0$.

  Da $B, C in scr(B)(RR^d)$ und $lambda_d$ die Vervollständigung von $beta_d$
  ist, folgt $A in scr(L)(RR^d)$.

#pagebreak()

#exercise([20 = 5 + 10 + 5])[
  Seien $(X comma scr(A))$ ein meßbarer Raum und $V$ und $W$
  endlich-dimensionale Vektorräume. Es gelten:

  + Für alle $L in "Hom"(V comma W)$ und $f in scr(M)(X comma scr(A) semi V)$
    gilt $L f in scr(M)(X comma scr(A) semi W)$.

  + Für alle $f in scr(M)(X comma scr(A) semi V)$ und
    $g in scr(M)(X comma scr(A) semi W)$ gilt
    $f times.o g in scr(M)(X comma scr(A) semi V times.o W)$.

  + Sei $norm(-)$ eine Norm auf $V$. Für alle
    $f in scr(M)(X comma scr(A) semi V)$ gilt
    $norm(f) in scr(M)^+(X comma scr(A))$.
]

=== Lösung:

+ In Analysis II haben wir gezeigt, dass jeder Homomorphismus von $V -> W$
  stetig ist.

  Mit *Lemma 10.3* folgt nun, dass $L compose f = L f in scr(M)(X, scr(A), W)$.

+ Wir wissen, dass $scr(M)(X comma scr(A) semi V)$ und
  $scr(M)(X comma scr(A) semi W)$ Vektorräume sind. Somit liegt der Vektor
  $(f times g)(x) := (f(x), g(x))$ im Produktraum
  $scr(M)(X comma scr(A) semi V times W)$, da laut *Lemma 10.4* $f times g$
  genau dann $scr(A)$-meßbar ist, wenn $(f times g)_i$ für $i in {1, 2}$
  $scr(A)$-meßbar sind.

  Die universelle Eigenschaft des Tensorproduktes sagt uns nun, dass es eine
  Bilinearform $tau : V times W -> V times.o W$ gibt. Da Bilinearform ebenfalls
  nach Analysis II stetig sind, folgt wieder mit *Lemma 10.3*, dass
  $tau compose f times g = f times.o g in scr(M)(X comma scr(A) semi V times.o W)$
  ist.

+ In Analysis II haben wir gezeigt, dass jede Norm auf einem
  endlich-dimensionalen Vektorraum äquivalent zu der euklidischen Norm und somit
  stetig ist.

  Mit *Lemma 10.3* folgt nun, dass
  $norm(-) compose f = norm(f) in scr(M)(X, scr(A))$. Da die Norm stets
  nicht-negativ ist, folgt $norm(f) in scr(M)^+(X, scr(A))$.
