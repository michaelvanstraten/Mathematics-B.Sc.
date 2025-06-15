#set enum(numbering: "(a)")
#set text(font: "New Computer Modern")
#show heading: set block(above: 1.4em, below: 1em)

== Aufgabe A3.1 #h(1fr) _(5 Punkte)_

Die Čebyšev-Polynome (erster Art) $T_n$ sind definiert vermöge
$T_n(x) = cos(n arccos(x))$ für $x in [-1, 1]$.

+ Zeigen Sie die Rekursionsformel (und damit, dass die Čebyšev-Polynome
  tatsächlich algebraische Polynome sind)
  $T_0(x) := 1, T_1(x) := x, T_(n+1)(x) := 2x T_n(x) - T_(n-1)(x)$ für
  $n = 1, 2, ...$

+ Zeigen Sie, dass sich die Čebyšev-Polynome für alle $n in NN_0$ darstellen
  lassen vermöge
  $T_n(x) = 1 / 2((x + sqrt(x^2 - 1))^n + (x - sqrt(x^2 - 1))^n)$.

_Beweis_

+ *Beweis via Induktion* \

  Sei die äquivalenz der Rekursion bereits für ein $n in NN$ bewiesen.

  Somit folgt
  $
    T_(n+1)(x) &= 2 x cos(n arccos(x)) - cos((n-1)arccos(x)) \
    &= 2 cos(arccos(x)) cos(n arccos(x)) - cos((n-1)arccos(x)) \
    &= cos(arccos(x) - n arccos(x)) + cos((n+1) arccos(x)) - cos((n-1)arccos(x)) \
    &= cos((n+1) arccos(x)) + cos(arccos(x) - n arccos(x)) - cos((n-1)arccos(x)) \
    &= cos((n+1) arccos(x)) + cos(n arccos(x) - arccos(x)) - cos((n-1)arccos(x)) \
    &= cos((n+1) arccos(x)) + cos((n-1) arccos(x)) - cos((n-1)arccos(x)) \
    &= cos((n+1) arccos(x))
  $

+ Wir definieren für $x = cos(theta)$:
  $
    r_1 & = x + sqrt(x^2-1) = cos(theta) + i sin(theta) = e^(i theta)  \
    r_2 & = x - sqrt(x^2-1) = cos(theta) - i sin(theta) = e^(-i theta) \
  $

  Es folgt:
  $
    r_1^n & = e^(i n theta) = cos(n theta) + i sin(n theta)  \
    r_2^n & = e^(-i n theta) = cos(n theta) - i sin(n theta) \
  $

  Durch Addition erhalten wir:
  $
    (r_1^n + r_2^n)/2 = cos(n theta) = T_n(x)
  $

  Einsetzen der Ausdrücke für $r_1$ und $r_2$ liefert:
  $
    T_n(x) = 1/2((x + sqrt(x^2 - 1))^n + (x - sqrt(x^2 - 1))^n)
  $
