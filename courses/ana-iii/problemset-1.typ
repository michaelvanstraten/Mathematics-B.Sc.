#import "common.typ": *

#show: problemset("1")

#exercise([20 = 10 + 10 + 10])[
  Es sei $X$ eine Menge. Beweisen Sie:

  + ${emptyset, X}$ ist eine $sigma$-Algebra.

  + $scr(P)(X)$ ist eine $sigma$-Algebra.

  + Für jede $sigma$-Algebra $scr(A)$ auf $X$ ist die konstante Abbildung
    $
      0 : scr(A) -> [0, infinity]
    $
    ein Maß auf $scr(A)$.
]

=== Beweis

Um zu überprüfen, dass $scr(A)$ eine $sigma$-Algebra ist, müssen folgende
Eigenschaften überprüft werden

$Sigma_1$: $emptyset in scr(A)$,

$Sigma_2$: $forall A in scr(A)$ folgt, dass $X without A in scr(A)$,

$Sigma_3$: Für $(A_n) in scr(A)^NN$ folgt, dass $union.big A_n in scr(A)$.

+ Offensichtlich sind $emptyset$, $X without emptyset$ sowie $emptyset
  without X$ in $scr(A)$. Für jede Folge $(A_n)$ in $scr(A)^NN$ folgt
  zusätzlich, dass $union.big A_n = emptyset$ oder $X$ ist und somit $Sigma_3$
  ebenfalls erfüllt ist.

+ Da $emptyset in powerset(X)$, folgt $Sigma_1$. Wenn $A in powerset(X)$, so
  folgt ebenfalls, dass $X without A subset X$ und somit
  $X without A in powerset(X)$. Sei $(A_n)$ nun eine Folge in $powerset(X)^NN$,
  so folgt, dass $union.big A_n
  subset X$ und somit $Sigma_3$ ebenfalls erfüllt ist.

+ Um zu zeigen, dass $0$ ein Maß für jede $sigma$-Algebra ist, muss gelten, dass

  (M1) $mu(emptyset) = 0$

  (M2) Für $(A_n)$ Folge in $scr(A)^NN$ mit $A_n$ paarweise disjunkt gilt, dass
  $mu(union.big A_n) = sum mu(A_n)$.


#pagebreak()

#exercise([20 = 10 + 10])[
  Sei $X$ eine Menge.

  + Zeigen Sie, dass
    $
      scr(A) := {A subset.eq X : A "ist abzählbar oder" X \\ A "ist abzählbar"} subset.eq scr(P)(X)
    $
    eine $sigma$-Algebra auf $X$ ist.

  + Zeigen Sie, dass $mu : scr(A) -> [0, infinity]$ definiert durch
    $
      mu(A) := cases(
        0 quad & "wenn" A "abzählbar ist",
        1 quad & "sonst"
      )
    $
    ein Maß auf $scr(A)$ ist.
]

=== Beweis


+ Offensichtlich ist $emptyset in scr(A)$.

  Wenn $A in scr(A)$, ist entweder $A$ abzählbar, in welchem Fall $X without A$
  in $scr(A)$ ist, da $X without (X without A) = A$ abzählbar ist, oder $X
  without A$ ist abzählbar.

  Sei $(A_n)$ nun eine Folge in $scr(A)^NN$, so ist $union.big A_n$ entweder
  abzählbar, und somit wieder in $scr(A)$, oder es existiert mindestens ein $i
  in NN$, sodass $A_i$ überabzählbar ist. Somit ist $X without union.big A_n =
  inter.big X without A_n$ abzählbar, da $X without A_i$ abzählbar sein muss.

+ Es ist offensichtlich, dass $mu(emptyset) = 0$.

  Sei $(A_n)$ nun eine Folge in $scr(A)^NN$. Falls $union.big A_n$ abzählbar
  ist, folgt, dass jedes $A_n$ abzählbar sein muss und somit
  $
    0 & = mu(union.big A_n) \
      & = sum mu(A_n) \
      & = sum 0 \
      & = 0
  $
  ist. Anderfalls existiert ein $i in NN$, sodass $A_i$ überabzählbar ist,
  woraus folgt
  $
    mu(union.big A_n) = 1 + mu(union.big A_n without A_i)
  $
  Da $union.big A_n subset X$ und $X without A_i$ abzählbar ist, folgt, dass
  $union.big A_n without A_i$ abzählbar sein muss und somit
  $
    mu(union.big A_n) & = mu(A_i) + mu(union.big A_n without A_i) \
                      & = 1 + 0 \
                      & = sum mu(A_n)
  $
  gilt.
