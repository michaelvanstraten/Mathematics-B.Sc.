#set enum(numbering: "(a)")

#set text(font: "New Computer Modern")
#show heading: set block(above: 1.4em, below: 1em)

=== Aufgabe A2.1 (Gruppenabgabe) #h(1fr) _(5 Punkte)_

+ Auf einem Dreieck $T$ mit den Eckpunkten $P_1$, $P_2$, $P_3$ und Kanten $E_1$,
  $E_2$, $E_3$, sei der Raum der Polynome zweiten Grades definiert via
  $
    P_2(T) := {p in C(T) | exists a_1, dots a_6 in RR, p(x, y) = a_1 x^2 + a_2 y^2 + a_3 x y + a_4 x + a_5 y + a_6}.
  $
  Es sei $"mid"(E_j)$ der Mittelpunkt der Kante $E_j$, dann bezeichne $delta_Q$
  die Punktauswertung in
  $Q in {P_1, P_2, P_3, "mid"(E_1), "mid"(E_2), "mid"(E_3)}$, also
  $
    delta_Q (p) = p(Q) "für" p in P_2(T).
  $
  Zeigen Sie, dass $(T, P_2(T), (L_1, dots, L_6))$ für
  $(L_1, L_2, L_3) = (delta_(P_1), delta_(P_2), delta_(P_3))$ und
  $(L_4, L_5, L_6) = (delta_("mid"(E_1)), delta_("mid"(E_2)), delta_("mid"(E_3)))$
  ein Finites-Element nach Ciarlet ist.

  _Hinweis:_ Geben Sie eine duale Basis zu $(L_1, dots, L_6)$ in $P_2(T)$ mit
  Hilfe der baryzentrischen Koordinaten $lambda_1$, $lambda_2$, $lambda_3$ an.

+ Es sei $T$ ein gleichseitiges Dreieck und $0 < alpha < 1 / 2$. Auf der Kante
  $E_j$, $j = 1, 2, 3$ seien die Punkte
  $Q_(2j-1) := alpha P_(j-1) + (1 - alpha) P_(j+1)$,
  $Q_(2j) := (1 - alpha) P_(j-1) + alpha P_(j+1)$ vorgegeben (mit $P_0 = P_3$
  und $P_4 = P_1$). Zeigen Sie, dass die Wahl von $(L_1, dots, L_6)$ für
  Punktauswertungen $(delta_(Q_1), dots, delta_(Q_6))$ in den Punkten
  $(Q_1, dots, Q_6)$ kein Finites-Element nach Ciarlet definiert.

  _Hinweis:_ Es genügt ein Polynom $p in P_2(T)$, $p != 0$ mit $L_j(p) = 0$ für
  $j = 1, dots, 6$ anzugeben.

_Anmerkung:_ Diese Aufgabe zeigt, dass die quadratische Version des CR-Elementes
kein Finites-Element nach Ciarlet definiert. Dennoch lässt sich damit rechnen.
Diese Methode ist bekannt als Fortin-Soulie-Methode.

=== Aufgabe A2.2 (Gruppenabgabe) #h(1fr) _(5 Punkte)_

Es sei $T$ ein Dreieck mit den Ecken $P_1$, $P_2$, $P_3$ und den baryzentrischen
Koordinaten $lambda_1$, $lambda_2$, $lambda_3$, weiterhin seien
$alpha, beta, gamma in NN_0$. Beweisen Sie die Formel
$integral_T lambda_1^alpha lambda_2^beta lambda_3^gamma d x = 2 |T| (alpha! beta! gamma!) / ((2 + alpha + beta + gamma)!). quad ($star$)$

_Hinweis:_ Berechnen Sie dann das Integral ($star$) zunächst explizit für das
Referenzdreieck $T_("ref") = "conv"{(0, 0), (1, 0), (0, 1)}$ und transformieren
Sie dann das Integral auf $T$. Zeigen Sie dazu mittels vollständiger Induktion
und partieller Integration für jedes $y in [0, 1]$ die Hilfsformel
$
  integral_0^(1-y) x^alpha (1 - x - y)^beta d x = (alpha! beta!) / ((1 + alpha + beta)!) (1 - y)^(alpha + beta + 1).
$

_Anmerkung:_ Für ein $n$-Simplex $T$ mit baryzentrischen Koordinaten $lambda_1$,
$lambda_2$, $dots$, $lambda_(n+1)$ lautet die Formel
$
  integral_T lambda_1^(alpha_1) lambda_2^(alpha_2) dots lambda_(n+1)^(alpha_(n+1)) d x = n! |T| (alpha_1! alpha_2! dots alpha_(n+1)!) / ((n + alpha_1 + alpha_2 + dots + alpha_(n+1))!).
$

=== Aufgabe A2.3 (Gruppenabgabe) #h(1fr) _(8 Punkte)_

Recherchieren Sie die zwei MATLAB Routinen `delaunay`, `meshgrid`. Schreiben Sie
ein Essay über Delaunay-Triangulierungen in dem Sie den zugrunde liegenden
Algorithmus und deren Realisierung in MATLAB skizzieren. Erklären Sie wie
```matlab
[y, x] = meshgrid(0:0.25:1);
c4n = [x(:), y(:)];
n4e = delaunay(-x, y);
```
die Triangulierung des Einheitsquadrates aus Aufgabe P1.4 erzeugt und
repräsentiert. Gehen Sie dabei insbesondere auf die Datenstrukturen, die MATLAB
zur Darstellung einer Triangulierung benutzt, ein und vergleichen Sie diese mit
`c4n` und `n4e` aus Kapitel 1.5 im Skript.

=== Lösung:

