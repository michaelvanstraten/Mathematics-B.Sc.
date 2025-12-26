#import "common.typ": *

#show: problemset("6")

#aufgabe[
  Sei
  $
    0 -> H overset(i, ->) G overset(p, ->) K -> 0
  $
  eine _kurze exakte Sequenz_ von Homomorphismen abelscher Gruppen, d.h. $i$ ist
  injektiv, $p$ ist surjektiv und $ker p = "im" i$.

  + Beweisen Sie, dass folgende Aussagen äquivalent sind:

    + Es gibt einen Homomorphismus $j : K -> G$, so dass $p compose j = "id"_K$.

    + Es gibt einen Homomorphismus $q : G -> H$, so dass $q compose i = "id"_H$.

    + Es gibt einen Isomorphismus $Phi : G -> H times K$, so dass
      $Phi compose i(h) = (h, 0)$ und $p compose Phi^(-1)(h, k) = k$ für alle
      $h in H$ und $k in K$.

  + Wir sagen, dass eine kurze exakte Sequenz _zerfällt_, falls sie die
    äquivalenten Eigenschaften aus (a) erfüllt. Bestimmen Sie für folgende
    exakte Sequenzen ob sie zerfallen:

    + $
        0 -> ZZ overset(x |-> 5x, ->) ZZ overset([x] |-> [x], ->) ZZ slash 5 ZZ -> 0
      $

    + $
        0 -> ZZ slash 10 ZZ overset([x] |-> [7x], ->) ZZ slash 70 ZZ overset([x] |-> [x], ->) ZZ slash 7 ZZ -> 0
      $

    + $
        0 -> ZZ slash 3 ZZ overset([x] |-> [3x], ->) ZZ slash 9 ZZ overset([x] |-> [x], ->) ZZ slash 3 ZZ -> 0
      $
]

=== Lösung:

+ Beweisen wir die Äquivalenz durch einen Ringschluss.

  *(i) $=>$ (ii)*

  Für alle $g in G$ folgt für $g - j(p(g))$ das
  $
    p(g - j(p(g))) = p(g) - p(j(p(g))) = 0,
  $
  da $p compose j = "id"_K$ und somit $g - j(p(g)) in ker p$.

  Da $i$ injektiv ist und $ker p = im i$ existiert ein eindeutiges $h in H$
  sodass $i(h) = g - j(p(g))$. Definieren wir die Funktion $q : G -> H$ für
  jedes $g in G$ als genau dieses $h$ also
  $
    q(g) colon.eq i^(-1)(g - j(p(g))).
  $

  Sei $g_1, g_2 in G$ so folgt
  $
    i(q(q_1 + g_2)) & = g_1 + g_2 - j(p(g_1 + g_2)) \
                    & = g_1 - j(p(g_1)) + g_2 - j(p(g_2)) \
                    & = g_1 - j(p(g_1)) + g_2 - j(p(g_2)) \
                    & = i(i^(-1)(g_1 - j(p(g_1)))) + i(i^(-1)(g_2 - j(p(g_2)))) \
                    & = i(q(g_1)) + i(q(g_2)),
  $
  und da $i$ injektiv ist, folgt dass $q(q_1 + g_2) = q(g_1) + q(g_2)$ und somit
  $q in "Hom"(G, H)$.

  Sei $h in H$, aus $p(i(h)) = 0$ folgt dass
  $
    i(q(i(h))) = i(h) - j(p(i(h))) = i(h)
  $
  mit der Injektivität von $i$ folgt nun wieder $q(i(h)) = h$, also
  $q compose i =
  id_"H"$.

  *(ii) $=>$ (iii)*

  Definieren wir $Phi : G -> H times K$ durch $Phi(g) = (q(g), p(g))$. $Phi$ ist
  ein Homomorphismus da $q$ und $p$ Homomorphismen sind und für $g_1, g_2 in G$
  gilt dass
  $
    Phi(g_1 + g_2) = (q(g_1 + g_2), p(g_1 + g_2)) = (q(g_1), p(g_1)) + (q(g_2), p(g_2)) = Phi(g_1) + Phi(g_2)
  $

  Sei $g in ker Phi$, so folgt dass $p(g) = e$, also $g in im i$. Da $g in im i$
  und $q compose i = "id"_H$ folgt dass $q(g) = e <=> g = e$, somit folgt dass
  $Phi$ injektiv ist.

  Sei $(h, k) in H times K$ mit $k eq.not e$ (dieser Fall ist ähnlich, nur dass
  kein $tilde(g)$ gewählt werden muss), da $q compose i = "id"_H$ existiert für
  alle $h in H$ ein $g in G$, sodass $q(g) = h$ mit $g in im i$. Da $p$
  surjektiv ist, existiert zudem ein $tilde(g) in G$, sodass $p(tilde(g)) = k$.
  Für $g + tilde(g)$ folgt dass $p(g + tilde(g)) = p(tilde(g)) = k$, da
  $g in im i$. Wir wissen zudem, dass $q(tilde(g)) = e$, da $i$ injektiv ist und
  $p(q(tilde(g))) = k$. Also ist $Phi(g + tilde(g)) = (h, k)$, und somit ist
  $Phi$ surjektiv.

  Sei $h in H$, so folgt dass $Phi(i(h)) = (q(i(h)), p(i(h))) = (h, 0)$, da
  $q compose i
  = "id"_H$ und $im i = ker p$. #sym.star

  Sei $(h, k) in H times K$, wieder mit $k eq.not e$, und sei $g in G$ sodass
  $p(g) = h$, so folgt
  $
    p(Phi^(-1)((h, k))) & = p(Phi^(-1)(0, k)) + p\(underbrace(
                            Phi^(-1)(h,0), in im
                            i "nach" star
                          )\) \
                        & = p(Phi^(-1)(0, k)) + 0 \
  $
  Wir wissen $Phi(g) = (q(g), p(g)) = (0, k)$ aus dem selben Argument wie im
  Beweis der Surjektivität.

  Also gilt $p(Phi^(-1)((h, k))) = k$.

  *(iii) $=>$ (i)*

  Sei $Phi : G -> H times K$ ein Isomorphismus mit den gegebenen Eigenschaften.
  Definiere $j : K -> G$ durch $j(k) = Phi^(-1)(0, k)$.

  Dann ist $j$ ein Homomorphismus, da $Phi^(-1)$ ein Homomorphismus ist:
  $
    j(k_1 + k_2) = Phi^(-1)(0, k_1 + k_2) = Phi^(-1)((0, k_1) + (0, k_2)) = Phi^(-1)(0, k_1) + Phi^(-1)(0, k_2) = j(k_1) + j(k_2).
  $

  Nach Voraussetzung gilt $p(Phi^(-1)(h, k)) = k$ für alle $h in H$ und
  $k in K$. Insbesondere für $h = 0$ folgt
  $
    (p compose j)(k) = p(j(k)) = p(Phi^(-1)(0, k)) = k = "id"_K(k).
  $
  Also $p compose j = "id"_K$.

