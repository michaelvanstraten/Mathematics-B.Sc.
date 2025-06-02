c4n = [0 0; 1 0; 1 1; 0 1];
n4e = [2 3 1; 3 4 1];

c4n = [-1 -1; 0 -1; 1 -1; 1 0; 0 0; 0 1; -1 1; -1 0];
n4e = [1 5 8; 5 1 2; 2 4 5; 4 2 3; 8 6 7; 6 8 5];

new1 = (c4n(n4e(:,1),:) + c4n(n4e(:,2),:)) / 2;
new2 = (c4n(n4e(:,2),:) + c4n(n4e(:,3),:)) / 2;
new3 = (c4n(n4e(:,3),:) + c4n(n4e(:,1),:)) / 2;


% --- Einheitsquadrat (Start) -------------------------------------------


[c4n1,n4e1] = redrefine2D(c4n,n4e);   % level = 1
[c4n2,n4e2] = redrefine2D(c4n1,n4e1); % level = 2
[c4n3,n4e3] = redrefine2D(c4n2,n4e2); % level = 3

% Plot (Octave und MATLAB identisch)
triplot(n4e3, c4n3(:,1), c4n3(:,2), 'k');
axis equal tight off
title('Rot-Verfeinerung, level = 3');