Die Delaunay-Triangulierungen teilt einer Menge an Punkten im $R^NN$ eine
Triagnulirung zu. Hierbei werden die folgenden beiden eigenschaften
aufrecherhalten:
+ Alle dreiecke der Triangulierung sind nicht entartet, das heißt drei koliniare
  punkte sind nicht teil eines dreiecks.
+ Die umkreise jedes dreiecks der Triangulierung enthält nur diese drei Punkte.

Der zweite Punkt ist die Wesentliche eigenschaften die die
Delaunay-Triangulierungen ausmacht.




=== Aufgabe P2.4 (Gruppenabgabe) #h(1fr) _(5 Punkte)_

Betrachten Sie wieder die Triangulierung $cal(T)$ des Einheitsquadrates
$Omega = (0, 1)^2$ aus Aufgabe P1.4, die Sie mit den drei Befehlen aus A2.3
erzeugen können. Schreiben Sie eine MATLAB-Funktion
`plotCRBasisFunction(nodeNumber1, nodeNumber2)`, die, falls die eingegebenen
Knotennummern `nodeNumber1`, `nodeNumber2` $in {1, 2, dots, 25}$ zu einer Seite
der Triangulierung $cal(T)$ gehören, d.h.
$"conv"{X_"nodeNumber1", X_"nodeNumber2"} in cal(E)$, einen Plot der zugehörigen
Crouzeix-Raviart Basisfunktion erzeugt. Andernfalls soll einen Plot der
Nullfunktion ausgegeben werden. Sie dürfen dazu die Datei
`plotCRBasisFunction.m` aus dem Moodle-Kurs studieren und vervollständigen.

Dabei sei die Crouzeix-Raviart Basisfunktion $psi_E in P_1(cal(T))$ zu einer
Kante $E in cal(E)$ die stückweise $P_1$-Funktion, für die gilt
$psi_E("mid"(F)) = delta_(E,F)$ für alle Kanten $F in cal(E)$.

Testen Sie Ihre Implementation in `serie02.m` mindestens für die Knotenpaare
$(22,23)$, $(7,13)$ und $(21,4)$. Geben Sie in `serie02.m` außerdem mittels
einer kurzen Konsolenausgabe aus, was Sie über die Stetigkeit der
Basisfunktionen sagen können. Vermeiden Sie in Ihrer Implementation Schleifen
für die volle Punktzahl!

=== Aufgabe T2.5

+ Zeigen Sie, dass das Tripel $(T, "RT"_0(T), (L_1, L_2, L_3))$ auf einem
  Dreieck $T$ mit den Raviart-Thomas-Funktionen
  $
    "RT"_0(T) := {q in C(T; RR^2) | exists a, b, c in RR, "so dass" q(x, y) = (a, b) + c(x, y) forall (x, y) in T}
  $
  und den linearen Funkionalen
  $
    L_j(q) = integral_(E_j) q dot nu_(E_j) d s "für" j = 1, 2, 3 "und" q in C(T)
  $
  ein finites Element nach Ciarlet definiert. Dabei ist $nu_(E_j)$ der
  Normalenvektor der Kante $E_j$. Finden Sie dazu eine duale Basis
  $(q_(E_1), q_(E_2), q_(E_3))$ zu $(L_1, L_2, L_3)$.

+ Es seien $T_1$ und $T_2$ zwei Dreiecke mit einer gemeinsamen Kante
  $E = partial T_1 sect partial T_2$ und sei $q_E$ die Basisfunktion zur Kante
  $E$, die eingeschränkt auf $T_1$ bzw. $T_2$ die duale Basisfunktion aus (a)
  ist. Beweisen Sie die Stetigkeit der Normalenkomponente $q_E dot nu_E$.

=== Aufgabe T2.6

Es soll eine neue Logarithmentafel zur Auswertung des natürlichen Logarithmus
$log(x)$ für $1 <= x <= 2$ mittels kubischer Interpolation erstellt werden. Dazu
werden Werte $f_j := log(1+j h)$ für $j = 0, 1, dots, N$ und $h = 1 / (N + 1)$
mit $N in NN$ bereitgestellt. Der Wert $log(x) approx p_3(x)$ an einer Stelle
$x$ mit $x_0 < x < x_0 + 3h$ und $x_0 = 1 + j h$ für ein $j = 0, 1, dots, N - 3$
wird über das kubische Interpolationspolynom $p_3$ zu den Stützstellen
$x_k := x_0 + k h$ und Daten $f_k$ für $k = 0, 1, 2, 3$ berechnet.

+ Wie groß muss $N in NN$ gewählt werden, damit der Fehler
  $
    |log(x) - p_3(x)| <= epsilon
  $
  garantiert kleiner als eine vorgegebene Toleranz von $epsilon > 0$, z.B.
  $epsilon = 10^(-12)$, ist?

+ Argumentieren Sie, wie viele zusätzliche Stellen bei der Schrittweite
  $h = 10^(-3)$ gedruckt werden müssen, damit dieser Fehler in der Größenordnung
  von $10^(-12)$ bleibt? Betrachten Sie dazu mögliche Auslöschung bei der
  Berechnung mittels dividierter Differenzen.

+ Geben Sie den Wert des Interpolationspolynoms $p_3$ an der Stelle $x$ in der
  Form
  $
    p_3(x) = alpha_0 f_0 + alpha_1 f_1 + dots + alpha_3 f_3
  $
  mit Koeffizienten $alpha_0, dots, alpha_3$, die nur von $x, x_0, dots, x_3$
  abhängen, an. Führen Sie dazu das Neville-Schema händisch aus. Diskutieren
  Sie, inwiefern diese Formel zu Auslöschung führt.
