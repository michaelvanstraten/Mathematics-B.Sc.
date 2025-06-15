#set enum(numbering: "(a)")

#set text(font: "New Computer Modern")
#show heading: set block(above: 1.4em, below: 1em)

== Aufgabe A1.1 (Gruppenabgabe) #h(1fr) _(6 Punkte)_

Für alle $a, b in KK^n$ sei $a times.circle b := a b^H in KK^(n times n)$ und
$a dot b = a^H b in KK$.

+ Zeigen Sie für zwei Vektoren $a, b in KK^n$ und die $n$-dimensionale
  Einheitsmatrix $I_n$ folgende Formel für die Determinante $det(
    I_n - a
    times.circle b
  ) = 1 - overline(a dot b)$.

+ Folgern Sie eine Formel für $(I_n - a times.circle b)^(-1)$ sofern $a dot b !=
  1$.

+ Erweitern Sie die Formeln aus (a)-(b) für $A - b times.circle c$ wobei $A in
  KK^(n times n)$ eine reguläre Matrix und $b, c in KK^n$ Vektoren sind.

=== _Beweis_

+ Wir können die Determinante ohne Änderung ihres Wertes durch Multiplikation
  der Matrix mit Permutationsmatrizen (deren Determinante gleich eins ist) von
  rechts und links umformen.

  $
    det(I - a b^H) & = det(mat(I - a b^H, a; 0, 1))                     \
                   & = det(mat(I - a b^H, a; 0, 1) mat(1, 0; b^H, I_n)) \
                   & = det(mat(I_n, a; b^H, I_n))                       \
                   & = I - b^H a                                        \
                   & = I - angle.l b, a angle.r_"Standard"              \
                   & = I - overline(angle.l a\, b angle.r)_"Standard"   \
                   & = I - overline(a dot b)                            \
  $

+ Siehe (c).

+ *Determinante:* \
  $
    det(A - b c^H)
    &= det(A) dot op("det")\(I_n - underbrace(A^(-1) b, in KK^n) c^H) \
    &= det(A) dot \(1 - overline(A^(-1) b dot c)\)
  $

  *Inverse:* \ Sei $x, y in KK^n$, sodass gilt
  $
    (A - b times.circle c)x = y.
  $

  Via algebraischer Umformung folgt:

  $
        & A x - b times.circle c x && = y                                           \
    <=> & A x                      && = y + b times.circle c x                      \
    <=> & x                        && = A^(-1) y + A^(-1) b times.circle c x        \
        &                          && = A^(-1) y + A^(-1) b underbrace(c^H x, =: s) \
  $

  Bezeichnen wir $s in KK$ und stellen nun nach $s$ um, so folgt

  $
        & s = c^H x            && = c^H A^(-1) y + c^H A^(-1) b s       \
    <=> & s + c^H A^(-1) b s   && = c^H A^(-1) y                        \
    <=> & (1 + c^H A^(-1) b) s && = c^H A^(-1) y                        \
    <=> & s                    && = (c^H A^(-1) y) / (1 + c^H A^(-1) b) \
  $

  Setzen wir nun $s$ wieder ein, erhalten wir:

  $
    x & = A^(-1) y + A^(-1) b (c^H A^(-1) y) / (1 + c^H A^(-1) b) \
      & = A^(-1) y + (A^(-1) b c^H A^(-1) y) / (1 + c^H A^(-1) b) \
      & = (A^(-1) + (A^(-1) b c^H A^(-1)) / (1 + c^H A^(-1) b)) y \
  $


== Aufgabe A1.2 (Gruppenabgabe) #h(1fr) _(4 Punkte)_

+ Schreiben Sie für die direkte Elimination und Matrix-Vektor-Multiplikation mit
  einer Tridiagonalmatrix $T ∈ ℝ^(N×N)$ jeweils einen (effizienten)
  Pseudocode-Algorithmus mit $O(N)$ Operationen.

+ Geben Sie jeweils die genaue Anzahl an Punkt- ($*,\/$) und Strich- operationen
  ($+,-$) an und vergleichen Sie die Zeitkomplexität beider Algorithmen.

