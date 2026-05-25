#import "common.typ": *

#show: problemset("5")

#exercise([2 + 2 + 2])[
  *Bedingte Wahrscheinlichkeit und Unabhängigkeit*

  + Wir betrachten einen Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$ und zwei
    Ereignisse $A, B in scr(F)$. Man sagt: $B$ wirkt anziehend auf $A$, falls
    $PP(A | B) > PP(A)$; und $B$ wirkt abstoßend auf $A$, falls
    $PP(A | B) < PP(A)$.

    + Zeigen Sie: Wirkt $B$ anziehend auf $A$, dann wirkt auch $A$ anziehend auf
      $B$.

    + Zeigen Sie: Wirkt $B$ anziehend auf $A$, dann wirkt $B^c$ abstoßend auf
      $A$.

    + Wirkt $A$ anziehend auf $B$ und $B$ anziehend auf $C$, wirkt dann auch $A$
      anziehend auf $C$?

  + Wir betrachten ein Laplace-Experiment mit Ergebnismenge
    $Omega = {1, 2, dots, p}$ für eine Primzahl $p$.

    Zeigen Sie: Sind $A, B in scr(P)(Omega)$ unabhängige Ereignisse, so ist
    mindestens eines von beiden $emptyset$ oder $Omega$.

  + Es seien $A_1, A_2, dots, A_n in scr(F)$ unabhängige Ereignisse auf einem
    Wahrscheinlichkeitsraum $(Omega, scr(F), PP)$.

    Zeigen Sie, dass die Wahrscheinlichkeit, dass keines der $A_1, dots, A_n$
    eintritt, kleiner oder gleich $exp(- sum_(i=1)^n PP(A_i))$ ist.
]

=== Lösung

+ #linebreak()
  + Angenommen $PP(A) > 0$, so folgt:
    $
          &&             PP(A | B) & > PP(A) \
      <=> && PP(A inter B) / PP(B) & > PP(A) \
      <=> && PP(B inter A) / PP(A) & > PP(B)
    $
  + $
          &&           PP(A bar B) & > PP(A) \
      <=> &&        -PP(A inter B) & < - PP(B) dot PP(A) \
      <=> && PP(A) - PP(A inter B) & < PP(A) - PP(B) dot PP(A) \
      <=> &&       PP(A inter B^c) & < PP(A) dot (1 - PP(B)) \
      <=> &&         PP(A bar B^c) & < PP(A)
    $
  + Nein, dies ist im Allgemeinen nicht der Fall. Es gilt nur dann, wenn
    zusätzlich $PP(A inter B) dot PP(B inter C) = PP(A inter C) dot PP(B)$
    erfüllt ist, denn aus
    $
         & PP(B | A) > PP(B) quad "und" quad PP(C | B) > PP(C) \
      => & (PP(A inter B) dot PP(B inter C)) / (PP(A) dot PP(B)) > PP(B) dot PP(C) \
    $
    folgt unter dieser Zusatzannahme $PP(A | C) > PP(A)$.

+ Da es sich um ein Laplace-Experiment handelt, ist $PP(A) = abs(A) \/ p$ und
  $PP(B) = abs(B) \/ p$. Sei $k := abs(A inter B) <= p$. Wenn $A$ und $B$
  unabhängig sind, so folgt
  $
        && PP(A inter B) & = k / p = (abs(A) dot abs(B)) / p^2 = PP(A) dot PP(B) \
    <=> &&       k dot p & = abs(A) dot abs(B)
  $

  *Fall $k = 0$:*

  Aus $abs(A) dot abs(B) = k dot p = 0$ folgt sofort, dass $A = emptyset$ oder
  $B = emptyset$ ist.

  *Fall $k > 0$:*

  Teilt $p$ die Zahl $abs(A) dot abs(B)$ und ist $p$ prim, so teilt $p$ entweder
  $abs(A)$ oder $abs(B)$. Wegen $abs(A), abs(B) <= p$ folgt daraus $abs(A) = p$
  oder $abs(B) = p$, also $A = Omega$ oder $B = Omega$.

+ Es gilt
  $
    Omega without union.big_(i = 1)^n A_i = inter.big_(i=1)^n A_i^c.
  $
  Da die $A_i$ unabhängig sind, sind auch die $A_i^c$ unabhängig, und somit
  folgt
  $
    PP(inter.big_(i=1)^n A_i^c)
    = product_(i=1)^n PP(A_i^c)
    = product_(i=1)^n (1 - PP(A_i)).
  $
  Mit der Abschätzung $1 - x <= e^(-x)$ für alle $x in RR$ folgt schließlich
  $
    product_(i=1)^n (1 - PP(A_i))
    <= product_(i=1)^n exp(-PP(A_i))
    = exp(- sum_(i=1)^n PP(A_i)).
  $

