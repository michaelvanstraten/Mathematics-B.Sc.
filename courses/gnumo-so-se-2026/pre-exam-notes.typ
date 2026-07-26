#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2cm),
)

#set text(
  font: "Libertinus Serif",
  size: 10.5pt,
  lang: "de",
)

#set heading(numbering: "1.")
#set par(justify: true, leading: 0.65em)

#align(center)[
  #text(size: 18pt, weight: "bold")[
    Themenübersicht zur GNuMO-Klausur
  ]

  #v(0.3em)

  #text(size: 10pt, style: "italic")[
    Zusammenführung der Vorlesungsnotizen von Michael, Erik und Tobias
  ]
]

#v(1em)

Diese Übersicht fasst die vorhandenen Notizen zum möglichen Klausurstoff
zusammen. Dabei wird zwischen sicher relevantem Stoff, theoretisch zu
beherrschenden Inhalten und ausdrücklich ausgeschlossenen Themen unterschieden.

= Polynominterpolation

== Lagrange- und Newton-Interpolation

Beherrscht werden sollen:

- Lagrange-Darstellung des Interpolationspolynoms
- Newton-Darstellung des Interpolationspolynoms
- dividierte Differenzen
- Aufstellung eines Interpolationspolynoms
- Auswertung eines Interpolationspolynoms
- Fehlerdarstellung der Polynominterpolation
- Fehlerabschätzungen
- Beweise der Fehlerabschätzungen
- Eindeutigkeit des Interpolationspolynoms

== Auswertungsverfahren

- Neville-Schema
- Horner-Schema
- geschachtelte Auswertung der Newton-Darstellung

== Hermite-Interpolation

Eine Hermite-Interpolation muss voraussichtlich nicht konkret durchgeführt
werden. Die Grundidee und die Abgrenzung zur gewöhnlichen Polynominterpolation
sollten jedoch bekannt sein.

= Extrapolationsverfahren

== Richardson-Extrapolation

- Grundidee verstehen
- Verfahren aufstellen und anwenden
- asymptotische Fehlerentwicklungen nutzen
- Anwendung auf Quadraturverfahren verstehen
- Verbesserung der Konvergenzordnung nachvollziehen

== Euler--Maclaurin und Romberg

Die Notizen sind in diesem Punkt nicht vollständig eindeutig. Am
wahrscheinlichsten gilt:

- keine detaillierte Euler--Maclaurin-Formel auswendig lernen
- keine umfangreichen Rechnungen mit der Euler--Maclaurin-Formel
- Grundidee der Euler--Maclaurin-Formel kennen
- Grundidee der Romberg-Integration kennen
- Zusammenhang zwischen Romberg und Richardson-Extrapolation verstehen
- gewöhnliche Maclaurin-Reihen sind nicht klausurrelevant

= Splines

== Sicher zu beherrschen

- Grundidee der Spline-Interpolation
- allgemeine Definition eines Splines
- stückweise polynomiale Darstellung
- Übergangs- und Glattheitsbedingungen
- einen einfachen beziehungsweise linearen Spline bestimmen

Ein linearer Spline besteht auf jedem Teilintervall $[x_i, x_(i+1)]$ aus einem
linearen Polynom und interpoliert die gegebenen Datenpunkte.

== Kubische Splines

Theoretisch bekannt sein sollen:

- Definition eines kubischen Splines
- Stetigkeit des Splines
- Stetigkeit der ersten Ableitung
- Stetigkeit der zweiten Ableitung
- Definition eines natürlichen kubischen Splines
- natürliche Randbedingungen
- Energieminimierungseigenschaft
- Beweis oder Beweisidee der Energieminimierung

Bei einem natürlichen kubischen Spline gilt an den Randpunkten typischerweise

$
  s''(x_0) = 0
  quad "und" quad
  s''(x_n) = 0.
$

== Voraussichtlich nicht verlangt

Aus den Notizen lässt sich nicht ableiten, dass die Koeffizienten eines
kubischen Splines vollständig berechnet werden müssen. Insbesondere ist
voraussichtlich nicht erforderlich:

