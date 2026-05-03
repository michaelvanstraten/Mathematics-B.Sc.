#import "common.typ": *

#show: problemset("2")

#exercise([2 + 2 + 2])[
  Es gibt eine neue Tom und Jerry Kollektion von Überraschungseiern, welche als
  Spielzeug entweder eine Figur von Tom oder eine von Jerry enthalten. Ein Ü-Ei
  kostet 1 Euro. Die 6-jährige Mia möchte ihre bestehende Sammlung durch die
  Figuren der neuen Kollektion erweitern, hat allerdings nur ein Kapital von 3
  Euro und erwägt die folgenden Strategien:

  + Solange Überraschungseier kaufen, bis sie kein Geld mehr hat.

  + Solange Überraschungseier kaufen, bis sie mindestens eine Jerry-Figur hat.

  + Solange Überraschungseier kaufen, bis sie mindestens eine Jerry- und eine
    Tom-Figur hat.

  Bei jedem Ü-Ei sei die Wahrscheinlichkeit beider Figurentypen gleich. Geben
  Sie einen geeigneten Wahrscheinlichkeitsraum an und berechnen Sie für jede der
  drei Strategien die Wahrscheinlichkeit, genau eine Tom-Figur zu erhalten,
  sowie die Wahrscheinlichkeit, mehr Jerry- als Tom-Figuren zu erhalten.
]

=== Lösung

Wir bezeichnen im Folgenden mit $A_1$ das Ereignis, genau eine Tom-Figur zu
erhalten, und mit $A_2$ das Ereignis, mehr Jerry- als Tom-Figuren zu erhalten.

+ Mia hat drei Euro, das heißt sie kann drei Ü-Eier kaufen, bis sie kein Geld
  mehr hat. Bei jedem Kauf kann sie entweder Tom oder Jerry erhalten. Wir wählen
  somit $Omega = {T, J}^3$ sowie $scr(F) = scr(P)(Omega)$. Da jedes Ergebnis
  gleich wahrscheinlich ist, handelt es sich um einen Laplace-Raum.

  Für das Ereignis genau eine Tom-Figur gilt
  $
    A_1 = {(T, J, J), (J, T, J), (J, J, T)}
  $
  und somit
  $
    PP(A_1) = abs(A_1)/abs(Omega) = 3 / 2^3 = 3 / 8.
  $

  Für das Ereignis mehr Jerry- als Tom-Figuren gilt
  $
    A_2 = {(J, J, J), (T, J, J), (J, T, J), (J, J, T)}
  $
  und somit
  $
    PP(A_2) = abs(A_2)/abs(Omega) = 4 / 8 = 1 / 2.
  $

+ Mia kauft, bis sie eine Jerry-Figur erhält oder kein Geld mehr hat. Wir wählen
  den Ergebnisraum
  $
    Omega = {(J), (T, J), (T, T, J), (T, T, T)}
  $
  und $scr(F) = scr(P)(Omega)$. Wir definieren die Zähldichte
  $p : Omega -> [0, 1]$ durch
  $
    p(omega) := (1/2)^abs(omega).
  $
  Es gilt
  $
    sum_(omega in Omega) p(omega) = 1/2 + 1/4 + 1/8 + 1/8 = 1,
  $
  also definiert $p$ ein Wahrscheinlichkeitsmaß $PP$ auf $scr(F)$ mit
  $PP(A subset.eq Omega) = sum_(omega in A) p(omega)$.

  Für das Ereignis genau eine Tom-Figur gilt
  $
    PP(A_1) = PP({(T, J)}) = p((T, J)) = (1/2)^2 = 1/4.
  $

  Für das Ereignis mehr Jerry- als Tom-Figuren gilt
  $
    PP(A_2) = PP({(J)}) = p((J)) = 1/2.
  $