#pagebreak()

#exercise([1 + 2 + 2 + 1])[
  Es bezeichne $bold(P) = {2, 3, 5, 7, 11, dots}$ die Menge aller Primzahlen.
  Für $s > 1$ definieren wir die Wahrscheinlichkeitsverteilung $PP$ auf
  $(Omega, scr(F)) = (NN, scr(P)(NN))$ durch
  $
    PP({n}) = 1 / (zeta(s) n^s), quad n in NN,
  $
  wobei die Riemannsche Zeta-Funktion $zeta$ durch
  $zeta(s) := sum_(k=1)^infinity k^(-s)$ definiert ist. Für jedes $m in NN$
  bezeichne $A_m$ das Ereignis, dass $m$ das Ergebnis $n$ teilt, also
  $
    A_m = {n in NN : m | n}.
  $

  + Zeigen Sie, dass $PP(A_m) = m^(-s)$ für alle $m in NN$ gilt.

  + Zeigen Sie, dass die Ereignisse $(A_p)_(p in bold(P))$ unabhängig unter
    $PP_s$ sind.

  + Berechnen Sie $PP(sect.big_(p in bold(P)) A_p^c)$ und folgern Sie die
    Eulersche Formel
    $
      1 / zeta(s) = product_(p in bold(P)) (1 - 1 / p^s).
    $

  + Zeigen Sie: Die Wahrscheinlichkeit des Ereignisses
    $sect.big_(m in NN without {1}) A_(m^2)^c$, dass ein zufällig ausgewähltes
    $n$ durch keine Quadratzahl außer $1$ teilbar ist, beträgt $1 \/ zeta(2s)$.
]

=== Lösung

+ Die Menge $A_m$ lässt sich als $A_m = {k m : k in NN}$ schreiben. Damit folgt
  $
    PP(A_m) = sum_(k=1)^infinity PP({k m})
    = sum_(k=1)^infinity 1/(zeta(s) (k m)^s)
    = 1/(m^s zeta(s)) sum_(k=1)^infinity 1/k^s
    = m^(-s).
  $

+ Sei $I subset bold(P)$ eine endliche Teilmenge von Primzahlen. Die Menge
  $inter.big_(p in I) A_p$ enthält alle Zahlen, die für jedes $p in I$ durch $p$
  teilbar sind. Somit besitzt jedes $n in inter.big_(p in I) A_p$ eine
  Darstellung der Form $n = k dot product_(p in I) p$ mit $k in NN$. Definieren
  wir $m := product_(p in I) p$, so folgt $inter.big_(p in I) A_p = A_m$, und
  damit
  $
    PP(inter.big_(p in I) A_p)
    = PP(A_m)
    = m^(-s)
    = product_(p in I) p^(-s)
    = product_(p in I) PP(A_p).
  $

+ Aus Aufgabe b) folgt bereits, dass $(A_p)_(p in bold(P))$ unabhängig sind.
  Somit sind auch $(A_p^c)_(p in bold(P))$ unabhängig, und es folgt
  $
    PP(inter.big_(p in bold(P)) A_p^c)
    = product_(p in bold(P)) PP(A_p^c)
    = product_(p in bold(P)) (1 - PP(A_p))
    = product_(p in bold(P)) (1 - 1/p^s).
  $

  Betrachten wir nun die Menge $inter.big_(p in bold(P)) A_p^c$ genauer, so
  ergibt sich die Darstellung
  $
    inter.big_(p in bold(P)) A_p^c = NN without union.big_(p in bold(P)) A_p,
  $
  also die Menge aller natürlichen Zahlen, die durch keine Primzahl teilbar
  sind. Dies ist allerdings nur die Eins. Also folgt
  $
    PP(inter.big_(p in bold(P)) A_p^c) = PP({1}) = 1/zeta(s).
  $

