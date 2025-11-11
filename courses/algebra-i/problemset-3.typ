#import "common.typ": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node, shapes

#show: problemset("3")

#aufgabe[
  Geben Sie Präsentationen mit maximal zwei Erzeugern für die folgenden Gruppen
  an und beweisen Sie diese:

  + $ZZ slash n ZZ$

  + $ZZ times ZZ$

  + $D_n$
]

=== Lösung:

+ Wählen wir
  $
    S = { x } quad "und" quad R = { x^n }
  $
  und definieren wir $f : S -> ZZ slash n ZZ$ durch
  $
    f(x) = 1.
  $
  Bemerke das $f(S)$ ein Erzeuger von $ZZ slash n ZZ$ ist.

  Die universellen Eigenschaft freier Gruppen gibt uns einen surjektiven
  Gruppenhomomorphismus $hat(f)$ von $F_S$ nach $ZZ slash n ZZ$.

  Mit dem ersten Homomorphi Satz folgt das $F_S slash ker(hat(f))$ isomorph zu
  $ZZ slash n ZZ$ ist.

  Wählen ein $r in chevron.l R^(F_S) chevron.r$ so folgt das ein $s in F_S$
  sowie ein $m in ZZ$ existiert, sodass $r = s^m x^n s^(-m)$ ist.

  Es gilt
  $
    hat(f)(r) & = hat(f)(s^m x^n s^(-m)) \
              & = hat(f)(s^m) hat(f)(x^n) hat(f)(s^(-m)) \
              & = hat(f)(s)^m hat(f)(x)^n hat(f)(s)^(-m) \
              & = hat(f)(s)^m f(x)^n hat(f)(s)^(-m) \
              & = hat(f)(s)^m + n dot 1 + hat(f)(s)^(-m) \
              & = hat(f)(s)^m + 1 + hat(f)(s)^(-m) \
              & = hat(f)(s)^m + hat(f)(s)^(-m) \
              & = 1 \
  $
  also folgt das $chevron.l R^(F_S) chevron.r subset.eq ker(f)$.




#pagebreak()

#aufgabe[
  Sei $n$ eine natürliche Zahl. Beweisen Sie, dass
  $
    G_n := chevron.l t_1, ..., t_(n-1) | t_i^2, (t_i t_(i+1))^3, (t_i t_j)^2 "für alle" i, j "mit" |i - j| >= 2 chevron.r
  $
  isomorph zu $S_n$ ist. Zeigen Sie dafür:

  + Durch $t_i |-> (i space (i+1))$ wird ein surjektiver Gruppenhomomorphismus
    $G_n -> S_n$ definiert, wobei $(i space (i+1))$ die Transposition bezeichnet
    die $i$ und $i+1$ vertauscht.

  + Betrachten Sie $G_(n-1) -> G_n$. Jedes Element von $G_n$ lässt sich
    schreiben als $t_i t_(i+1) ... t_(n-1) alpha$ mit $1 <= i <= n$ und $alpha$
    im Bild von $G_(n-1)$. \
    _Tipp:_ Schreiben Sie Elemente als Produkte der $t_i$ und beweisen Sie die
    Aussage per Induktion über die Länge des Produkts.

  + Es gilt $|G_n| <= n!$ und daher muss der Gruppenhomomorphismus aus (a) ein
    Isomorphismus sein.
]

=== Lösung:

