from itertools import tee
import sys


def is_prime(n):
    # Source - https://stackoverflow.com/a
    # Posted by Eli Harold, modified by community. See post 'Timeline' for change history
    # Retrieved 2025-12-14, License - CC BY-SA 4.0
    return not any(n % i == 0 for i in range(2, n)) if n > 1 else False


def is_irreducible(z):
    a, b = z
    return is_prime(abs(a**2 + 13 * b**2))


def diagonal_product(a, b):
    ia, ib = iter(a), iter(b)
    A, B = [], []
    n = 0

    while True:
        # Extend caches to cover this diagonal
        while len(A) <= n:
            try:
                A.append(next(ia))
            except StopIteration:
                break
        while len(B) <= n:
            try:
                B.append(next(ib))
            except StopIteration:
                break

        emitted = False
        for i in range(n + 1):
            j = n - i
            if i < len(A) and j < len(B):
                yield (A[i], B[j])
                emitted = True

        if not emitted:  # both exhausted beyond last diagonal
            return

        n += 1


def integers():
    n = 0
    yield n

    while True:
        n += 1
        yield n
        yield -n


def find_irreducible_solutions(solutions_to_find: int, max_iter):
    irreducibles = filter(
        is_irreducible,
        diagonal_product(integers(), integers()),
    )

    iter = 0
    solutions_found = 0

    for z, w in diagonal_product(*tee(irreducibles)):
        iter += 1

        if iter % 1000 == 0:
            print(iter)

        if iter >= max_iter:
            break

        a, b, c, d = *z, *w

        if (a * c) - (13 * b * d) == 14 and b * c + a * d == 0:
            print(z, w)
            solutions_found += 1

        if solutions_found >= solutions_to_find:
            break


if __name__ == "__main__":
    find_irreducible_solutions(int(sys.argv[1]), int(float(sys.argv[2])))
