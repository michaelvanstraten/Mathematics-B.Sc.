#import "common.typ": *

#show: problemset("5")

#aufgabe[
  Sei $G$ eine Gruppe der Ordnung $|G| = 231 = 3 dot.c 7 dot.c 11$.

  + Zeigen Sie, dass $G$ genau eine $11$-Sylowgruppe $H lt.eq G$ besitzt.

  + Zeigen Sie, dass für ihre Automorphismengruppe gilt:
    $"Aut"(H) = ZZ slash 10 ZZ$.

  + Folgern Sie durch Betrachten der Konjugationsoperation von $G$, dass $H$ im
    Zentrum von $G$ ist.
]

=== Lösung:

+ Wir zeigen zunächst, dass $n_p (G)$ die Zahl $abs(G) slash p^k$ teilt, wobei
  $p^k$ die höchste Potenz von $p$ ist, die $abs(G)$ teilt.

  Nach dem dritten Satz von Sylow (in der Vorlesung) gilt:
  - $n_p (G)$ teilt $abs(G)$, und
  - $n_p (G) equiv 1 mod p$.

  Aus der zweiten Bedingung folgt $gcd(n_p (G), p) = 1$, d.h. $n_p (G)$ ist
  nicht durch $p$ teilbar.

  Sei $abs(G) = p^k dot m$ mit $gcd(p, m) = 1$. Da $n_p (G)$ die Zahl $abs(G)$
  teilt und $gcd(n_p (G), p) = 1$ ist, muss $n_p (G)$ ein Teiler von $m$ sein.
  Also teilt $n_p (G)$ die Zahl $abs(G) slash p^k = m$.

  Für $p = 11$ und $abs(G) = 231 = 3 dot.c 7 dot.c 11$ gilt
  $abs(G) slash 11 = 21 = 3 dot.c 7$. Somit muss $n_11 (G) in {1, 3, 7, 21}$
  sein.

  Da außerdem $n_11 (G) equiv 1 mod 11$ gelten muss, folgt aus
  $
     1 & eq.triple 1  & mod 11 quad checkmark \
     3 & eq.triple 3  & mod 11 quad crossmark \
     7 & eq.triple 7  & mod 11 quad crossmark \
    21 & eq.triple 10 & mod 11 quad crossmark \
  $
  das es genau eine normale $11$-Sylowgruppe gibt.

+ Jede Gruppe der Ordnung $p$, wobei $p$ prim ist, ist isomorph zu der Gruppe
  $ZZ slash p ZZ$, also gilt $"Aut"(H) tilde.equiv "Aut"(ZZ slash 11 ZZ)$.

  Wie wir in einer der ersten Übungsaufgaben gezeigt haben, hängt jedes
  $phi in "Aut"(ZZ slash 11 ZZ)$ nur von $phi([1])$ ab.

  Also folgt $abs("Aut"(ZZ slash 11 ZZ)) = 10$, da jedes $phi$ die $[0]$ auf
  $[0]$ abbilden muss.

  Zudem folgt, dass $"Aut"(ZZ slash 11 ZZ)$ zyklisch ist, da für
  $phi in "Aut"(ZZ slash 11 ZZ)$ mit $phi([1]) = [2]$ gilt
  $
    angle.l phi([1]) angle.r = ZZ slash 11 ZZ.
  $
  Diese zyklische Gruppe der Ordnung $10$ ist allerdings isomorph zu
  $ZZ slash 10 ZZ$.

