function [xMin, numIter] = SteepestDescent(f, Df, beta, gamma, s, x0, tol)
  MAX_ITER = 1e6;
  xMin = x0;
  for numIter = 0:MAX_ITER
    grad = Df(xMin)(:);
    if norm(grad, 2) <= tol
      break
    end
    d = - grad / norm(grad, 2);
    stepSize = s;
    for k = 1:MAX_ITER
      if f(xMin) > f(xMin + stepSize * d) - gamma * stepSize * grad' * d
        break
      end
      stepSize = stepSize * beta;
    end
    xMin = xMin + stepSize * d;
  end
end