+ #linebreak()
  + Kann nicht zerfallen da $ZZ times ZZ slash 5 ZZ tilde.equiv.not ZZ$,
    betrachte hierfür Elemente $(0, x) in ZZ times ZZ slash 5 ZZ$, welche alle
    Ordnung $5$ haben ($5$ ist prim).

  + Diese Sequenz zerfällt. Wir zeigen, dass ein Homomorphismus
    $j : ZZ slash 7 ZZ -> ZZ slash 70 ZZ$ existiert mit $p compose j = "id"$.
    Definiere $j([x]) = [10x]$. Dann ist
    $
      (p compose j)([x]) = p([10x]) = [10x mod 7] = [3x mod 7] = [x],
    $
    da $10 equiv 3 mod 7$ und $3$ das multiplikative Inverse von $1$ modulo $7$
    ist (wegen $3 dot.c 5 equiv 1 mod 7$).

    Bemerke, dass $"ggT"(10, 7) = 1$ und damit $ZZ slash 10 ZZ$ und
    $ZZ slash 7 ZZ$ teilerfremd sind. Nach dem Splitting-Lemma für endliche
    abelsche Gruppen zerfällt die Sequenz, da
    $ZZ slash 70 ZZ tilde.equiv ZZ slash 10 ZZ times ZZ slash 7 ZZ$.

  + Der Fundamentalsatz von abelschen Gruppen sagt uns, dass $ZZ slash 9 ZZ$
    nicht isomorph zu $ZZ slash 3 ZZ times ZZ slash 3 ZZ$ ist, und somit kann
    die Sequenz nicht zerfallen.

#pagebreak()