- ein vollständiges Gleichungssystem für kubische Splines aufzustellen
- das tridiagonale Gleichungssystem zu lösen
- einen natürlichen kubischen Spline vollständig auszurechnen

Die konkrete Berechnung beschränkt sich wahrscheinlich auf lineare Splines.

= Trigonometrische Interpolation

Beherrscht werden sollen:

- Grundidee der trigonometrischen Interpolation
- trigonometrisches Interpolationspolynom aufstellen
- Interpolationsverfahren durchführen
- Koeffizienten in komplexer Darstellung über $CC$ bestimmen
- Koeffizienten in reeller Darstellung über $RR$ bestimmen
- Zusammenhang zwischen komplexer und reeller Darstellung verstehen

Nicht klausurrelevant sind voraussichtlich:

- diskrete Fouriertransformation als eigenständiges Verfahren
- schnelle Fouriertransformation

= Gaußsche Bestapproximation

== Kontinuierliche Bestapproximation

Zu beherrschen sind:

- Definition der Bestapproximation
- Charakterisierung durch Orthogonalität
- Existenz
- Eindeutigkeit
- Beweis beziehungsweise Beweisidee

Für einen Unterraum $V$ eines Skalarproduktraums ist $p^* in V$ genau dann die
Bestapproximation von $f$, wenn

$
  chevron.l f - p^*, v chevron.r = 0
  quad "für alle" quad
  v in V
$

gilt.

== Orthogonale Basen und Legendre-Polynome

- Legendre-Polynome als orthogonale Basispolynome
- Prinzip ihrer Herleitung verstehen
- Orthogonalisierung einer gegebenen Basis durchführen
- Bestapproximation mithilfe einer orthogonalen Basis bestimmen
- Legendre-Polynome gegebenenfalls verwenden, wenn sie in der Klausur angegeben
  werden

== Diskrete Gauß-Approximation

- diskrete Bestapproximation für gegebene Datenpunkte formulieren
- zugehöriges lineares Gleichungssystem aufstellen
- Normalgleichungen aufstellen
- einfache diskrete Ausgleichsprobleme lösen

= Numerische Differentiation

== Differenzenquotienten

Beherrscht werden sollen:

- rechter beziehungsweise vorwärts gerichteter Differenzenquotient
- linker beziehungsweise rückwärts gerichteter Differenzenquotient
- zentraler Differenzenquotient
- jeweilige Konsistenzordnung

Beispiele:

$
  f'(x) approx (f(x+h) - f(x)) / h
$

$
  f'(x) approx (f(x) - f(x-h)) / h
$

$
  f'(x) approx (f(x+h) - f(x-h)) / (2h)
$

== Fehler und Ordnung

- Taylorentwicklung verwenden
- Fehlerterm bestimmen
- Konsistenzordnung beweisen
- Ordnung einer gegebenen Differenzenformel bestimmen
- gegebenenfalls eine Differenzenformel mit vorgegebener Ordnung konstruieren

= Numerische Quadratur

== Einfache Quadraturformeln

Bekannt sein sollen:

- linke Rechteckregel
- rechte Rechteckregel
- Mittelpunktregel
- Trapezregel
- Simpsonregel

Zu jeder Formel sollten beherrscht werden:

- Formel angeben
- Formel anwenden
- Gewichte und Knoten erkennen
- Exaktheitsgrad bestimmen
- Ordnung bestimmen
- Ordnung beziehungsweise Exaktheit begründen

== Konstruktion von Quadraturformeln

Eine allgemeine Quadraturformel besitzt die Form

$
  Q(f) = sum_(i=0)^n w_i f(x_i).
$

Zu beherrschen sind:

- Gewichte bestimmen
- gegebenenfalls Knoten bestimmen
- Exaktheitsbedingungen aufstellen
- Exaktheit für Polynome prüfen
- Formel mit vorgegebenem Exaktheitsgrad konstruieren

Dazu wird die Quadraturformel typischerweise für

$
  1, x, x^2, dots
$

mit dem exakten Integral verglichen.

== Newton--Cotes-Formeln

- Familie der Newton--Cotes-Formeln kennen
- offene und abgeschlossene Formeln unterscheiden
- einfachste Vertreter zuordnen
- Konstruktion über Interpolationspolynome verstehen
- Exaktheitsgrad oder Ordnung bestimmen
- Ordnungsbeweis beziehungsweise Beweisidee kennen

