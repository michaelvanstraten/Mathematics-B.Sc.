import sympy as sp

x, a, b = sp.symbols("x, a, b")
f = sp.Function("f")

alpha0, alpha1, alpha2 = sp.symbols(r"\alpha_0, \alpha_1, \alpha_2")

q = alpha2 * x**2 + alpha1 * x + alpha0

boundary_term = f(x) * sp.diff(q, x) - sp.diff(f(x), x) * q

error_term = -((b - a) ** 3) / 12

trapezoid = sp.Rational(1, 2) * (b - a) * (f(a) + f(b))

conditions = [
    sp.Eq(sp.diff(q, x, 2), 1),
    sp.Eq(sp.integrate(q, (x, a, b)), error_term),
    sp.Eq(boundary_term.subs(x, b) - boundary_term.subs(x, a), trapazoid),
]

print(sp.solve(conditions, (alpha0, alpha1, alpha2)))
