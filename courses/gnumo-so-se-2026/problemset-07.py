import sympy as sp


def problem_2():
    x = sp.symbols("x")

    x_1, x_2 = sp.symbols("x_1 x_2")
    alpha, beta = sp.symbols("alpha beta")

    integral = lambda f: sp.integrate(sp.simplify(f) * x**2, (x, -1, 1))

    quadratur = lambda f: (
        alpha * sp.simplify(f).subs(x, x_1) + beta * sp.simplify(f).subs(x, x_2)
    )

    conditions = [
        sp.Eq(quadratur(1), integral(1)),
        sp.Eq(quadratur(x), integral(x)),
        sp.Eq(quadratur(x**2), integral(x**2)),
        sp.Eq(quadratur(x**3), integral(x**3)),
    ]

    sol = sp.solve(conditions, (alpha, beta, x_1, x_2), dict=True)

    def natural_numbers():
        n = 0
        while True:
            n += 1
            yield n

    for s in sol:
        quadratur = lambda f: (
            s[alpha] * sp.simplify(f).subs(x, s[x_1])
            + s[beta] * sp.simplify(f).subs(x, s[x_2])
        )

        for n in natural_numbers():
            if sp.simplify(integral(x**n) - quadratur(x**n)) != 0:
                print(f"Works for n={n - 1}: {s}")
                break


def problem_3():
    x = sp.symbols("x")

    scalar_product = lambda f, g: sp.integrate(
        sp.exp(-x) * sp.simplify(f) * sp.simplify(g), (x, 0, sp.oo)
    )

    N = []

    for k in range(0, 3):
        N.append(
            x**k
            - sum(
                [
                    scalar_product(x**k, N[j]) / scalar_product(N[j], N[j]) * N[j]
                    for j in range(0, k)
                ]
            )
        )

        print(f"N_{k} = {N[k]}")

    sol = sp.solve(sp.Eq(N[2], 0), (x))

    print(f"nullstellen = {sol}")

    alpha, beta = sp.symbols("alpha, beta")

    quadratur = lambda f: (
        alpha * sp.simplify(f).subs(x, sol[0]) + beta * sp.simplify(f).subs(x, sol[1])
    )

    conditions = [
        sp.Eq(quadratur(1), scalar_product(1, 1)),
        sp.Eq(quadratur(x), scalar_product(x, 1)),
    ]

    print(sp.solve(conditions))


# problem_2()

problem_3()