Es müssen wahrscheinlich nicht sämtliche Newton--Cotes-Formeln auswendig gelernt
werden. Im Vordergrund stehen die einfachsten Regeln.

== Zusammengesetzte Quadraturformeln

- summierte beziehungsweise zusammengesetzte Trapezregel
- Anwendung auf äquidistante Zerlegungen
- Fehlerabschätzung
- Konvergenzordnung

Eine summierte Simpsonregel wird in den Notizen nicht ausdrücklich genannt.

== Gauß-Quadratur

- Grundidee der Gauß-Quadratur
- Charakterisierung der Gauß-Knoten
- Zusammenhang mit orthogonalen Polynomen
- Knoten und Gewichte in einfachen Fällen bestimmen
- maximalen Exaktheitsgrad kennen
- Konstruktion einer Gauß-Quadraturformel nachvollziehen

Bei $n$ Gauß-Knoten ist die Quadraturformel typischerweise für Polynome bis zum
Grad

$
  2n - 1
$

exakt.

= Nullstellenverfahren in $RR$

== Intervallschachtelung

- Grundidee der Intervallschachtelung
- Bisektionsverfahren anwenden
- Voraussetzungen kennen
- Konvergenzaussage verstehen
- Fehlerabschätzung aus der Intervalllänge ableiten

== Fixpunktiteration

- Nullstellenproblem in ein Fixpunktproblem umformen
- Iteration $x_(k+1) = phi(x_k)$ anwenden
- Zusammenhang zwischen Fixpunkten und Nullstellen verstehen
- grundlegende Konvergenzbedingungen kennen
- Kontraktionsidee verstehen

== Newton-Verfahren in $RR$

Das Newton-Verfahren lautet

$
  x_(k+1)
  =
  x_k - f(x_k) / f'(x_k).
$

Beherrscht werden sollen:

- geometrische Interpretation
- Verfahren anwenden
- lokale Konvergenzbedingungen
- quadratische Konvergenz bei einfachen Nullstellen
- A-priori-Fehlerabschätzung
- A-posteriori-Fehlerabschätzung
- Beweise der Fehlerabschätzungen
- Abbruchkriterien
- Fixpunktinterpretation

== Varianten des Newton-Verfahrens

Insbesondere:

- vereinfachtes Newton-Verfahren
- modifiziertes Newton-Verfahren für mehrfache Nullstellen

Weitere Varianten sind nur relevant, soweit sie in der Vorlesung behandelt
wurden.

= Newton-Verfahren in $RR^n$

Für ein nichtlineares Gleichungssystem

$
  F(x) = 0
$

wird der Newton-Schritt durch

$
  F'(x_k) s_k = -F(x_k)
$

bestimmt. Anschließend gilt

$
  x_(k+1) = x_k + s_k.
$

== Newton--Kantorowitsch-Satz

- Voraussetzungen kennen
- Aussage kennen
- Existenz einer Lösung
- Eindeutigkeit der Lösung
- Konvergenz des Newton-Verfahrens
- Bedeutung der Abschätzungen verstehen
- gegebenenfalls Eindeutigkeit mithilfe des Satzes begründen

Ein vollständiger technischer Beweis des Satzes wird in den Notizen nicht
ausdrücklich verlangt.

== Globalisierung

- Grundidee der Globalisierung
- gedämpftes Newton-Verfahren
- Schrittweitenwahl
- Verbindung zur Liniensuche
- spezielle Konstanten vermutlich nicht auswendig lernen

Ein gedämpfter Newton-Schritt hat die Form

$
  x_(k+1) = x_k + alpha_k s_k,
  quad 0 < alpha_k <= 1.
$

= Eigenwertverfahren

== Potenzmethode

Der in den Notizen als „Power Rule“ bezeichnete Punkt ist wahrscheinlich die
Potenzmethode.

Beherrscht werden sollen:

- Algorithmus
- Voraussetzungen
- dominanter Eigenwert
- Bedeutung des Startvektors
- Konvergenzaussage
- Konvergenzgeschwindigkeit
- Beweis oder Beweisidee der Konvergenz