+ Wir definieren eine Abbildung $f : {t_1, ..., t_(n-1)} -> S_n$ durch
  $
    f(t_i) := (i space (i+1))
  $
  für $i = 1, ..., n-1$.

  Nach der universellen Eigenschaft von freien Gruppen existiert ein eindeutiger
  Gruppenhomomorphismus $hat(f) : G_n -> S_n$ mit
  $hat(f)|_({t_1, ..., t_(n-1)}) = f$.

  *Zu zeigen:* $hat(f)$ ist surjektiv.

  Da $S_n$ von allen Transpositionen $(i j)$ mit $1 <= i < j <= n$ erzeugt wird,
  genügt es zu zeigen, dass jede solche Transposition im Bild von $hat(f)$
  liegt.

  *Behauptung:* Für alle $1 <= i < j <= n$ gilt
  $
    (i j) = hat(f)(t_i t_(i+1) dots.c t_(j-1) t_(j-2) dots.c t_i).
  $

  *Beweis durch Induktion über $k = j - i$:*

  _Induktionsanfang ($k = 1$):_
  Für $j = i + 1$ gilt nach Definition
  $
    hat(f)(t_i) = f(t_i) = (i space (i+1)).
  $

  _Induktionsschritt ($k -> k+1$):_ Sei die Behauptung für $k >= 1$ bewiesen.
  Wir zeigen sie für $k + 1$. Sei $j = i + k + 1$. Wir verwenden die Identität
  $
    (i j) = (i (j-1))(j-1 space j)(i (j-1)),
  $
  die wir durch Nachrechnen verifizieren:
  $
    (i (j-1))(j-1 space j)(i (j-1))(i) & = (i (j-1))(j-1 space j)(j-1) \
                                       & = (i (j-1))(j) \
                                       & = j
  $
  und
  $
    (i (j-1))(j-1 space j)(i (j-1))(j) & = (i (j-1))(j-1) \
                                       & = i.
  $
  Nach Induktionsvoraussetzung gilt
  $(i (j-1)) = hat(f)(t_i dots.c t_(j-2) dots.c t_i)$ und
  $(j-1 space j) = hat(f)(t_(j-1))$. Daraus folgt
  $
    (i j) = hat(f)(t_i dots.c t_(j-2) dots.c t_i) dot hat(f)(t_(j-1)) dot hat(f)(t_i dots.c t_(j-2) dots.c t_i) \
    = hat(f)(t_i dots.c t_(j-2) dots.c t_i space t_(j-1) space t_i dots.c t_(j-2) dots.c t_i).
  $


#pagebreak()

#aufgabe[
  Sei $G$ eine Gruppe und $S subset.eq G$ eine Teilmenge von $G$, die $G$
  erzeugt. Dann definieren wir den _Cayley_-Graph von $(G, S)$ als den Graph mit
  Knotenmenge $G$ und gerichteten Kanten von $g$ nach $g s$ (jeweils mit Label
  $s$) für jedes $g in G$ und $s in S$ (siehe Beispiel).

  + Zeichen Sie die Cayley-Graphen für

    (i) $(ZZ slash 6 ZZ, {1})$

    (ii) $(ZZ slash 6 ZZ, {2, 3})$

    (iii) $(D_5, {rho, sigma})$

  + Für welche Eigenschaft des Graph ist es wichtig, dass $S$ die Gruppe $G$
    erzeugt?

  + Woran lässt sich im Cayley-Graph erkennen ob $G$ kommutativ ist?
]

=== Lösung:

+ #let cay = (nodes, edges, size: 18mm) => {
    diagram({
      for (i, g) in nodes.enumerate() {
        let theta = 90deg - i * 360deg / nodes.len()
        node((theta, size), g, name: str(i))
      }

      for (from, to, name) in edges {
        edge(label(str(from)), label(str(to)), "->", label: name, bend: 10deg)
      }
    })
  }

  #let n = 6
  #let Z_mod_n_Z = range(0, n)

  + #cay(
      Z_mod_n_Z.map(r => $[#r]$),
      Z_mod_n_Z.map(n => (n, calc.rem(n + 1, 6), $1$)),
    )
  + #cay(
      Z_mod_n_Z.map(r => $[#r]$),
      Z_mod_n_Z.map(n => (n, calc.rem(n + 2, 6), $2$))
        + Z_mod_n_Z.map(n => (n, calc.rem(n + 3, 6), $3$)),
      size: 32mm,
    )

  + #cay(
      (
        $e$,
        $sigma$,
        $sigma rho$,
        $sigma rho^2$,
        $sigma rho^3$,
        $sigma rho^4$,
        $rho$,
        $rho^2$,
        $rho^3$,
        $rho^4$,
      ),
      (
        (0, 1, $sigma$),
        (1, 0, $sigma$),
        (1, 2, $rho$),
        (2, 3, $rho$),
        (3, 4, $rho$),
        (4, 5, $rho$),
        (5, 1, $rho$),
        (6, 7, $rho$),
        (7, 8, $rho$),
        (8, 9, $rho$),
        (9, 0, $rho$),
        (0, 6, $rho$),
      ),
      size: 30mm,
    )

+ Wenn $S$ die Gruppe $G$ erzeugt existiert für jedes $g in G$ ein folge and
  $s_i in S$ sodass jeder Punkt im Graph durch $(s_i)$ werden kann. Der Graph
  ist somit Fully Connected.
