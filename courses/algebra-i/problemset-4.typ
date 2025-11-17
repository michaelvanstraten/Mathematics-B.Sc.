#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#import "common.typ": *

#show: problemset(4)

#aufgabe[
  + Bestimmen Sie alle Untergruppen der alternierenden Gruppe $A_4$ und zeichnen
    Sie das zugehörige Hasse-Diagramm aller dieser Untergruppen (siehe Skript
    von Thomas Kramer, S. 26).

  + Welche dieser Untergruppen sind konjugiert zueinander? Welche Untergruppen
    sind Normalteiler?
]

=== Lösung:

+ Die alternierende Gruppe $A_4$ setzt sich aus allen $s in S_4$ zusammen,
  sodass $s$ als eine gerade Anzahl an Transpositionen geschrieben werden kann.

  Definieren wir nun eine Funktion $f$ von $A_4$ nach $S_4 without A_4$ wie
  folgt:
  $
    f(s) = s dot (12),
  $
  wobei $(12)$ die Transposition ist, die eins und zwei tauscht.

  Diese Funktion ist offensichtlich bijektiv, woraus folgt, dass
  $abs(A_4) = abs(S_4 without A_4)$.

  Mit der bekannten Formel für die Ordnung der symmetrischen Gruppe folgt
  $
    abs(A_4) = 1/2 4! = 12.
  $

  Diese 12 Permutationen sind
  $
    A_4 = {
      e,
      (123),
      (132),
      (134),
      (143),
      (142),
      (124),
      (234),
      (243),
      (12)(34),
      (13)(24),
      (14)(23)
    }
  $

  _*Die Untergruppen ergeben sich somit wie folgt.*_

  Nach dem Satz von Lagrange können Untergruppen von $A_4$ die Ordnungen
  $1, 2, 3, 4, 6$ oder $12$ haben.

  *Ordnung 1:* Nur die triviale Untergruppe ${e}$.

  *Ordnung 2:* Alle disjunkten Zwei-Zyklen ${(12)(34), (13)(24), (14)(23)}$
  vereinigt mit der Identität ergeben Untergruppen, da für $(i j)(k l) in S_n$
  gilt, dass $(i j)(k l)^2 = e$.

  *Ordnung 3:* Für die Drei-Zyklen $(i j k)$ gilt, dass ${e , (i j k), (i k j)}$
  Untergruppen bilden, da $(i j k)^2 = (i k j) = (i j k)^(-1)$ ist.

  Bemerke, dass die disjunkten Zwei-Zyklen nicht Elemente von Untergruppen der
  Ordnung drei sein können, da
  $
    (12)(34)(13)(24) = (14)(23). quad (*)
  $

  *Ordnung 4:* Die einzige Untergruppe der Ordnung vier ist
  ${e, (12)(34), (13)(24), (14)(23)}$.

  Dies folgt aus $(*)$: Diese vier Elemente bilden eine Gruppe.

  Andere Kombinationen von vier Elementen können keine Untergruppe bilden, da
  sie entweder nicht unter der Verknüpfung abgeschlossen sind oder Drei-Zyklen
  enthalten würden.

  *Ordnung 6:* Es gibt keine Untergruppe der Ordnung 6.

  Nach dem Satz von Sylow müsste eine solche Untergruppe einen
  3-Sylow-Untergruppe und eine 2-Sylow-Untergruppe enthalten, aber die Struktur
  von $A_4$ lässt dies nicht zu.

  *Ordnung 12:* Die Gruppe $A_4$ selbst.

  Das Hasse-Diagramm sieht wie folgt aus:

  #diagram(
    // Top: A_4
    node((3, 0), $A_4$, name: <G>),

    // Level 1: Order 4 subgroup (left) and Order 3 subgroups (spread out)
    node((0, 1), text(size: 7pt, ${e,(12)(34),(13)(24),(14)(23)}$), name: <4>),
    edge(<4>, <G>),

    node((1.5, 1), text(size: 7pt, ${e, (123), (132)}$), name: <3_1>),
    edge(<3_1>, <G>),
    node((2.5, 1), text(size: 7pt, ${e, (134), (143)}$), name: <3_2>),
    edge(<3_2>, <G>),
    node((3.5, 1), text(size: 7pt, ${e, (142), (124)}$), name: <3_3>),
    edge(<3_3>, <G>),
    node((4.5, 1), text(size: 7pt, ${e, (234), (243)}$), name: <3_4>),
    edge(<3_4>, <G>),

    // Level 2: Order 2 subgroups (under order 4 subgroup only)
    node((-0.8, 2), text(size: 7pt, ${e, (12)(34)}$), name: <2_1>),
    edge(<2_1>, <4>),
    node((0, 2), text(size: 7pt, ${e, (13)(24)}$), name: <2_2>),
    edge(<2_2>, <4>),
    node((0.8, 2), text(size: 7pt, ${e, (14)(23)}$), name: <2_3>),
    edge(<2_3>, <4>),

    // Bottom: Identity subgroup
    node((1.8, 3), ${e}$, name: <e>),
    edge(<e>, <2_1>),
    edge(<e>, <2_2>),
    edge(<e>, <2_3>),
    edge(<e>, <3_1>),
    edge(<e>, <3_2>),
    edge(<e>, <3_3>),
    edge(<e>, <3_4>),
  )

