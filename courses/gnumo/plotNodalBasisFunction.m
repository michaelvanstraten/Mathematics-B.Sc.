function plotNodalBasisFunction(nodeNumber, N)
    if nargin<2, N = 5; end

    [X, Y] = meshgrid(linspace(0,1,N));
    Z = zeros(N);

    % MATLAB is column-major, so linear indexing on A.' corresponds
    % to swapping row↔col in A.
    [row_At, col_At] = ind2sub(size(Z), nodeNumber);
    Z(col_At, row_At) = 1;

    % triangulation: split each square cell along the main diagonal
    T = zeros(2*(N-1)^2, 3);
    tri = 1;
    for i = 1:N-1
        for j = 1:N-1
            n1 = sub2ind([N,N], i,   j  );  % top-left
            n2 = sub2ind([N,N], i+1, j  );  % bottom-left
            n3 = sub2ind([N,N], i+1, j+1);  % bottom-right
            n4 = sub2ind([N,N], i,   j+1);  % top-right

            T(tri, :) = [n1, n2, n3];
            tri = tri + 1;
            T(tri, :) = [n1, n3, n4];
            tri = tri + 1;
        end
    end

    trisurf(T, X, Y, Z)
    axis equal tight
    xlabel('x'), ylabel('y'), zlabel('z')
    title(sprintf('Nodal basis at node %d (N = %d)', nodeNumber, N))
end
