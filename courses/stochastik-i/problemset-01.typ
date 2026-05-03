#import "common.typ": *

#show: problemset("1")

#exercise([3 + 3])[
  Es seien $Omega$ und $E$ beliebige Mengen.

  + Es sei $scr(A)$ eine $sigma$-Algebra auf $Omega$ und $B in scr(A)$. Zeigen
    Sie, dass $scr(F) := {A inter B : A in scr(A)}$ eine $sigma$-Algebra auf $B$
    ist. Gilt dies immer noch, wenn $B$ eine Teilmenge von $Omega$ ist, die
    nicht zu $scr(A)$ gehört?

  + Wir betrachten eine Funktion $f : Omega -> E$. Es sei $scr(E)$ eine
    $sigma$-Algebra auf $E$ und
    $scr(C) := {A subset Omega : "es existiert ein" B in scr(E) "mit" A = f^(-1)(B)}$.
    Hierbei ist $f^(-1)(B) := {x in Omega : f(x) in B}$ das Urbild von $B$ unter
    $f$. Zeigen Sie, dass $scr(C)$ eine $sigma$-Algebra auf $Omega$ ist.
]

=== Lösung

#pagebreak()

#exercise([2 + 2 + 2])[
  Sei $Omega$ eine überabzählbare Menge. Zeigen Sie:

  + Das Mengensystem
    $
      scr(F) := {F subset.eq Omega | F "oder" F^c "ist höchstens abzählbar"}
    $
    ist eine $sigma$-Algebra.

  + Das System der einelementigen Teilmengen von $Omega$, also
    $scr(G) := {{omega} | omega in Omega}$, erzeugt $scr(F)$, d.h.
    $scr(F) = sigma(scr(G))$.

  + Die durch
    $
      PP(F) := cases(
        0 quad & "falls" F "höchstens abzählbar ist",
        1 quad & "falls" F^c "höchstens abzählbar ist",
      )
    $
    definierte Mengenfunktion $PP : scr(F) -> [0, 1]$ ist ein
    Wahrscheinlichkeitsmaß.
]

=== Lösung

#pagebreak()

#exercise([2 + 4])[
  Auf einem Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$ betrachten wir endlich
  viele Ereignisse $A_r$, $r = 1, dots, n$. Es sei bekannt, dass mit
  Wahrscheinlichkeit 1 mindestens eines der Ereignisse $A_r$, $r = 1, dots, n$,
  eintritt. Außerdem seien alle Ereignisse gleichwahrscheinlich, d.h. es gibt
  ein $p in (0, 1)$, so dass $PP(A_r) = p$ für alle $r = 1, dots, n$ gilt.
  Ebenso existiert ein $q in (0, 1)$, so dass $PP(A_r inter A_s) = q$ für alle
  $r eq.not s$ gilt.

  + Angenommen es treten mit Wahrscheinlichkeit 1 nicht mehr als zwei der
    Ereignisse $A_r$, $r = 1, dots, n$, ein. Zeigen Sie, dass dann
    $p gt.eq 1\/n$ und $q lt.eq 2\/n$ gilt.

  + Angenommen es treten mit Wahrscheinlichkeit 1 nicht mehr als drei der
    Ereignisse $A_r$, $r = 1, dots, n$, ein. Die Wahrscheinlichkeit, dass
    mindestens zwei eintreten, sei gleich $1\/2$ und es existiere ein
    $x in (0, 1)$, so dass $PP(A_r inter A_s inter A_t) = x$ für alle
    $1 lt.eq r < s < t lt.eq n$ gilt. Zeigen Sie, dass dann $p gt.eq 3\/(2n)$
    und $q lt.eq 4\/n$ gilt.
]

=== Lösung

