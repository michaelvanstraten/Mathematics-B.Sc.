function retval = compositeSimpson (f, a, b, n)
  assert(n >= 2);

  N = n-1;
  H = (b - a)/N;

  evalPoints = linspace(a, b, n);

  # Lets assume they ment n-1 intervals since if we have n points
  # there are n-1 intervals each of (b - a)/(n-1)
  assert(all(abs(diff(evalPoints) - H) < 1e-12));

  y = arrayfun(f, evalPoints);

  midEvalPoints = (evalPoints(1:end-1) + evalPoints(2:end)) / 2;
  yMid = arrayfun(f, midEvalPoints);

  retval = H/6 * ( ...
    y(1) ...
    + 2 * sum(y(2:N-1)) ...
    + 4 * sum(yMid) ...
    + y(n) ...
  );
endfunction
