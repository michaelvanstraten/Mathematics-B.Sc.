function plotCubicSpline (x, coefficients)
    pointsPerInterval = 100;

    n = numel(x) - 1;

    assert(all([4,n] == size(coefficients)))

    X = linspace(x(1:n), x(2:n+1), pointsPerInterval);
    t = X - x(1:n)';

    alpha = coefficients(1,:)';
    beta  = coefficients(2,:)';
    gamma = coefficients(3,:)';
    delta = coefficients(4,:)';

    Y = alpha .* t.^0 + beta .* t.^1 + gamma .* t.^2 + delta .* t.^3;

    h = plot(X'(:)', Y'(:)', 'LineWidth', 1.5);
    grid on;
    xlabel('x');
    ylabel('s(x)');
    title('Natural Cubic Spline');
endfunction
