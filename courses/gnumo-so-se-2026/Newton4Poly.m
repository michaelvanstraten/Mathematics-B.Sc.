function [root, iter] = Newton4Poly(p, Dp, x0, tol)
  MAX_ITER = 1e5;
  root = x0;
  for iter = 1:MAX_ITER
    step = HornerSchema(p, root) / HornerSchema(Dp, root);
    root = root - step;
    if abs(step) < tol
      break
    end
  end
end
