#import "common.typ": *

#show: problemset("10")

#set enum(numbering: "(i)", indent: 1em)

#set page(fill: tiling(
  size: (21cm / 5 - 5pt, 29.7cm / 6 - 5pt),
  rotate(-35deg, box(inset: 1cm, image("pset-10-background.png"))),
))

#exercise([30 = 10 + 10 + 10])[
  Harry und Dudley bekommen zu Weihnachten zwei Sanduhren. Die Form (genauer:
  die Kontur) jeder Sanduhr lässt sich durch eine Funktion beschreiben. Ihre
  Eltern wählen zunächst eine Funktion $h in scr(L)^p (X, scr(A), mu; V)$ für
  Harrys Uhr. Um Dudley _mehr_ zu schenken, vervollständigen die Eltern den
  Maßraum $(X, scr(A), mu)$ zu $(X, overline(scr(A)), overline(mu))$. Für
  Dudleys Uhr wählen sie nun das Bild von $h$ unter der kanonischen
  Inklusionsabbildung
  $scr(L)^p (X, scr(A), mu; V) arrow.hook scr(L)^p (X, overline(scr(A)), overline(mu); V)$.

  + Zeigen Sie, dass die Eltern kläglich gescheitert sind: Harry und Dudley
    haben am Ende $scr(L)^p$-_volumengleiche_ Sanduhren bekommen, da die
    Inklusionsabbildung eine Isometrie ist.

    *Tipp:* Beweisen Sie dazu Proposition 14.14.

  + Offenbar haben die Eltern inzwischen unsere Mitschriften gelesen, ihren
    Fehler erkannt und versuchen es erneut: Nun schenken sie Harry alle
    Funktionen aus $L^p (X, scr(A), mu; V)$ und Dudley alle Funktionen aus
    $L^q (X, scr(A), mu; V)$ mit $1 <= q < p < infinity$.

    - Zeigen Sie, dass Dudley tatsächlich _unendlich viele_ Funktionen mehr
      bekommen hat, indem Sie eine unendliche Familie
      $(f_n)_(n in NN) subset L^q (X, scr(A), mu; V)$ konstruieren, sodass für
      alle $i in NN$ gilt: $f_i in.not L^p (X, scr(A), mu; V)$.

    - Zeigen Sie ferner, dass für jeden Maßraum $(X, scr(A), mu)$ mit
      $mu(X) < infinity$ und für $p, q in [1, infinity]$ mit $p <= q$ gilt:
      $f in L^q (X, scr(A), mu; V)$ und
      $norm(f)_(L^p) <= mu(X)^((q-p)/(p q)) norm(f)_(L^q)$.
]

=== Lösung:

+ Definieren wir
  $i: L^p (X, scr(A), mu) -> L^p (X, overline(scr(A)), overline(mu))$ durch
  $i([f]_scr(A)) := [f]_(overline(scr(A)))$. Da
  $[f]_scr(A) subset [f]_(overline(scr(A)))$ gilt, folgt unmittelbar, dass $i$
  injektiv ist.

  Um zu zeigen, dass $i$ wohldefiniert ist, beachten wir Folgendes: Sei
  $[f]_scr(A) in L^p (X, scr(A), mu)$. Dann ist $f$ $mu$-messbar und es gilt
  $integral norm(f)^p dif mu < infinity$. Da jede $scr(A)$-messbare Funktion
  auch $overline(scr(A))$-messbar ist und $overline(mu)$ auf $scr(A)$ mit $mu$
  übereinstimmt, folgt $integral norm(f)^p dif overline(mu) < infinity$. Somit
  ist
  $i([f]_scr(A)) = [f]_(overline(scr(A))) in L^p (X, overline(scr(A)), overline(mu))$.

  Für die Surjektivität sei
  $[f]_(overline(scr(A))) in L^p (X, overline(scr(A)), overline(mu))$. Dann ist
  $f$ $overline(scr(A))$-messbar, und es existiert eine Folge von
  $overline(scr(A))$-messbaren einfachen Funktionen $overline(s)_n$ mit
  $abs(overline(s)_n (x)) <= abs(f(x))$ und $overline(s)_n (x) -> f(x)$ für alle
  $x in X$.

  Jede Funktion $overline(s)_n$ hat die Form
  $overline(s)_n = sum_k alpha_k bb(1)_(overline(A)_k)$, wobei die
  $overline(A)_k in overline(scr(A))$ sind. Nach Definition des
  vervollständigten Maßes existieren $scr(A)$-messbare Mengen
  $A_k subset overline(A)_k$ mit $overline(mu)(overline(A)_k without A_k) = 0$.
  Setzen wir $s_n := sum_k alpha_k bb(1)_(A_k)$, so ist $s_n$ $scr(A)$-messbar
  und es gilt $s_n (x) = overline(s)_n (x)$ für $overline(mu)$-fast alle $x$.
  Sei $D := union.big_n {x in X | s_n (x) != overline(s)_n (x)}$; dann ist
  $overline(mu)(D) = 0$.

  Wir zeigen nun, dass $s_n (x) -> f(x)$ für $mu$-fast alle $x$ gilt. Sei
  $E := {x in X | s_n (x) arrow.not f(x)}$ und nehmen wir an, dass $mu(E) > 0$.
  Dann folgt $overline(mu)(E) = mu(E) > 0$ und somit
  $overline(mu)(E without D) > 0$. Für $x in E without D$ gilt jedoch
  $s_n(x) = overline(s)_n(x) -> f(x)$, was $x in E$ widerspricht. Folglich ist
  $mu(E) = 0$.

  Schließlich seien $t_n$ die einfachen Funktionen $t_n = s_n dot bb(1)_(E^c)$,
  und beachte, dass die $t_n$ $mu$-messbar sind und
  $t_n (x) -> f(x) bb(1)_(E^c) (x)$ für alle $x$ gilt, somit ist
  $g = f dot bb(1)_(E^c)$ $mu$-messbar. Da $mu E = 0$, haben wir
  $i([g]_scr(A)) = [g]_(overline(scr(A))) = [f]_(overline(scr(A)))$, und somit
  ist $i$ surjektiv.

  Um zu zeigen, dass $i$ eine Isometrie ist, sei
  $[f]_scr(A) in L^p (X, scr(A), mu)$. Dann gilt:
  $
    norm(i([f]_scr(A)))_(L^p) & = norm([f]_(overline(scr(A))))_(L^p) \
                              & = (integral_X norm(f)^p dif overline(mu))^(1/p) \
                              & = (integral_X norm(f)^p dif mu)^(1/p) \
                              & = norm([f]_scr(A))_(L^p),
  $
  wobei die dritte Gleichheit gilt, da $mu$ und $overline(mu)$ auf $scr(A)$
  übereinstimmen und $f$ $mu$-messbar ist. Somit ist $i$ eine Isometrie.

  #sym.suit.diamond.stroked