+ Mia kauft, bis sie mindestens eine Jerry- und eine Tom-Figur hat oder kein
  Geld mehr hat. Wir wählen den Ergebnisraum
  $
    Omega = {(J, T), (T, J), (J, J, T), (T, T, J), (J, J, J), (T, T, T)}
  $
  und $scr(F) = scr(P)(Omega)$. Wir definieren die Zähldichte
  $p : Omega -> [0, 1]$ durch
  $
    p(omega) := (1/2)^abs(omega).
  $
  Es gilt
  $
    sum_(omega in Omega) p(omega) = 1/4 + 1/4 + 1/8 + 1/8 + 1/8 + 1/8 = 1,
  $
  also definiert $p$ ein Wahrscheinlichkeitsmaß $PP$ auf $scr(F)$.

  Für das Ereignis genau eine Tom-Figur gilt
  $
    PP(A_1) = PP({(J, T), (T, J), (J, J, T)}) = 1/4 + 1/4 + 1/8 = 5/8.
  $

  Für das Ereignis mehr Jerry- als Tom-Figuren gilt
  $
    PP(A_2) = PP({(J, J, J), (J, J, T)}) = 1/8 + 1/8 = 1/4.
  $


#pagebreak()

#exercise([3 + 3])[
  Schreiben Sie in den folgenden Teilaufgaben jeweils zuerst einen geeigneten
  Wahrscheinlichkeitsraum auf und berechnen Sie anschließend die
  Wahrscheinlichkeiten für geeignet definierte Ereignisse, um die Fragen
  beantworten zu können.

  + Sechs Tassen und Untertassen kommen in Paaren: Es gibt zwei Tassen und
    Untertassen, die rot sind, zwei weiße und zwei blaue. Die Tassen werden
    zufällig auf die Untertassen gestellt. Ermitteln Sie die Wahrscheinlichkeit,
    dass keine Tasse auf einer Untertasse mit derselben Farbe steht.

  + A spielt gegen B in der Reihenfolge ABBAABBAABBAA$dots$ mit zwei Würfeln. A
    gewinnt, falls die Augensumme 6 ist, und B gewinnt, falls die Augensumme 7
    ist. Wie hoch ist die Gewinnwahrscheinlichkeit von A?
]

=== Lösung

+ Wir wählen als Ergebnisraum $Omega$ die Anordnung der Tassen, welche auf die
  Untertassen gestellt werden. Dabei bezeichnen wir die sechs Positionen mit
  $
    Omega := {a in {R, W, B}^6 "mit" a_i inter a_j inter a_k = emptyset
      "für" 1 <= i < j < k <= 6}.
  $
  Es gibt genau $6!$ Möglichkeiten, sechs Tassen anzuordnen. Da die Tassen einer
  Farbe allerdings nicht unterscheidbar sind, müssen wir die Möglichkeiten um
  den Faktor $2 * 2 * 2 = 8$ reduzieren, also folgt $abs(Omega) = 6!/8 = 90$.

  Da jede Anordnung gleich wahrscheinlich ist, handelt es sich bei
  $(Omega, scr(P)(Omega))$ um einen Laplace-Raum.

  Wählen wir die folgende Untertassen-Anordnung $R R W W B B$, so gibt es genau
  zwei Möglichkeiten, die Tassen anzuordnen, wenn die Tassen beider Farben auf
  der gleichen Untertasse stehen sollen: $W W B B R R$ und $B B R R W W$. Es
  gibt zwei Möglichkeiten, verschiedenfarbige Tassen auf $R R$ zu stellen: $W B$
  und $B W$; auf $W W$ können $R B$ oder $B R$ stehen; und auf $B B$ können
  $R W$ oder $W R$ stehen. Also insgesamt $2 + 2 * 2 * 2 = 10$ Möglichkeiten.

  Das Ereignis $A = "keine Tasse auf einer Untertasse mit derselben Farbe"$ hat
  somit $10$ Ergebnisse. Damit folgt die Wahrscheinlichkeit
  $ PP(A) = 10 / 90 = 1/9. $