#aufgabe[
  Sei $R$ ein Integritätsbereich.

  + Zeigen Sie, dass $R[x]$ auch ein Integritätsbereich ist.

  + Bestimmen Sie die Menge der Einheiten $R[x]^times$.

  + Sei $phi : R[x] -> R[x]$ ein Ringhomomorphismus mit $phi|_R = "id"_R$.
    Zeigen Sie: $phi$ ist genau dann bijektiv, wenn es $a in R^times$ und
    $b in R$ gibt mit $phi(x) = a x + b$.
]

=== Lösung:
Im Folgenden benutzen wir die folgende Identität zur Multiplikation zweier
Polynome $f, g in R[x]$ mit $f = (a_0, a_1, ..., a_n, 0, ...)$ und $g = (b_0,
  b_1, ..., b_m, 0, ...)$ $a_i, b_i in R$
$
  c_k = sum_(i + j = k) a_i b_j
$
für $f dot g = (c_0, c_1, ..., c_l, 0, ...)$.

+ Sei $f, g in R[x] without 0$, für $a_n, b_m$ folgt das $a_n b_m eq.not 0$ da
  $R$ ein Integritätsbereich ist. Somit ist $f dot g eq.not 0$.

+ Sei $f in R[x]$ und sei $g in R[x]$ potenziell so, dass $f dot g = 1$. Mit der
  obigen Identität folgt für die Koeffizienten, dass
  $
    c_k = sum_(i + j = k) a_i b_j = cases(1 "wenn" k = 0, 0 "sonst")
  $

  Also folgt für jeden Koeffizienten $b_k$ von $g$ mit $k >= 1$, dass
  $
    b_k = - a_0^(-1) (sum_(i + j = k, i != 0) a_i b_j).
  $
  Somit hängt die invertierbarkeit von $f$ nur von $a_0$ ab.

  Also folgt
  $
    R[x]^times = R^times
  $

+ Sei $phi : R[x] -> R[x]$ ein Ringhomomorphismus mit $phi|_R = "id"_R$.

  "$arrow.l.double$": Sei $phi(x) = a x + b$ mit $a in R^times$ und $b in R$.

  _Injektivität:_ Sei $f = sum_(i=0)^n c_i x^i in ker phi$. Dann ist
  $
    0 = phi(f) = sum_(i=0)^n c_i phi(x)^i = sum_(i=0)^n c_i (a x + b)^i.
  $
  Betrachte den Koeffizienten von $x^n$: Dieser ist $c_n a^n = 0$. Da
  $a in R^times$ ist und $R$ ein Integritätsbereich ist, folgt $c_n = 0$.
  Induktiv folgt $c_(n-1) = dots.h = c_0 = 0$, also $f = 0$ und $phi$ ist
  injektiv.

  _Surjektivität:_ Definiere $psi : R[x] -> R[x]$ durch
  $psi(x) = a^(-1)(x - b)$. Dann ist
  $psi(phi(x)) = psi(a x + b) = a^(-1)((a x + b) - b) = x$ und analog
  $phi(psi(x)) = x$. Daraus folgt $phi compose psi = psi compose phi = "id"$ und
  $phi$ ist bijektiv.

  "$arrow.r.double$": Sei $phi$ bijektiv. Schreibe
  $phi(x) = sum_(i=0)^n a_i x^i$ mit $a_i in R$.

  Da $phi$ bijektiv ist, existiert ein Polynom $g in R[x]$ mit $phi(g) = x$. Aus
  der Gradformel folgt: Wenn $deg(phi(x)) > 1$, dann ist $deg(phi(g)) >= 2$;
  Widerspruch zu $phi(g) = x$. Also ist $deg(phi(x)) <= 1$.

  Da $phi$ surjektiv ist, muss $deg(phi(x)) >= 1$ sein (sonst wäre
  $im phi subset.eq R$). Also $deg(phi(x)) = 1$ und $phi(x) = a x + b$ mit
  $a in R$ und $a eq.not 0$.

  Wir zeigen $a in R^times$: Sei $g = c x + d$ mit $phi(g) = x$. Dann ist
  $
    x = phi(c x + d) = c(a x + b) + d = a c x + (b c + d),
  $
  also $a c = 1$ und $a in R^times$.

#pagebreak()