+ Betrachte die Konjugationsoperation von $G$ auf $H$, definiert durch
  $
    Phi : G -> "Aut"(H), quad g |-> (h |-> g h g^(-1)).
  $

  Nach dem Homomorphiesatz gilt
  $
    G slash ker(Phi) tilde.equiv im(Phi) <= "Aut"(H).
  $
  Insbesondere gilt $abs(G slash ker(Phi)) = abs(im(Phi))$, und $abs(im(Phi))$
  teilt $abs("Aut"(H)) = 10$.

  Nach dem Satz von Lagrange teilt $abs(G slash ker(Phi))$ auch
  $abs(G) = 231 = 3 dot.c 7 dot.c 11$. Die gemeinsamen Teiler von
  $10 = 2 dot.c 5$ und $231 = 3 dot.c 7 dot.c 11$ sind nur $gcd(10, 231) = 1$.

  Also folgt $abs(G slash ker(Phi)) = 1$, d.h. $G = ker(Phi)$. Das bedeutet, für
  alle $g in G$ und $h in H$ gilt $g h g^(-1) = h$, also $g h = h g$.

  Somit liegt $H$ im Zentrum $Z(G)$ von $G$.

#pagebreak()

#aufgabe[
  Sei $G$ eine endliche Gruppe, $H lt.eq G$ eine Untergruppe und $p$ eine
  Primzahl.

  + Sei $N lt.eq G$ ein Normalteiler und bezeichne mit $pi : G -> G slash N$,
    $g |-> g N$ die Projektion. Zeigen Sie, dass folgende Aussagen äquivalent
    sind:

    (i) $H$ ist eine $p$-Sylowgruppe in $G$.

    (ii) $H sect N$ ist eine $p$-Sylowgruppe in $N$, und $pi(H)$ ist eine
    $p$-Sylowgruppe in $G slash N$.

  + Geben Sie ein Beispiel für $G$, $H$ und eine (nicht normale) Untergruppe
    $U lt.eq G$ an, sodass $H$ eine $p$-Sylowgruppe in $G$, aber $H sect U$
    keine $p$-Sylowgruppe in $U$ ist.
]

=== Lösung:

+ Sei $N triangle.small.l G$ und $pi : G -> G slash N$, $g |-> g N$ die
  kanonische Projektion.

  ==== Ein nützliches Lemma

  Für jede Untergruppe $K lt.eq G$ gilt
  $
    abs(K) = abs(K sect N) dot abs(pi(K)).
  $

  *Beweis.* Die Einschränkung $pi|_K : K -> pi(K)$ ist ein surjektiver
  Homomorphismus mit Kern
  $
    ker(pi|_K) = K sect N.
  $
  Nach dem Homomorphiesatz gilt
  $
    K slash (K sect N) tilde.equiv pi(K),
  $
  also
  $
    abs(K) = abs(K sect N) dot abs(pi(K)).
  $
  #h(1fr) $qed$

  ---

  Schreibe
  $
    abs(G) = p^a m, quad abs(N) = p^b n, quad abs(G slash N) = p^c r,
  $
  mit $p divides.not m, n, r$. Dann liefert
  $abs(G slash N) = abs(G) slash abs(N)$
  $
    a = b + c. #h(1em) (1)
  $

  Bezeichne mit $v_p (X)$ den Exponenten von $p$ in $abs(X)$.

  ==== (i) $=>$ (ii)

  Angenommen $H$ ist eine $p$-Sylowgruppe von $G$. Dann gilt
  $
    abs(H) = p^a quad quad ("da" v_p (abs(G)) = a).
  $
  Setze
  $
    abs(H sect N) = p^alpha, quad quad abs(pi(H)) = p^beta
  $
  mit $alpha, beta gt.eq 0$. Beide sind $p$-Gruppen (Schnitt und Bild einer
  $p$-Gruppe).

  Nach dem Lemma gilt
  $
    abs(H) = abs(H sect N) dot abs(pi(H)) = p^alpha p^beta = p^(alpha + beta).
  $
  Da $abs(H) = p^a$, folgt
  $
    alpha + beta = a. #h(1em) (2)
  $

  Andererseits gilt $H sect N lt.eq N$ und $pi(H) lt.eq G slash N$, also
  $
    alpha lt.eq v_p (abs(N)) = b, quad quad beta lt.eq v_p (abs(G slash N)) = c. #h(1em) (3)
  $

  Addition dieser Ungleichungen liefert
  $
    alpha + beta lt.eq b + c = a
  $
  (nach (1)), aber nach (2) gilt bereits $alpha + beta = a$. Daher muss
  Gleichheit in (3) gelten, d.h.
  $
    alpha = b, quad quad beta = c.
  $

  Also ist $abs(H sect N) = p^b = p^(v_p (abs(N)))$, somit ist $H sect N$ eine
  $p$-Sylowgruppe von $N$.

  Ebenso ist $abs(pi(H)) = p^c = p^(v_p (abs(G slash N)))$, also ist $pi(H)$
  eine $p$-Sylowgruppe von $G slash N$.

  Dies zeigt (ii).

  ---

  ==== (ii) $=>$ (i)

  Umgekehrt nehmen wir an, dass

  - $H sect N$ eine $p$-Sylowgruppe von $N$ ist, und
  - $pi(H)$ eine $p$-Sylowgruppe von $G slash N$ ist.

  Dann gilt
  $
    abs(H sect N) = p^b, quad quad abs(pi(H)) = p^c,
  $
  wobei wieder $b = v_p (abs(N))$ und $c = v_p (abs(G slash N))$.

  Nach dem Lemma gilt
  $
    abs(H) = abs(H sect N) dot abs(pi(H)) = p^b p^c = p^(b + c).
  $
  Mit (1) ist $b + c = a = v_p (abs(G))$. Also
  $
    abs(H) = p^(v_p (abs(G))),
  $
  somit hat $H$ die volle $p$-Potenz von $abs(G)$ und ist daher eine
  $p$-Sylowgruppe von $G$.

  Damit sind (i) und (ii) äquivalent.