+ Wir wählen $Omega$ als
  $
    Omega := {n in NN}
  $
  und definieren eine Zähldichte $p : Omega -> [0, 1]$ wie folgt:
  $
    p(omega) := 1/6 (5/6)^(omega - 1).
  $
  Somit folgt
  $
    sum_(omega in Omega) p(omega) & = 1/6 sum_(omega in Omega) (5/6)^(omega - 1) \
                                  & = 1/6 sum_(k = 0)^infinity (5/6)^k \
                                  & = 1/6 dot 1/(1 - 5/6) \
                                  & = 1.
  $

  Wir bezeichnen mit $Omega_w$ die Ergebnisse eines zweifachen Würfelwurfs, also
  $
    Omega_w := {{i, j}: i,j in {1, ..., 6}}.
  $
  Die Augensumme sechs zu würfeln entspricht dem Ereignis
  $
    A_6 := {{1, 5}, {2, 4}, {3, 3}};
  $
  die Augensumme sieben zu würfeln entspricht dem Ereignis
  $
    A_7 := {{1, 6}, {2, 5}, {3, 4}}.
  $
  Es gibt insgesamt $6 * 6 / 2 = 18$ Ergebnisse in $Omega_w$, welche alle gleich
  wahrscheinlich sind. Somit handelt es sich um einen Laplace-Raum. Die
  Wahrscheinlichkeit für eine Sieben sowie für eine Sechs beträgt somit
  $PP(A_6) = PP(A_7) = 1/6$.

  Spieler A kann in den Runden $1, 3, 4, ...$ gewinnen, somit ergibt sich
  $
    PP("A gewinnt") & = sum_(omega in "A gewinnt") p(omega) \
    &= 1/6 (sum_(k = 0)^infinity (5/6)^(4k + 3) + sum_(k = 0)^infinity (5/6)^(4k)) \
    &= 1/6 ((5/6)^3 sum_(k = 0)^infinity (5/6)^(4k) + sum_(k = 0)^infinity (5/6)^(4k)) \
    &= 1/6 ((5/6)^3 1/(1 - (5/6)^4) + sum_(k = 0)^infinity (5/6)^(4k)) \
    &= 1/6 ((5/6)^3 1/(1 - (5/6)^4) + 1/(1 - (5/6)^4)) \
    &= 31/61.
  $

#pagebreak()

#exercise([2 + 2 + 2])[
  Bei einer Stichwahl zwischen Kandidaten A und B werden die Stimmen
  nacheinander ausgezählt. Am Ende hat Kandidat $A$ mit $a$ Stimmen gegen
  Kandidat B mit $b$ Stimmen gewonnen ($a > b$). Wie groß ist die
  Wahrscheinlichkeit, dass $A$ während der gesamten Auszählung vorne lag?
  Anleitung:

  + Begründen Sie die zwei Modellierungen mit der Grundmenge
    $
      Omega_1 = {M subset {1, dots, a + b} | |M| = a}
    $
    bzw.
    $
      Omega_2 = {g : {0, dots, a+b} -> NN_0^2 | &g(0) = (0, 0),~ g(a+b) = (b, a), \
        &g(i) - g(i-1) in {(0,1),(1,0)},~ i = 1, dots, a+b}
    $
    und der jeweiligen Gleichverteilung. Interpretieren Sie $Omega_2$ als Pfade
    auf dem Gitter $NN_0^2$ und stellen Sie eine Realisierung gemeinsam mit der
    Diagonalen in dem Gitter dar.

  + Formalisieren Sie die Ereignisse $A_1$ „Pfad geht durch den Punkt $(1, 0)$"
    und $A_2$ „Pfad geht durch den Punkt $(0, 1)$, liegt aber nicht oberhalb der
    Diagonalen" in $Omega_2$. Weisen Sie $A_1 sect A_2 = emptyset$ und mit
    geeignetem Spiegelungsargument $|A_1| = |A_2|$ nach.

  + Schließen Sie darauf, dass die gesuchte Wahrscheinlichkeit
    $(a - b)\/(a + b)$ beträgt, indem Sie das entsprechende Ereignis durch $A_1$
    und $A_2$ ausdrücken.
]

=== Lösung

#pagebreak()

