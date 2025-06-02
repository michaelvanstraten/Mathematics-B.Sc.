#import "common.typ": *

#show: problemset(2)

#let author(name, matrikelnummer: "--") = box[
  #name \
  #matrikelnummer
]

#pad(
  y: 1cm,
  align(
    center,
    [
      = Digitale Systeme SS2025 \
      == Abgabe zu Hausaufgaben 2
      #box[
        #author("Fabian Kubala") #h(1fr)
        #author("David S. Spyra", matrikelnummer: 633014) #h(1fr)
        #author("Michael van Straten", matrikelnummer: 637986) #h(1fr)
        #author("Steven C.H. Szobries", matrikelnummer: 630097)
      ] \
      #block(above: 1em, line(length: 100%, stroke: 0.5pt))
    ],
  ),
)


#exercise([4])[
  + Zeichnen Sie den Logikplan eines 3-bit Addierers auf Basis von Volladdierern auf Gatterebene.
    Stellen Sie im Logikplan die Addition der Zahlen $x = 2$ und $y = 1$ dar.

    Verwenden Sie zur Erstellung des Logikplans circuitverse.org und richten Sie sich nach dieser Vorlage:

    #block(
      width: 100%,
      inset: 10pt,
      stroke: 0.5pt,
      radius: 4pt,
    )[
      #align(center)[
        *3-bit Addierer*

        #image("./template-for-3-bit-adder.png", width: 30%),
      ]
    ]

    Die gesamte Aufgabe gilt nur als gelöst, wenn das vorgegebene Entwicklungs-/Simulationswerkzeug verwendet wird.

  + Berechnen Sie die Zeit für die Generierung der Summe und des Übertrags der letzten Stelle eines, ebenfalls aus Volladdieren bestehenden, 4-bit-Addierers bei einer Gatterlaufzeit von 13 ns.

  + Geben Sie die Schaltfunktionen für die Überlaufbits $c_0$, $c_2$ und das Summenbit $s_3$ eines 4-Bit Carry-Look-Ahead-Addierers an.
]

*Lösung*

+ Der Logikplan eines 3-bit Addierers besteht aus drei Volladdierern, die miteinander verbunden sind.

  #block(
    width: 100%,
    inset: 10pt,
    stroke: 0.5pt,
    radius: 4pt,
  )[
    #align(center)[
      *3-bit Addierer* - #link(
        "https://circuitverse.org/users/315587/projects/digitale-systeme-ss2025-hausaufgaben-2-1-gruppe-30",
      )[Link zur Simulation]
      #image("3-bit-adder.png", width: 30%)
    ]
  ]

+ Für die Berechung der Summer und des Übertrags für einen Volladdierer benötigt
  es genau jeweils zwei Gatterlaufzeiten. Für jeden weiteren Volladierer kommen
  somit zwei weitere Gatterlaufzeiten hinzu. Für denn fall einees 4-bit-Addierers
  mit einer Gatterlaufzeit von 13 ns kommen wir somit auf
  $
    4 dot (13"ns"+ 13"ns") = 104"ns"
  $

+ Definieren wir zunächst basierend auf der Schaltfunktion des Ripple Carry
  Addieres die Generierenden
  $
    G_i := x_i y_i
  $
  sowie Propagierende Schaltfunktion
  $
    P_i := x_i or y_i,
  $
  die berechnung des Überlaufbits an der $i$-ten stelle ergibt sich somit als:
  $
    c_i = G_i or P_i c_(i-1).
  $
  Für den fall $i = 0$ also $c_0$ ergibt sich
  $
    c_0 = G_0 or P_0 c_(-1) = x_0 y_0 or (x_0 or y_0)c_(-1).
  $
  Für $i = 2$ ergibt sich mit rekursiven auflösens der $c_{i-1}$ nun folgendes
  $
    c_2 &= G_2 or P_2 c_1 \
    &= G_2 or P_2 (G_1 or P_1 c_0) \
    &= G_2 or P_2 (G_1 or P_1(G_0 or P_0 c_(-1))) \
    &= x_2 y_2 or (x_2 or y_2) (x_1 y_2 or (x_1 or y_1)(x_0 y_0 or (x_0 or y_0)c_(-1))).
  $
  Für das Summenbit $s_3$ folgt:
  $
    s_3 = x_3 not y_3 not c_2 or not x_3 y_3 not c_2 or not x_3 not y_3 c_2 or x_3 y_3 c_2.
  $