#aufgabe[
  + Beweisen Sie den _Chinesischen Restsatz_: Seien $n_1, n_2, ..., n_k in NN$
    paarweise teilerfremd. Wir betrachten den Ringhomomorphismus:
    $
      p : ZZ slash n_1 n_2 ... n_k ZZ -> ZZ slash n_1 ZZ times ZZ slash n_2 ZZ times ... times ZZ slash n_k ZZ \
      [x] |-> ([x], [x], ..., [x])
    $
    Die einzelnen Komponenten sind hier durch die Reduktion modulo $n_i$
    gegeben. Beweisen Sie, dass $p$ bijektiv (und damit ein Ringisomorphismus)
    ist.

    _Tipp:_ Konstruieren Sie die Elemente $(0, ..., 0, 1, 0, ..., 0)$ im Bild
    indem Sie Elemente $x$ der Form
    $n_1 dot.c dot.c dot.c hat(n)_i dot.c dot.c dot.c n_k$ betrachten.

  + Bestimmen Sie alle $x in ZZ$ mit
    $
      x equiv 3 quad mod 5 \
      x equiv 2 quad mod 7 \
      x equiv 8 quad mod 11.
    $
]

+ _Beweis:_ Zunächst zeigen wir, dass $p$ wohldefiniert und ein Homomorphismus
  ist. Dies ist klar, da für $x equiv y mod n_1 ... n_k$ auch
  $x equiv y mod n_i$ für alle $i$ gilt.

  _Injektivität:_ Sei $[x] in ker p$, d.h. $x equiv 0 mod n_i$ für alle
  $i = 1, ..., k$. Dann ist $n_i | x$ für alle $i$. Da die $n_i$ paarweise
  teilerfremd sind, folgt $n_1 ... n_k | x$, also $[x] = 0$ in
  $ZZ slash n_1 ... n_k ZZ$.

  _Surjektivität:_ Nach dem Tipp konstruieren wir für jedes $i$ ein Element
  $e_i in ZZ$ mit $p([e_i]) = (0, ..., 0, 1, 0, ..., 0)$ (mit $1$ an der $i$-ten
  Stelle).

  Setze $N_i := n_1 dots.h hat(n)_i dots.h n_k$ (Produkt ohne $n_i$). Da die
  $n_j$ paarweise teilerfremd sind, ist $"ggT"(N_i, n_i) = 1$. Nach dem
  erweiterten euklidischen Algorithmus existieren $s_i, t_i in ZZ$ mit
  $s_i N_i + t_i n_i = 1$. Dann ist $s_i N_i equiv 1 mod n_i$ und
  $s_i N_i equiv 0 mod n_j$ für $j eq.not i$. Setze $e_i := s_i N_i$.

  Für $(a_1, dots.h, a_k) in ZZ slash n_1 ZZ times dots.h times ZZ slash n_k ZZ$
  ist dann
  $
    p([sum_(i=1)^k a_i e_i]) = (a_1, dots.h, a_k),
  $
  also ist $p$ surjektiv.

  Da
  $|ZZ slash n_1 dots.h n_k ZZ| = n_1 dots.h n_k = |ZZ slash n_1 ZZ times dots.h times ZZ slash n_k ZZ|$
  und $p$ injektiv ist, folgt, dass $p$ bijektiv ist.

+ Wir verwenden die Notation aus Teil (a). Setze $n_1 = 5, n_2 = 7, n_3 = 11$.
  Dann ist $N_1 = 7 dot.c 11 = 77$, $N_2 = 5 dot.c 11 = 55$,
  $N_3 = 5 dot.c 7 = 35$.

  Wir bestimmen $s_i$ mit $s_i N_i equiv 1 mod n_i$:
  - $s_1 dot.c 77 equiv 1 mod 5$: Da $77 equiv 2 mod 5$, ist $s_1 = 3$ (denn
    $3 dot.c 2 = 6 equiv 1 mod 5$).
  - $s_2 dot.c 55 equiv 1 mod 7$: Da $55 equiv 6 mod 7$, ist $s_2 = 6$ (denn
    $6 dot.c 6 = 36 equiv 1 mod 7$).
  - $s_3 dot.c 35 equiv 1 mod 11$: Da $35 equiv 2 mod 11$, ist $s_3 = 6$ (denn
    $6 dot.c 2 = 12 equiv 1 mod 11$).

  Die Lösung ist dann
  $
    x equiv 3 dot.c s_1 dot.c N_1 + 2 dot.c s_2 dot.c N_2 + 8 dot.c s_3 dot.c N_3 mod 385 \
    equiv 3 dot.c 3 dot.c 77 + 2 dot.c 6 dot.c 55 + 8 dot.c 6 dot.c 35 mod 385 \
    equiv 693 + 660 + 1680 mod 385 \
    equiv 3033 mod 385 \
    equiv 343 mod 385.
  $

  Die Menge aller Lösungen ist $x = 343 + 385 k$ mit $k in ZZ$.