#exercise([2 + 4])[
  Sei $cal(M)$ die Menge aller Wahrscheinlichkeitsmaße auf einem messbaren Raum
  $(Omega, scr(F))$.

  + Zeigen Sie, dass $cal(M)$ konvex ist.

  + Sei nun $(Omega, cal(P)(Omega))$ ein diskreter Maßraum, d.h. $Omega$ ist
    höchstens abzählbar unendlich. Ein Wahrscheinlichkeitsmaß $PP in cal(M)$
    heißt Extremalpunkt, falls aus
    $
      alpha PP_1 + (1 - alpha) PP_2 = PP
    $
    für $alpha in (0, 1)$, $PP_1, PP_2 in cal(M)$ folgt, dass
    $PP = PP_1 = PP_2$.

    Zeigen Sie, dass die Menge der Extremalpunkte von $cal(M)$ durch die
    Dirac-Maße
    $
      cal(P)(Omega) in.rev A mapsto delta_omega (A) = cases(1 & "falls" omega in A, 0 & "sonst")
    $
    für $omega in Omega$ gegeben ist und dass sich jedes $PP in cal(M)$ als
    „Mischung" dieser $delta_omega$ darstellen lässt, d.h.
    $
      PP = sum_(omega in Omega) alpha_omega delta_omega
      quad "mit" alpha_omega >= 0 "und" sum_(omega in Omega) alpha_omega = 1.
    $
]

=== Lösung

+ Seien $a in [0, 1]$ und $PP_1, PP_2 in cal(M)$. Dann folgt für
  $
    PP = a PP_1 + (1 - a) PP_2,
  $
  dass
  $
    PP(Omega) = a PP_1(Omega) + (1 - a) PP_2(Omega) = a + 1 - a = 1.
  $
  Sei $(A_n) in scr(F)^NN$ eine Folge paarweise disjunkter Mengen, so folgt
  $
    PP(union.big A_n) & = a PP_1(union.big A_n) + (1 - a) PP_2(union.big A_n) \
                      & = a sum PP_1(A_n) + (1 - a) sum PP_2(A_n) \
                      & = sum (a PP_1(A_n) + (1 - a) PP_2(A_n)) \
                      & = sum PP(A_n).
  $

  Somit liegt $PP in cal(M)$.

+ Seien $omega in Omega$ sowie $PP_1, PP_2 in cal(M)$ mit
  $a PP_1 + (1 - a) PP_2 =
  delta_omega$. Dann folgt für $A := Omega without {omega}$, dass
  $
    delta_omega(A) = 0 = a PP_1(A) + (1 - a) PP_2(A).
  $
  Da $a > 0$ ist, muss gelten $PP_1(A) = PP_2(A) = 0$. Also folgt aus der
  $sigma$-Additivität des Maßes, dass $PP_1({omega}) = PP_2({omega}) = 1$, d.h.
  $PP_1 = PP_2 = delta_omega$.

  Sei nun $PP in cal(M)$ kein Dirac-Maß, d.h. es gibt ein $B subset.eq Omega$
  mit $0 < PP(B) < 1$. Wir definieren
  $
    PP_1(A subset.eq Omega) := PP(A inter B) / PP(B) quad "und" quad
    PP_2(A subset.eq Omega) := PP(A inter B^c) / PP(B^c).
  $
  Dann folgt für $a := PP(B)$, dass
  $
    a PP_1(A) + (1 - a) PP_2(A) = PP(A inter B) + PP(A inter B^c) = PP(A),
  $
  und $PP_1 != PP_2$, da $PP_1(B) = 1 != 0 = PP_2(B)$.

  Also ist $PP$ kein Extremalpunkt. Mittels Kontraposition folgt somit: $PP$
  Extremalpunkt $=>$ $PP$ ist ein Dirac-Maß.

  Sei $PP in cal(M)$. Da $PP$ ein Wahrscheinlichkeitsmaß auf einem diskreten
  Wahrscheinlichkeitsraum ist, gilt $PP(A) = sum_(omega in A) p(omega)$ für eine
  Zähldichte $p : Omega -> [0, 1]$ mit $sum_(omega in Omega) p(omega) = 1$.
  Setzen wir $a_omega := p(omega)$, so folgt
  $
    PP(A) = sum_(omega in A) p(omega) = sum_(omega in Omega) a_omega delta_omega (A).
  $