+ Die Untergruppen der Ordnung 2 sind alle konjugiert zueinander, da sie alle
  von disjunkten Zwei-Zyklen erzeugt werden und $A_4$ transitiv auf den Mengen
  disjunkter Zwei-Zykel-Paare wirkt.

  Die Untergruppen der Ordnung 3 sind alle konjugiert zueinander, da sie alle
  von Drei-Zyklen erzeugt werden und alle Drei-Zyklen in $A_4$ konjugiert sind.

  Die triviale Untergruppe ${e}$ ist immer ein Normalteiler.

  $A_4$ selbst ist immer ein Normalteiler.

  Die Vierergruppe ${e, (12)(34), (13)(24), (14)(23)}$ ist ein Normalteiler, da
  sie Index 3 hat. (Untergruppen mit Index gleich dem kleinsten Primteiler der
  Gruppenordnung sind stets normal.)

  Die Untergruppen der Ordnung 2 sind keine Normalteiler, da sie Index 6 haben
  und nicht alle Konjugierten gleich sind.

  Die Untergruppen der Ordnung 3 sind keine Normalteiler, da sie Index 4 haben
  und es mehrere nicht-konjugierte gibt.

#pagebreak()

#aufgabe[
  Sei $G$ eine endliche Gruppe und sei $n in NN$.

  + Zeigen Sie, dass auf der Menge $M := {f : G -> {1, ..., n}}$ durch
    $
      (g dot.c f)(h) := f(g^(-1) h)
    $
    eine $G$-Wirkung definiert wird.

  + Beschreiben Sie die Menge
    $
      "Fix"(G, M) := {f in M | g dot.c f = f "für alle" g in G}
    $
    der Fixpunkte dieser Wirkung. Wieviele Fixpunkte gibt es?

  + Sei $G$ zyklisch mit $|G| = p$ wobei $p$ eine Primzahl sei. Was besagt die
    Bahnformel für die obige Operation? Folgern Sie daraus einen weiteren Beweis
    des kleinen Fermat: Für alle $n in NN$ gilt
    $
      n^p equiv n quad mod p.
    $
]

=== Lösung:

+ Da $e^(-1) = e in G$, folgt dass
  $
    (e dot f)(h) = f(e^(-1)h) = f(e h) = f(h)
  $
  also gilt $e dot f = f$.

  Für $g_1, g_2 in G$ folgt dass
  $
    (g_1 dot (g_2 dot f))(h) & = (g_2 dot f)(g_1^(-1) h) \
                             & = f(g_2^(-1) g_1^(-1) h) \
                             & = f((g_1 g_2)^(-1) h) \
                             & = ((g_1 g_2) dot f)(h).
  $

  Also ist $dot$ eine $G$-Wirkung.

