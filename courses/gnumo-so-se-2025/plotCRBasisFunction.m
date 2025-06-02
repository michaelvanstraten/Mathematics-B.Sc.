function plotCRBasisFunction(node1, node2)
    [y, x] = meshgrid(0:0.25:1);
    nodes = [x(:), y(:)];
    triangles = delaunay(-x, y);

    % A |T|×3 logical matrix.  In row j and column k you find 1
    % if the j‑th triangle has node1 or node2 as its k‑th vertex;
    % otherwise the entry is 0.
    hasEitherNode = ismember(triangles, [node1, node2]);

    % A |T|×1 logical vector.  Row j is 1 when the j‑th triangle
    % contains the edge between node1 and node2.  This happens exactly
    % when the corresponding row of hasEitherNode contains two ones.
    hasEdge = sum(hasEitherNode, 2) == 2;

    X = reshape(nodes(triangles(:, [1 2 3]), 1), [size(triangles, 1) 3]);
    Y = reshape(nodes(triangles(:, [1 2 3]), 2), [size(triangles, 1) 3]);

    % A |T|×3 matrix giving the z‑coordinate for each vertex of the
    % triangle mesh.  If the triangle contains the sought edge, each
    % vertex is set to −1 or +1 depending on whether it lies on that edge.
    Z = hasEdge .* (2 * hasEitherNode - 1);

    patch(X', Y', Z', sum(Z, 2)' / 3);
    view(3)
end