+ #linebreak()
  - _Wir können folgendes zeigen:_

    Für $1 <= q < p < infinity$ gilt
    $L^q (X, scr(A), mu; V) subset.not L^p (X, scr(A), mu; V)$ genau dann wenn
    für jedes $epsilon > 0$ ein $A in scr(A)$ existiert sodass
    $0 < mu(A) <= epsilon$.

    $=>$

    Sei $f in L^q (X, scr(A), mu; V) without L^p (X, scr(A), mu; V)$ und
    definieren wir für alle $n in NN$ eine Menge $A_n := {x in X : f(x) >= n}$.
    So gilt
    $
      n^q mu(A_n) <= norm(f)_(L^q)^q = integral_X norm(f)^q mu
    $
    also
    $
      mu(A_n) <= n^(-q) norm(f)_(L^q)^q.
    $
    Da $norm(f)_(L^q)^q < infinity$ konvergiert $mu(A_n)$ somit gegen $0$.

    Nehmen wir an es existiert ein $n_0 in NN$ sodass $mu(A_n) = 0$ ist. So
    folgt $norm(f)_(L^infinity) <= n_0$ und somit
    $
      integral_X norm(f)^p mu & = integral norm(f)^q norm(f)^(p - q) mu \
                              & <= norm(f)_(L^infinity)^(p-q) integral norm(f)^q mu \
                              & <= n_0^(p-q) integral norm(f)^q mu \
                              & < infinity.
    $
    #sym.arrow.zigzag Somit müssen $A_n$ mit arbiträren kleinem Maß existieren.

    $#sym.arrow.double.l$

    Wähle $(A_n) in scr(A)^NN$ so dass $mu(A_n) = 2^(-n)$ und definiere
    $f = sum mu(A_n)^(-1/p) bb(1)_(A_n)$ so folgt
    $
      integral_X f^q mu
      &= integral_X lim_(n -> infinity) (sum_(k=1)^n mu(A_k)^(-1/p) bb(1)_(A_k))^q \
      &= lim_(n -> infinity) integral_X (sum_(k=1)^n mu(A_k)^(-1/p) bb(1)_(A_k))^q \
      &= sum_n mu(A_n)^(-q/p) mu(A_n) \
      &= sum_n mu(A_n)^(1 -q/p) \
      &= sum_n (1/2)^n(1 -q/p)
    $

    Diese Reihe konvergiert für $q < p$ aber berühmterweise nicht für $q = p$.

    Also ist $f$ in $in L^q (X, scr(A), mu; V) without L^p (X, scr(A), mu; V)$.
    #sym.checkmark

    Wenn der von den Eltern von Dudley gewählte Maßraum diese Eigenschaft nun
    erfüllt wählen wir $f_n = 1/n f$, und haben somit eine unendliche Familie an
    Funktionen die in $L^q$ aber nicht in $L^p$ sind.

    #sym.suit.diamond.stroked

  - Wenden wir die Hölderungleichung auf $bb(1)_X dot norm(f)_(L^p)$ an mit
    $
      s = q/(q-p), t = q/p => = 1/s + 1/t = 1
    $
    so folgt
    $
      norm(f)_(L^p) & = norm(bb(1) dot f)_(L^p) \
      & <= (integral_X bb(1_x)^(p s))^(1/(p s)) (integral_X norm(f)^(p t))^(1/(p t)) \
      & = (integral_X bb(1_x)^(p s))^(1/(p s)) (integral_X norm(f)^q)^(1/q) \
      & = (integral_X bb(1_x)^(p s))^(1/(p s)) norm(f)_(L^q) \
      & = (integral_X bb(1_x)^((p q)/(q - p)))^((q - p)/(p q)) norm(f)_(L^q) \
      & = (integral_X bb(1_x))^((q - p)/(p q)) norm(f)_(L^q) \
      & = mu(X)^((q - p)/(p q)) norm(f)_(L^q) \
    $
    und somit die Aussage.

    #sym.suit.diamond.stroked

