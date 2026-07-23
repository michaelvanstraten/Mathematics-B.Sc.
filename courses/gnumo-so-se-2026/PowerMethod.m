function [eVal, eVec, numIter] = PowerMethod(A, x0, tol)
  MAX_ITER = 1e5;
  norm = @(x) sqrt(sum(x .^ 2));
  eVec = x0;
  eVal = 1;
  for numIter = 1:MAX_ITER
    xTilde = A * eVec;
    eVal = dot(eVec, xTilde);
    next = xTilde ./ norm(xTilde);
    change = min(norm(eVec - next), norm(eVec + next));
    eVec = next;
    if change < tol
      break
    end
  end
end
