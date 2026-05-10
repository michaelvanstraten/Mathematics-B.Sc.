#import "common.typ": *

#show: problemset("2")

#exercise("Vandermonde-Matrix", [5])[
  Formuliert man die Lagrangesche Interpolationsaufgabe zu $n + 1$ paarweise
  verschiedenen Stützstellen $x_0, dots, x_n$ und gegebenen Werten
  $y_0, dots, y_n$ in der Monombasis ${1, x, dots, x^n}$, so erhält man ein
  lineares Gleichungssystem der Form $V_n a = y$. Dabei bezeichnet
  $a in RR^(n+1)$ die unbekannten Koeffizienten des Interpolationspolynoms
  $p(x) = sum_(j=0)^n a_j x^j$, $y in RR^(n+1)$ den Vektor der gegebenen Werte
  und $V_n in RR^((n+1) times (n+1))$ die Vandermonde-Matrix
  $
    V_n := mat(
      1, x_0, x_0^2, dots, x_0^n;
      1, x_1, x_1^2, dots, x_1^n;
      dots.v, dots.v, dots.v, , dots.v;
      1, x_n, x_n^2, dots, x_n^n;
    ).
  $

  + Zeigen Sie, dass für die Determinante der Vandermonde-Matrix gilt
    $
      det(V_n) = product_(0 <= j < k <= n) (x_k - x_j).
    $
    Begründen Sie anschließend, dass die Fragestellung der Lagrangeschen
    Interpolation für $n + 1$ paarweise verschiedene Stützstellen wohlgestellt
    ist.

  + Berechnen Sie die Determinante der Vandermonde-Matrix im Falle $n + 1$
    äquidistanter Stützstellen auf dem Intervall $[a, b]$, d.h.
    $x_j = a + j (b - a) / n$ für $j = 0, dots, n$.

  + Betrachten Sie die Vandermonde-Matrix zu $n + 1$ äquidistanten Stützstellen
    auf dem Intervall $[0, 1]$ für mindestens 50 logarithmisch verteilte
    $n in [10, 10^3]$. Erstellen Sie mit Matlab einen `loglog` plot der
    Spektralkondition $"cond"(V_n)$ gegen die Anzahl der Stützstellen.
    Interpretieren Sie ihre Ergebnisse kurz.
]

=== Lösung:

+ Wir zeigen die Formel per vollständiger Induktion über $n$. Da
  $det(V_n) = det(V_n^T)$, arbeiten wir mit der transponierten Matrix
  $
    V_n^T = mat(
      1, 1, dots, 1;
      x_0, x_1, dots, x_n;
      dots.v, dots.v, dots.down, dots.v;
      x_0^n, x_1^n, dots, x_n^n;
    ).
  $

  *Induktionsanfang* ($n = 0$): $det(V_0) = 1 =$ (leeres Produkt). $checkmark$

  *Induktionsschritt* ($n - 1 -> n$): Wir subtrahieren $x_0$-mal die $i$-te
  Zeile von der $(i+1)$-ten Zeile, für $i = n, n-1, dots, 1$. Dies ändert die
  Determinante nicht und liefert
  $
    det(V_n^T) = det(
      mat(
        1, 1, dots, 1;
        0, x_1 - x_0, dots, x_n - x_0;
        dots.v, dots.v, dots.down, dots.v;
        0, x_1^n - x_0 x_1^(n-1), dots, x_n^n - x_0 x_n^(n-1);
      )
    ).
  $
  Dabei gilt $x_j^i - x_0 x_j^(i-1) = x_j^(i-1)(x_j - x_0)$ für jede Zeile
  $i >= 1$. Entwicklung nach der ersten Spalte und anschließendes Ausklammern
  von $(x_j - x_0)$ aus der $j$-ten Spalte für $j = 1, dots, n$ ergibt
  $
    det(V_n^T)
    = product_(j=1)^n (x_j - x_0) dot det(
      mat(
        1, 1, dots, 1;
        x_1, x_2, dots, x_n;
        dots.v, dots.v, dots.down, dots.v;
        x_1^(n-1), x_2^(n-1), dots, x_n^(n-1);
      )
    ).
  $
  Die verbleibende Matrix ist genau $V_(n-1)^T$ zu den Stützstellen
  $x_1, dots, x_n$. Nach Induktionsvoraussetzung gilt daher
  $
    det(V_n)
    = product_(j=1)^n (x_j - x_0) dot product_(1 <= i < j <= n) (x_j - x_i)
    = product_(0 <= i < j <= n) (x_j - x_i). quad checkmark
  $

  Da alle Stützstellen paarweise verschieden sind, ist jeder Faktor
  $(x_j - x_i) != 0$, also $det(V_n) != 0$. Damit ist $V_n$ invertierbar und das
  lineare Gleichungssystem $V_n a = y$ besitzt für jede rechte Seite $y$ genau
  eine Lösung. Die Lagrangesche Interpolationsaufgabe ist somit wohlgestellt.

