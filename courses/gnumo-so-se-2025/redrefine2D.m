function [c4nNew, n4eNew] = redrefine2D(c4n, n4e)
T        = size(n4e,1);
edges    = [n4e(:,[1 2]);        % Edge 1-2
            n4e(:,[2 3]);        % Edge 2-3
            n4e(:,[3 1])];       % Edge 3-1

edgesOrd = sort(edges,2)                          % für »unique«
[uniqEdges, ~, ic] = unique(edgesOrd,'rows','stable')

% -------- 2) Mittel­punkte nur einmal anlegen ----------------------------
midCoord      = (c4n(uniqEdges(:,1),:) + c4n(uniqEdges(:,2),:))/2;
c4nNew        = [c4n; midCoord];                  % alte + neue Knoten
firstMidIndex = size(c4n,1) + 1;
midIdx        = firstMidIndex-1 + (1:size(uniqEdges,1))';

% Zuordnung »jede Kante  →  ihr Mittel­punkt«
midIdxPerEdge = reshape(midIdx(ic), T, 3);        % (T × 3)

m12 = midIdxPerEdge(:,1);  % Mitte von 1-2
m23 = midIdxPerEdge(:,2);  % Mitte von 2-3
m31 = midIdxPerEdge(:,3);  % Mitte von 3-1

% -------- 3) Vier Kinddreiecke erzeugen ----------------------------------
n4eNew = zeros(4*T,3);

idx = (1:T)';              % Spaltenweise Zuordnung spart Schleifen
n4eNew(4*idx-3,:) = [n4e(:,1)  m12        m31       ];  % Kind 1
n4eNew(4*idx-2,:) = [n4e(:,2)  m23        m12       ];  % Kind 2
n4eNew(4*idx-1,:) = [n4e(:,3)  m31        m23       ];  % Kind 3
n4eNew(4*idx  ,:) = [m12      m23        m31       ];   % Kind 4 (mittig)
end
