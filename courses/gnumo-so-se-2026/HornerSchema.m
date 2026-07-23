function val = HornerSchema(coeffs, xi)
  n = numel(coeffs)
  val = 0;
  for i = 0:(n-1)
    val = coeffs(n-i) + xi * val;
  end
end