== Gershgorin-Kreise

- Gershgorin-Kreise aufstellen
- Eigenwerte lokalisieren
- Satz von Gershgorin angeben
- Aussagen bei disjunkten Kreisen beziehungsweise Kreisvereinigungen verstehen

Für eine Matrix $A = (a_(i j))$ besitzt der $i$-te Gershgorin-Kreis den
Mittelpunkt $a_(i i)$ und den Radius

$
  r_i = sum_(j != i) abs(a_(i j)).
$

= Numerische Optimierung

== Optimalitätsbedingungen

- notwendige Bedingungen erster Ordnung
- notwendige Bedingungen zweiter Ordnung
- hinreichende Bedingungen zweiter Ordnung
- Gradient und Hesse-Matrix verwenden
- lokale und globale Minima unterscheiden
- Kandidaten für Extremstellen überprüfen

Für ein inneres lokales Minimum gilt notwendig

$
  nabla f(x^*) = 0.
$

== Abstiegsrichtungen

Eine Richtung $d$ ist eine Abstiegsrichtung in $x$, wenn

$
  nabla f(x)^T d < 0.
$

Beherrscht werden sollen:

- Abstiegsrichtung prüfen
- Aufstiegsrichtung prüfen
- negativen Gradienten als Abstiegsrichtung erkennen
- Zusammenhang zwischen Richtungsableitung und Abstiegsrichtung verstehen

== Liniensuche

- theoretische Grundidee
- praktische Schrittweitenwahl
- Armijo-Bedingung
- Backtracking-Liniensuche
- Schrittweite anhand einer Bedingung überprüfen

Die Armijo-Bedingung lautet typischerweise

$
  f(x_k + alpha_k d_k)
  <=
  f(x_k)
  +
  c alpha_k nabla f(x_k)^T d_k.
$

== Gradientenverfahren

Das Gradientenverfahren besitzt die Form

$
  x_(k+1)
  =
  x_k - alpha_k nabla f(x_k).
$

Beherrscht werden sollen:

- Algorithmus
- Verfahren anwenden
- Schrittweite auswählen
- Konvergenzaussage angeben
- Voraussetzungen der Konvergenzaussage kennen
- Abstiegsrichtung und Schritt überprüfen

Nicht klausurrelevant ist der stochastische Gradientenabstieg.

= Konjugierte-Gradienten-Verfahren

Das CG-Verfahren wird auf lineare Gleichungssysteme

$
  A x = b
$

mit symmetrischer und positiv definiter Matrix $A$ angewandt.

Beherrscht werden sollen:

- Grundidee des CG-Verfahrens
- Voraussetzungen
- Residuen
- Suchrichtungen
- Orthogonalität von Residuen
- $A$-Konjugiertheit der Suchrichtungen
- Eigenschaften gegebener Iterationsschritte überprüfen
- geforderte Eigenschaften beweisen

Der vollständige Algorithmus muss wahrscheinlich nicht vollständig auswendig
wiedergegeben werden. Im Vordergrund steht das Überprüfen und Nachweisen von
Eigenschaften.

Die endliche Terminierung ist eine typische Eigenschaft des CG-Verfahrens, wird
in den Notizen aber nicht ausdrücklich als Prüfungsstoff genannt.

= Anfangswertprobleme und Einschrittverfahren

Gegeben sei ein Anfangswertproblem

$
  y'(t) = f(t, y(t)),
  quad
  y(t_0) = y_0.
$

== Einschrittverfahren

- allgemeine Form eines Einschrittverfahrens
- Konsistenz
- Konsistenzordnung
- lokaler Fehler
- globaler Fehler
- Konvergenz
- Konvergenzordnung
- Zusammenhang zwischen Konsistenz und Konvergenz

== Runge--Kutta-Verfahren

- allgemeine Idee verstehen
- konkrete allgemeine Runge--Kutta-Verfahren nicht auswendig lernen
- ein vorgegebenes Verfahren anwenden
- ein gegebenes Butcher-Schema lesen
- Ordnung eines vorgegebenen Verfahrens bestimmen oder überprüfen
