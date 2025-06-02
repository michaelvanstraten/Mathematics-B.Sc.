#let lpnorm = $(sum_(i=1)^n abs(x_i)^p)^(1 / p)$

// Matrix definitions
#let jordan-block(lambda, n) = {
  $mat(
    lambda, 1, , , ;
    , lambda, 1, , ;
    , , dots.down, dots.down, ;
    , , , lambda, 1;
    , , , , lambda
  )$
}

#let matrix-exp = $exp(A) := sum_(n=0)^infinity A^n / n!$

#let trace = $tr : RR^(n times n) -> RR$

#let rotation-matrix(alpha) = {
  $R_alpha = mat(
    cos alpha, -sin alpha;
    sin alpha, cos alpha
  )$
}

// Banach algebra
#let banach-algebra = "Banachalgebra"

// Determinant formula for 2x2 matrices
#let det-2x2 = $det mat(a, b; c, d) = a d - b c$

// Cramer's rule for 2x2 matrix inverse
#let cramer-inverse = $A^(-1) = 1/(det A) mat(d, -b; -c, a)$