+ Bemerken wir zunächst, dass ein $n in NN$ genau dann durch ein $m^2$ mit
  $m in NN without {1}$ teilbar ist, wenn $n$ durch das Quadrat einer Primzahl
  $p$ teilbar ist. Somit reduziert sich die Berechnung auf
  $
    PP(inter.big_(p in bold(P)) A_(p^2)^c).
  $
  Die Unabhängigkeit der $A_(p^2)$ folgt mit demselben Argument wie in
  Aufgabenteil b). Mit Teil c) erhalten wir somit
  $
    PP(inter.big_(p in bold(P)) A_(p^2)^c) & = product_(p in bold(P)) (1 - PP(A_(p^2))) \
    & = product_(p in bold(P)) (1 - 1/p^(2s)) \
    & = 1 / zeta(2s) quad "(nach Teil c))".
  $

#pagebreak()

#exercise([1 + 1 + 2 + 2])[
  Eine Urne enthält $r$ rote und $b$ blaue Kugeln. Julia zieht rein zufällig
  eine Kugel, notiert ihre Farbe und wirft sie anschließend zusammen mit $d$
  weiteren Kugeln der gleichen Farbe zurück in die Urne. Diesen Vorgang
  wiederholt sie unendlich oft.

  + Was ist die Wahrscheinlichkeit, dass die zweite gezogene Kugel blau ist?

  + Was ist die Wahrscheinlichkeit dafür, dass die erste Kugel blau war, wenn
    wir wissen, dass die zweite blau ist?

  + Sei $B_n$ das Ereignis, dass die $n$-te Kugel blau ist. Zeigen Sie, dass
    $PP(B_n) = PP(B_1)$ für alle $n >= 1$.

  + Bestimmen Sie die Wahrscheinlichkeit, dass die erste Kugel blau ist unter
    der Bedingung, dass die folgenden $n$ Kugeln alle blau sind. Berechnen Sie
    den Grenzwert dieser Wahrscheinlichkeit für $n -> infinity$.
]

=== Lösung

#pagebreak()

#exercise([1 + 1 + 1 + 1 + 1 + 1])[
  Sie haben sich nachts im Berliner Tiergarten verlaufen und fragen Passanten um
  Hilfe. Zwei Drittel aller Passanten sind Touristen und beantworten Ihre Frage
  nach der Richtung mit Wahrscheinlichkeit $3/4$ korrekt (dabei sind die
  Antworten zu wiederholten Fragen unabhängig, selbst dann, wenn Sie derselben
  Person dieselbe Frage mehrmals stellen). Die übrigen Passanten sind Berliner,
  welche Ihnen stets falsch antworten.

  + Sie fragen einen zufälligen Passanten, ob Sie auf dem richtigen Weg zum
    Brandenburger Tor sind. Was ist die Wahrscheinlichkeit, dass seine Antwort
    korrekt ist?

  + Sie stellen einem zufälligen Passanten $n$-mal unmittelbar nacheinander
    dieselbe Frage wie in a) und erhalten stets dieselbe Antwort. Berechnen Sie
    die Wahrscheinlichkeit, dass die gegebene Antwort korrekt ist für
    $n = 2, 3, 4$.

  + Sie stellen einem zufälligen Passanten viermal unmittelbar nacheinander
    dieselbe Frage wie in a). Er gibt Ihnen drei mal dieselbe Antwort und beim
    vierten Mal eine andere Antwort. Zeigen Sie, dass die erste Antwort mit
    Wahrscheinlichkeit $9/10$ korrekt ist.

  Lisa ist in der gleichen Situation wie Sie, kann sich jedoch besser
  orientieren und hat Grund zu der Annahme, dass sie mit Wahrscheinlichkeit
  $epsilon in (0, 1)$ bereits in die richtige Richtung geht. Sie stellt einem
  zufälligen Passanten die Frage: „Laufe ich in die richtige Richtung?". Zeigen
  Sie:

  + Egal, was die erste Antwort des Passanten ist, Lisa glaubt danach immer
    noch, dass sie mit Wahrscheinlichkeit $epsilon$ in die richtige Richtung
    geht.

  + Sind die ersten beiden Antworten des Passanten identisch, so glaubt Lisa
    weiterhin, dass sie mit Wahrscheinlichkeit $epsilon$ in die richtige
    Richtung geht.

  + Nach drei identischen Antworten wird Lisa die bedingte Wahrscheinlichkeit
    des Ereignisses $A$, dass sie in die richtige Richtung läuft, wie folgt
    berechnen:
    $
      PP(A | J J J) = (9 epsilon) / (11 - 2 epsilon), quad
      PP(A | N N N) = (11 epsilon) / (9 + 2 epsilon).
    $
]

=== Lösung