+ Mit $x_j = a + j (b-a)/n$ gilt
  $
    x_k - x_j = (k - j) (b - a) / n,
  $
  sodass
  $
    det(V_n)
    = product_(0 <= j < k <= n) (x_k - x_j)
    = product_(0 <= j < k <= n) (k - j) dot ((b-a)/n)^(n(n+1)/2),
  $
  wobei die Gesamtzahl der Paare $binom(n+1, 2) = n(n+1)/2$ beträgt. Den
  verbleibenden ganzzahligen Anteil faktorisieren wir nach dem inneren Index:
  $
    product_(0 <= j < k <= n) (k - j)
    = product_(k=1)^n product_(j=0)^(k-1) (k - j)
    = product_(k=1)^n k!,
  $
  denn $product_(j=0)^(k-1)(k-j) = k dot (k-1) dots 1 = k!$. Insgesamt ergibt
  sich
  $
    det(V_n) = ((b-a)/n)^(n(n+1)/2) product_(k=1)^n k!.
  $

+ #figure(
    image("problemset-02-1-a-plot.svg", width: 80%),
    caption: [
      Spektralkondition gegen die Anzahl der Stützstellen
    ],
  )

  Die Spektralkondition wächst exponentiell mit der Anzahl der Stützstellen.
  Bereits ab $n approx 20$ überschreitet $"cond"(V_n)$ die Größenordnung
  $10^(18)$, was jenseits der Maschinengenauigkeit doppelter Präzision liegt.
  Das lineare System $V_n a = y$ ist daher für große $n$ numerisch praktisch
  nicht lösbar.


#pagebreak()

#exercise("Newton-Interpolation", [5])[
  + Es sei $f(x) = ln(x)$ auf $RR_+ := {r in RR : r > 0}$ gegeben. Betrachten
    Sie die Stützstellen $x_j = bold(e)^j$ für $j = 0, 1, 2$ und setzen Sie
    $y_j := ln(x_j)$. Bestimmen Sie das Interpolationspolynom mittels des Newton
    Schemas. Geben Sie ihr Interpolationspolynom über den Pfad
    $(j = 0 -> j = 1 -> j = 2)$ sowie $(j = 2 -> j = 1 -> j = 0)$ an.

    _Hinweis._ Sie müssen die erhaltenen Polynome dazu am Ende nicht
    ausmultiplizieren.

  + Sei nun $x_3 = bold(e)^3$ gegeben. Bestimmen Sie den relativen Fehler für
    das Interpolationspolynom $p(x_3)$ aus (a) an $ln(x_3)$. Interpretieren Sie
    ihr Ergebnis. Ist diese Methode sinnvoll zur Approximation von $ln(x)$ auf
    $RR_+$?

    _Hinweis._ Für Ausdrücke, die nicht analytisch zu bestimmen sind, darf mit
    einem Computeralgebrasystem und $bold(e) approx 2.71$ gearbeitet werden.
    Runden Sie dabei alle nicht analytischen Ergebnisse auf 3 Ziffern.
]

=== Lösung:

#pagebreak()

#exercise("Hermite-Interpolation", [5])[
  + Bestimmen Sie die Lösung des folgenden Hermiteschen Interpolationsproblems
    $p(x)$ zu den Bedingungen $p(x_0) = -1$, $p'(x_0) = 1$ und $p(x_1) = 1$ mit
    $m = 1$ sowie $x_0 = 0$ und $x_1 = 1$. Nutzen Sie dazu die verallgemeinerten
    Lagrangepolynome. Geben Sie ihre Lösung in der Monombasis an.

  + Bestimmen Sie die Lösung des folgenden Hermiteschen Interpolationsproblems
    $p(x)$ zu den Bedingungen $p(x_0) = -1$, $p'(x_0) = -2$, $p(x_1) = 0$,
    $p'(x_1) = 10$ und $p''(x_1) = 40$ mit $m = 1$ sowie $x_0 = 0$ und
    $x_1 = 1$. Nutzen Sie dazu die verallgemeinerten dividierten Differenzen.
    Geben Sie das Interpolationspolynom über den Pfad
    $(j = 0 -> j = 0 -> j = 1 -> j = 1 -> j = 1)$ an.

    _Hinweis._ Sie müssen das erhaltene Polynom nicht ausmultiplizieren.
]

=== Lösung:
