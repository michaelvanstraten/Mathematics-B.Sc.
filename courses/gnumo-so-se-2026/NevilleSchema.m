function val = NevilleSchema(x,y,z)
    n = numel(x) - 1;
    P = diag(y);
    for l = 1:n
        for k = 1:n-l+1
            P(k, k+l) = P(k, k+l-1) ...
                + (z - x(k)) * (P(k+1, k+l) - P(k, k+l-1)) ...
                / (x(k+l) - x(k));
        end
    end
    disp(P);
    val = P(1, n+1);
end