+ Wähle
  $
    G = S_3, quad quad p = 2.
  $

  Die Gruppe $S_3$ hat Ordnung $6 = 2 dot 3$. Jede Untergruppe der Ordnung $2$
  ist eine $2$-Sylowgruppe.

  Sei
  $
    H = angle.l (1, 2) angle.r, quad quad U = angle.l (1, 3) angle.r.
  $

  Dann gilt:

  - $abs(H) = 2$, also ist $H$ eine $2$-Sylowgruppe von $G$.
  - $U$ ist eine Untergruppe der Ordnung $2$, also nicht normal in $S_3$.
  - $H sect U = {e}$, also von Ordnung $1$.

  Aber in $U$ gilt $abs(U) = 2$, also muss jede $2$-Sylowgruppe von $U$ Ordnung
  $2$ haben. Daher ist $H sect U$ (von Ordnung $1$) *keine* $2$-Sylowgruppe von
  $U$.

  Dies liefert das gewünschte Beispiel, bei dem $U$ nicht normal ist und die
  Äquivalenz aus Teil (a) nicht gilt.

#pagebreak()

#aufgabe[
  + Sei $G$ eine Gruppe, und seien Normalteiler $P, Q triangle.small.l G$
    gegeben mit $P sect Q = {e}$ und $P dot.c Q = G$. Zeigen Sie, dass gilt:
    $G tilde.equiv P times Q$.

  + Ermitteln Sie bis auf Isomorphie alle Gruppen, die das Geburtsjahr von Otto
    Ludwig Hölder (also $1859 = 11 dot.c 13^2$) als Ordnung haben.
]

=== Lösung:

+ Definieren wir eine Funktion $phi$ von $G$ nach $P times Q$ durch
  $
    phi(g) = phi(p q) = (p, q) quad quad "mit" quad quad p in P "und" q in Q.
  $

  Diese Funktion ist wohldefiniert, da für zwei Repräsentationen von $g$ mit
  $
    g = p q = tilde(p) tilde(q) quad quad "mit" quad quad p, tilde(p) in P
    "und" q, tilde(q) in Q
  $
  folgt, dass
  $
    underbrace(tilde(p)^(-1) p, in P) = underbrace(tilde(q) q^(-1), in Q)
  $
  und somit $p = tilde(p)$ und $q = tilde(q)$ da $P inter Q = {e}$ ist.

  Für alle $p in P$ und $q in Q$ gilt, dass
  $
    p q p^(-1) q^(-1) = e => p q = q p
  $
  da $p q p^(-1) in Q$ (weil $Q$ normal ist) und $q p^(-1) q^(-1) in P$ (weil
  $P$ normal ist) und somit $p q p^(-1) q^(-1) in P inter Q = {e}$.

  Die Funktion $phi$ ist ein Homomorphismus, da für $g_1, g_2 in G$ mit
  $
    g_1 = p_1 q_1 "sowie" g_2 = p_2 q_2 quad p_1, p_2 in P "und" q_1,q_2 in Q
  $
  gilt, dass
  $
    phi(g_1 g_2) & = phi(p_1 q_1 p_2 q_2) \
                 & = phi(p_1 p_2 q_1 q_2) \
                 & = (p_1 p_2, q_1 q_2) \
                 & = (p_1, q_1 ) dot (p_2, q_2) \
                 & = phi(g_1) dot (g_2)
  $

  Seien $g_1 = p_1 q_1, g_2 = p_2 q_2 in G$ mit $phi(g_1) = phi(g_2)$, so folgt
  $
    (p_1, q_1) = (p_2, q_2) => g_1 = g_2.
  $
  Also ist $phi$ injektiv.

  Sei $(p, q) in P times Q$, dann ist $phi(p q) = (p, q)$, also ist $phi$
  surjektiv.

+ Mit dem dritten Satz von Sylow folgt, dass $n_11(G)$ die Zahl
  $abs(G) / 11 = 13^2 = 169$ teilen muss. Also $n_11(G) in {1, 13, 169}$. Zudem
  muss $n_11(G) equiv 1 mod 11$ gelten. Da $13 equiv 2 mod 11$ und
  $169 equiv 4 mod 11$, folgt $n_11(G) = 1$.

  Für $n_13(G)$ gilt: $n_13(G)$ teilt $abs(G) / 13^2 = 11$ und
  $n_13(G) equiv 1 mod 13$. Also $n_13(G) in {1, 11}$. Da
  $11 equiv 11 mod 13 equiv.not 1 mod 13$, folgt $n_13(G) = 1$.

  Also existieren zwei normale $p$-Sylowgruppen $P_11$ und $P_13$ mit Ordnung
  $11$ und $13^2$. Elemente in $P_11$ müssen Ordnung $1$ oder $11$ haben.
  Elemente in $P_13$ müssen Ordnung $1, 13$ oder $13^2$ haben nach dem Satz von
  Lagrange. Also ist $P_11 inter P_13 = {e}$.

  Für die Ordnung von $P_11 dot P_13$ folgt
  $
    abs(P_11 dot P_13) = (abs(P_11) abs(P_13)) / abs(P_11 inter P_13) = 1859.
  $

  Da Elemente von $P_11$ und $P_13$ kommutieren, siehe die (a), folgt
  $P_11 dot P_13 = G$.

  Somit ist $G tilde.equiv P_11 times P_13$ nach der (a).

  Da $11$ eine Primzahl ist, folgt $P_11 tilde.equiv ZZ slash 11 ZZ$ (jede
  Gruppe von Primzahlordnung ist zyklisch).

  Für $P_13$ gibt es nach dem Hauptsatz über endlich erzeugte abelsche Gruppen
  zwei Möglichkeiten:

  - Fall 1: $P_13 tilde.equiv ZZ slash 169 ZZ$ (wenn $P_13$ ein Element der
    Ordnung $169$ enthält),

  - Fall 2: $P_13 tilde.equiv ZZ slash 13 ZZ times ZZ slash 13 ZZ$ (wenn jedes
    nichttriviale Element Ordnung $13$ hat).


  Bis auf Isomorphie gibt es genau zwei Gruppen der Ordnung $1859$:
  $
    G tilde.equiv ZZ slash 11 ZZ times ZZ slash 169 ZZ
  $
  und
  $
    G tilde.equiv ZZ slash 11 ZZ times ZZ slash 13 ZZ times ZZ slash 13 ZZ.
  $
