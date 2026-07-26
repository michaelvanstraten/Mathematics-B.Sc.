function appx = ExplicitEuler(t0, tf, M, y0, f)
  stepSize = (tf - t0) / M;
  appx = [y0];
  u = y0;
  t = t0;
  for k = 2:(M+1)
    t = t + stepSize;
    u = u + stepSize * f(t, u);
    appx(k) = u;
  end
end
