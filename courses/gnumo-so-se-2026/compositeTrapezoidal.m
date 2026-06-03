function retval = compositeTrapezoidal (f, a, b, n)
  assert(n >= 2);

  N = n-1;
  H = (b - a)/N;

  evalPoints = linspace(a, b, n);

  # Lets assume they ment n-1 intervals since if we have n points
  # there are n-1 intervals each of (b - a)/(n-1)
  assert(all(abs(diff(evalPoints) - H) < 1e-12));

  y = arrayfun(f, evalPoints);

  retval = H*(0.5 * y(1) + sum(y(2:N)) + 0.5 * y(n));
endfunction