+ Sei $f in op("Fix")(G, M)$. Dann gilt für alle $g in G$ dass $g dot f = f$,
  das heißt $(g dot f)(h) = f(h)$ für alle $h in G$.

  Nach Definition der Wirkung bedeutet dies $f(g^(-1) h) = f(h)$ für alle
  $g, h in G$.

  Setzen wir $h = e$ (das neutrale Element), so erhalten wir für alle $g in G$:
  $
    f(g^(-1)) = f(e).
  $
  Da jedes Element $x in G$ als $x = g^(-1)$ für ein geeignetes $g in G$
  geschrieben werden kann, ist $f$ konstant.

  Es gibt genau $n$ konstante Funktionen von $G$ nach ${1, …, n}$, also
  $abs(op("Fix")(G, M)) = n$.

+ Die Ordnung der Menge $M$ ist $n^p$.

  Die Bahnformel besagt, dass für die Ordnung von $M$ gilt
  $
    abs(M) = sum_(f in R) [G : op("Stab")_G (f)],
  $
  wobei $R subset M$ aus jeder Bahn der G-Wirkung ein Element enthält.

  Da die Bahn jedes $f in op("Fix")(G, M)$ nur ein Element, nämlich genau $f$,
  enthält, folgt dass $op("Fix")(G, M) subset.eq R$ ist.

  Wir erhalten somit
  $
    n^p - n = sum_(f in R without op("Fix")(G, M)) [G:op("Stab")_G (f)].
  $

  Da $G$ Primordnung $p$ hat, sind nach dem Satz von Lagrange die einzigen
  möglichen Ordnungen für Untergruppen von $G$ die Zahlen $1$ und $p$. Für
  $f in.not op("Fix")(G, M)$ kann $op("Stab")_G (f)$ nicht die Ordnung $p$ haben
  (sonst wäre $op("Stab")_G (f) = G$ und damit $f in op("Fix")(G, M)$). Also
  folgt $abs(op("Stab")_G (f)) = 1$ und damit $[G:op("Stab")_G (f)] = p$.

  Also gilt
  $
    n^p - n = m p
  $
  für ein $m in NN$.

#pagebreak()

#aufgabe[
  Es seien $G$ eine endliche Gruppe, $p$ der kleinste Primteiler von $|G|$ und
  $U subset.eq G$ eine Untergruppe mit Index $p$. Zeigen Sie, dass $U$ ein
  Normalteiler in $G$ ist.

  _Tipp:_ Betrachten Sie dazu den Homomorphismus
  $
    phi: G -> S(G slash U) \
    g |-> phi(g) := [h U |-> g h U]
  $
  wobei $S(G slash U)$ die Gruppe der Bijektionen $G slash U -> G slash U$
  bezeichnet, mit $G slash U$ der Menge der Linksnebenklassen von $U$. Beweisen
  Sie $|"im"(phi)| = p$, und bestimmen Sie damit $"im"(phi)$. Folgern Sie
  $U subset.eq ker(phi)$, und damit $ker phi = U$.
]

=== Lösung:

Die Ordnung der Gruppe $S(G slash U)$, also diejenige der Bijektionen von
$G slash U$ auf sich selbst, ist genau $p!$.

Betrachten wir nun $phi$ wie im _Tipp_ definiert.

Nach dem ersten Isomorphiesatz gilt $G slash ker(phi) tilde.equiv im(phi)$.

Da $im(phi) <= S(G slash U)$ ist, folgt aus dem Satz von Lagrange, dass
$abs(im(phi))$ ein Teiler von $abs(S(G slash U)) = p!$ ist.

Andererseits ist
$abs(im(phi)) = abs(G slash ker(phi)) = abs(G) slash abs(ker(phi))$.

Da $ker(phi) <= U$ folgt mit dem Satz von Lagrange, dass
$
  [G:ker(phi)] = [G:U] [U:ker(phi)] = p k,
$
wobei $k := [U:ker(phi)]$.

Also folgt, dass $p k | p!$, oder anders ausgedrückt: $k | (p-1)!$.

Angenommen, $l$ ist ein Primfaktor von $k$. Da $p$ der kleinste Primfaktor der
Ordnung von $G$ ist, muss $l >= p$ gelten. Die Zahl $(p - 1)!$ enthält jedoch
nur Primfaktoren kleiner als $p$, und somit kann $k$ keinen Primfaktor $>= p$
haben. Daher muss $k = 1$ sein.

Somit folgt, dass $U = ker(phi)$ und somit ist $U$ ein Normalteiler von $G$.