+ Da das Wahrscheinlichkeitsmaß subadditiv ist und mit Wahrscheinlichkeit 1
  mindestens eines der Ereignisse $A_r$, $r = 1, dots, n$, eintritt, folgt
  $
    1 = PP(union.big_(r = 1)^n A_r)
    <= sum_(r = 1)^n PP(A_r)
    = n p,
  $
  also $p >= 1\/n$.

  Mit der Siebformel folgt zudem, dass
  $
    1 = PP(union.big_(r = 1)^n A_r)
    = sum_(k=1)^n (-1)^(k+1) binom(n, k) s_k,
  $
  wobei $s_k := PP(A_(i_1) inter dots.c inter A_(i_k))$ für beliebige paarweise
  verschiedene Indizes den gemeinsamen Wert bezeichnet, der nach Voraussetzung
  wohldefiniert ist (insbesondere $s_1 = p$ und $s_2 = q$). Für $k >= 3$ gilt
  $s_k = 0$, da $A_(i_1) inter dots.c inter A_(i_k)$ im Ereignis enthalten ist,
  dass mindestens 3 Ereignisse gleichzeitig eintreten, welches nach
  Voraussetzung Wahrscheinlichkeit 0 hat. Somit folgt
  $
    1 = n p - binom(n, 2) q,
  $
  also
  $
    q = (2(n p - 1)) / (n(n - 1)).
  $
  Da $p <= 1$, ergibt sich $n p <= n$ und damit
  $
    q <= (2(n - 1)) / (n(n - 1)) = 2 / n.
  $


+ Die Summe $sum_(r < s) PP(A_r inter A_s)$ zählt jedes Paar einmal. Treten
  genau zwei Ereignisse ein, wird dies korrekt einmal gezählt. Treten jedoch
  drei Ereignisse $A_r, A_s, A_t$ ein, so treten alle drei Paarschnitte
  $A_r inter A_s$, $A_r inter A_t$, $A_s inter A_t$ ein. Da jeder
  Dreifachschnitt $A_r inter A_s inter A_t$ also 2-mal zu viel gezählt wird,
  folgt
  $
    1 / 2 & = PP(union.big_(r < s) (A_r inter A_s)) \
    & = sum_(r < s) PP(A_r inter A_s) - 2 sum_(r < s < t) PP(A_r inter A_s inter A_t) \
    & = binom(n, 2) q - 2 binom(n, 3) x.
  $

  Analog zu Teil a) liefert die Siebformel (mit $s_k = 0$ für $k >= 4$)
  $
    1 & = n p - binom(n, 2) q + binom(n, 3) x \
      & = n p - (binom(n, 2) q - 2 binom(n, 3) x) - binom(n, 3) x \
      & = n p - 1 / 2 - binom(n, 3) x.
  $
  Da $x > 0$, folgt $1 <= n p - 1\/2$, also $p >= 3\/(2n)$.

  Aus der obigen Gleichung ergibt sich $binom(n, 3) x = n p - 3\/2$. Einsetzen
  in die Identität für $1\/2$ liefert
  $
    binom(n, 2) q = 1 / 2 + 2(n p - 3 / 2) = 2 n p - 5 / 2,
  $
  also
  $
    q = (4 n p - 5) / (n(n - 1)).
  $
  Da $p <= 1$, folgt
  $
    q <= (4 n - 5) / (n(n - 1)) <= 4 / n,
  $
  wobei die letzte Ungleichung aus $4n - 5 <= 4(n - 1)$ folgt.

#pagebreak()

#exercise([5 + 1])[
  Wir betrachten ein herkömmliches K.-o.-Turnier (wie etwa in Wimbledon) mit $n$
  Runden und festgelegtem Turnierbaum. Es gibt keine Entscheidungsspiele für die
  Plätze $3, dots, 2^n$. Jeder Spieler $i$ hat einen individuellen Stärkefaktor
  $s_i > 0$. Spielt Spieler $i$ gegen Spieler $j$, so stehen die Gewinnchancen
  $s_i : s_j$.

  + Geben Sie einen geeigneten Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$ zur
    Modellierung des gesamten Turniers an.

  + Angenommen alle Spieler sind gleich stark, d.h. $s_i = s_j$ für alle $i, j$,
    und Sie sind nur am Sieger des Turniers interessiert. Würden Sie das
    Experiment dann immer noch wie unter a) modellieren?
]

=== Lösung