_Anmerkung:_ Es gab wenigstens einen Rechner, auf dem das Berechnen von
$T^(-1) b$ mit einer Tridiagonalmatrix $T$ schneller war als die
Matrix-Vektor-Multiplikation $T b$.

=== _Lösung:_

+ ```python
  def multiply_tridiagonal_by_vec(A, v):
      n = len(v)
      result = [0] * n
      for i in range(n):
          result[i] = A[i][i] * v[i]
          if i > 0:
              result[i] += A[i][i-1] * v[i-1]
          if i + 1 < n:
              result[i] += A[i][i+1] * v[i+1]
      return result

  def inplace_lu(A):
      n = len(A)
      for i in range(1, n):
          A[i][i-1] = A[i][i-1] / A[i-1][i-1]
          A[i][i] = A[i][i] - A[i][i-1] * A[i-1][i]
  ```

+ *Matrix-Vektor-Multiplikation* $y = T\,b$

  Ignoriert man die Initialisierung von `result`, so durchläuft die Schleife $n$
  Iterationen. Pro Iteration gibt es immer eine Multiplikation auf der
  Hauptdiagonalen und—außer an den beiden Rändern—jeweils eine weitere
  Multiplikation und eine Addition für Unter- bzw. Überdiagonale. Insgesamt:
  $
    cal(O)_(*,\/)(n) & = 2(n-1) + (n-1) && = 3n-2  \
     cal(O)_(+,-)(n) & = (n-1) + (n-1)  && = 2n-2. \
  $

  *In-Place LU*

  Die Eliminationsschleife läuft $n-1$ Mal. Pro Schritt wird genau eine
  Division, eine Multiplikation und eine Subtraktion für die Hauptdiagonale
  ausgeführt. Damit gilt:

  $
    cal(O)_(*,\/)(n) & = underbrace((n-1), "Division") +
                       underbrace((n-1), "Multiplikationen") && = 2n-2 \
     cal(O)_(+,-)(n) &                                       && = n-1  \
  $

// Obwohl beide Algorithmen dieselbe asymptotische Komplexität aufweisen,
// benötigt die LU-Zerlegung in der Praxis deutlich mehr Divisionen. Betrachtet
// man jedoch, dass in der LU-Zerlegung signifikant mehr Divisionen
// durchgeführt werden und Divisionen auf modernen CPUs meist um einen Faktor
// mehr CPU-Zyklen benötigen als Multiplikationen, ist anzunehmen, dass die
// Matrix-Vektor-Multiplikation eine bessere praktische Laufzeit erzielt.
//
== Aufgabe A1.3 (Gruppenabgabe) #h(1fr) _(4 Punkte)_

Berechnen Sie die Eigenwerte der Tridiagonalmatrix
$
  T = mat(
    2, -1, , , ;
    -1, 2, -1, , ;
    , dots.down, dots.down, dots.down, ;
    , , -1, 2, -1;
    , , , -1, 2
  ) in RR^(N times N)
$

Benutzen Sie dazu einen Ansatz mit Sinus- und Kosinusfunktionen für die
Eigenfunktionen.

_Anmerkung:_ Diese Tridiagonalmatrix resultiert aus einer Diskretisierung der
ODE $-y'' = λ y$ mittels zentraler Differenzen und liefert im Limes für
Netzweiten $h = 1 / (N+1) → 0$ die optimale Konstante $1 / π$ in der
Friedrichs-Ungleichung $norm(f)_(L^2(0,1)) ≤ 1 / π norm(f')_(L^2(0,1))$ für alle
$f ∈ C^1[0,1]$ mit $f(0)=f(1)=0$.

=== _Lösung:_

Für den gegebenen Differentialoperator
$
  cal(L) = - d^2 / (d x^2)
$
auf dem Interval $[0, 1]$ mit homogenen Randbedingungen:
$
  y(0) = y(1) = 0
$
sowie dem zugegeörigen Eigenwertproblem:
$
  cal(L)y = lambda y
$
folgt für die Bekannte lösung:
$
  y(x) = c_1 sin(sqrt(λ) x) + c_2 cos(sqrt(λ) x)
$
basierend auf en Randbedingungen das $c_2 = 0$ sowie $sqrt(lambda) = k pi$
sodass,
$
  y_k (x) = c_1 sin(k pi x)
$