#pagebreak()

#exercise([20 = 10 + 10])[
  Vor langer Zeit lebte die Familie $C_c^k (U, V)$ glücklich und zufrieden in
  ihrer Heimat, der Analysis-I³-Vorlesung. Die Jahre vergingen: Aus Funktionen
  auf $RR^d$ wurden Funktionen auf $RR^d$, aus _glatt_ wurde _integrierbar_, und
  Jahr um Jahr entfernte sich die Familie weiter voneinander. Mit der Einführung
  der Maßtheorie zerbrach die Familie schließlich endgültig in ihre
  $L^p (U, V)$-Äquivalenzklassen. Doch nun ist die Zeit gekommen, sich zu
  besinnen und den Weg dieser Familie nachzuvollziehen — jedes einzelne
  Familienmitglied in seinen neuen Familien wiederzuerkennen. Zeigen Sie dazu,
  dass die Komposition
  $
    C_c^k (U, V) arrow.hook scr(L)^p (U, scr(B)(U), beta_d; V) arrow.r.twohead L^p (U, V)
  $
  injektiv ist.

  Die $C_c^k (U, V)$ sind schon lange nicht mehr nur das, was sie einst waren.
  Sie haben sich weiterentwickelt — und stehen ihrer Herkunft doch immer noch
  nahe. — _Wie nahe?_ fragt ihr. Nun, vielleicht kann uns die folgende
  Proposition davon erzählen.

  *Proposition 10.2.* _Seien $d in NN$, $U subset RR^d$ eine offene Teilmenge,
  $(V, norm(dot))$ ein endlich-dimensionaler normierter Vektorraum und
  $p in [1, infinity)$. Die Teilmenge $C_c^0 (U, V) subset L^p (U, V)$ ist
  dicht._

  Doch wie in jeder Familie gibt es auch hier einen Ausreißer — einen Outlaw,
  der sich weiter als alle anderen von der Familie entfernt hat. Der Name dieses
  Raumes liegt, dunkel und erhaben, als eine von zwei Ausnahmen über jeder
  funktionalanalytischen Aufgabe, die Reflexivität verlangt: $p = infinity$
  Beweisen Sie, dass Proposition 10.2 in diesem Fall nicht gilt.
]

=== Lösung:

- Wählen wir $i: C_c^k (U, V) arrow.hook scr(L)^p (U, scr(B)(U), beta_d; V)$ und
  $s: scr(L)^p (U, scr(B)(U), beta_d; V) arrow.r.twohead L^p (U, V)$ als die
  kanonischen Abbildungen und sei $f,g in C_c^k (U,V)$ mit $(s compose i)(f) =
  (s compose i)(g)$. So folgt das $f = g$ für $beta_d$ fast alle $x in U$.
  Definieren wir $h(x) = norm(f - g)$ und setzen wir
  $A := h^(-1)(V without {0})$, es folgt das $beta_d (A) = 0$ ist. Da $h$ stetig
  ist ist $A$ zusätzlich offen. Wählen wir nun $x in A$, da $A$ offen ist lässt
  sich ein $0 < epsilon in RR$ finden, sodass
  $[x - epsilon / 2, x + epsilon / 2)^d subset.eq A$ ist. Also
  $
    0 < beta_d ([x - epsilon / 2, x + epsilon / 2)^d) = epsilon^d <= beta_d (A) = 0
    #sym.arrow.zigzag
  $
  somit muss $A = emptyset$.

  Also folgt $s compose i$ injektiv.

  #sym.suit.diamond.stroked

- Betrachten wir die Funktion $1 in L^infinity (U, V)$, also die Funktion die
  einen konstanten Vektor mit Norm eins zurückgibt. Und sei $(f_n) in
  (C_c^k)^NN$. Da $f_n in C_c^k$ existiert ein $M in RR$ sodass $"supp"(f_n) in
  B(0)_M$ ist. Für alle $x in U without B(0)_M$ gilt somit
  $norm(f - f_n)_(L^infinity) = 1$ also folgt $f in.not overline(C_c^k (U, V))$
  und somit ist $C_c^k (U, V)$ auch nicht dicht in $L^infinity (U, V)$.

  #sym.suit.diamond.stroked
