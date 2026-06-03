function coefficients = calcNaturalSpline (x, y)
  n = numel(x) - 1;

  h = diff(x);

  [lambda, mu, d] = deal(zeros(1, n+1));

  denom = h(1:n-1) + h(2:n);

  lambda(2:n) = h(2:n) ./ denom;
  mu(2:n) = 1 - lambda(2:n);
  d(2:n) = 6 ./ denom .* ( ...
      diff(y(2:n+1)) ./ h(2:n) ...
    - diff(y(1:n)) ./ h(1:n-1) ...
  );

  A = spdiags([mu', 2*ones(n+1,1), lambda'], -1:1, n+1, n+1);

  M = A \ d';

  coefficients = [
    y(1:n)
    diff(y) ./ h - ((2*M(1:n) + M(2:n+1))' .* h) / 6
    M(1:n)' / 2
    diff(M)' ./ (6*h)
  ];
endfunction
