function [root, iter] = NewtonMethod(f, Df, x0, tol)
  MAX_ITER = 1e5;
  root = x0;
  for iter = 1:MAX_ITER
    step = Df(root) \ f(root);
    root = root - step;
    if sqrt(sum(step .^ 2)) < tol
      break
    end
  end
end
