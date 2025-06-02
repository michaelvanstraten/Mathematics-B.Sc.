function [n4s, boundaryEdges] = computeEdges(n4e)
    n4s = [n4e(:, [1,2]); n4e(:, [2,3]); n4e(:, [1,3])];

    unique(n4s, "rows")
end