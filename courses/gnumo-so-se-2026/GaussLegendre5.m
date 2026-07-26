function retval = GaussLegendre5(f, a, b)
  xs = [
    -1/3 * sqrt(5 + 2 * sqrt(10/7))
    -1/3 * sqrt(5 - 2 * sqrt(10/7))
    0
    1/3 * sqrt(5 - 2 * sqrt(10/7))
    1/3 * sqrt(5 + 2 * sqrt(10/7))
  ]

  as = [
    (322 - 13 * sqrt(70)) / 900
    (322 + 13 * sqrt(70)) / 900
    128/225
    (322 + 13 * sqrt(70)) / 900
    (322 - 13 * sqrt(70)) / 900
  ]

  retval = (b-a)/2 *  as' * f(xs .* (b-a)/2 + (a+b)/2 );
end
