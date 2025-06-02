%% Main script for interpolation comparison
%% Part 1: Interpolation of |x|, Runge function with different support points
function plotInterpolation(fun, funDisp, intervalStart, intervalStop, nIntervals)
    numPoints = nIntervals + 1;
    evaluationPoints = linspace(intervalStart, intervalStop, 1000);

    samplingPoints = linspace(intervalStart, intervalStop, numPoints);
    functionValues = fun(samplingPoints);

    % Compute interpolations
    polyValues = polynomInterpolationValues(evaluationPoints, samplingPoints, functionValues);
    splineValues = splineInterpolationValues(evaluationPoints, samplingPoints, functionValues);

    % Plot results
    figure;
    plot(evaluationPoints, fun(evaluationPoints), 'k-', 'LineWidth', 1.5); hold on;
    plot(evaluationPoints, polyValues, 'b--', 'LineWidth', 1.5);
    plot(evaluationPoints, splineValues, 'r:', 'LineWidth', 1.5);
    plot(samplingPoints, functionValues, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
    hold off;
    title(sprintf('%s Interpolation: %d Support Points', funDisp, numPoints));
    legend('f(x)', 'Polynomial', 'Spline', 'Support Points', 'Location', 'best');
    xlabel('x'); ylabel('y');
end

%% Part 2: Error comparison including splines
function plotErrorComparison(fun, funDisp, intervalStart, intervalStop, nIntervals)
    numPoints = nIntervals + 1;
    evaluationPoints = linspace(intervalStart, intervalStop, 1000);

    % Generate nodes and function values
    samplingEqui = linspace(intervalStart, intervalStop, numPoints);
    samplingCheb = chebyshevNodes(intervalStart, intervalStop, nIntervals);
    valuesEqui = fun(samplingEqui);
    valuesCheb = fun(samplingCheb);

    % Calculate interpolations
    polyEqui = polynomInterpolationValues(evaluationPoints, samplingEqui, valuesEqui);
    polyCheb = polynomInterpolationValues(evaluationPoints, samplingCheb, valuesCheb);
    splineEqui = splineInterpolationValues(evaluationPoints, samplingEqui, valuesEqui);
    splineCheb = splineInterpolationValues(evaluationPoints, samplingEqui, valuesEqui);

    functionValues = fun(evaluationPoints);

    % Calculate errors
    errorEqui = abs(functionValues - polyEqui);
    errorCheb = abs(functionValues - polyCheb);
    errorSplineEqui = abs(functionValues - splineEqui);
    errorSplineCheb = abs(functionValues - splineCheb);

    % Plot results
    figure;
    semilogy(evaluationPoints, errorEqui, 'b-', 'LineWidth', 1.5); hold on;
    semilogy(evaluationPoints, errorCheb, 'r--', 'LineWidth', 1.5);
    semilogy(evaluationPoints, errorSplineEqui, 'g:', 'LineWidth', 2);
    semilogy(evaluationPoints, errorSplineEqui, 'y', 'LineWidth', 2);
    title(sprintf('%s Error Comparison: %d Nodes', funDisp, numPoints));
    legend('Equidistant Poly', 'Chebyshev Poly', 'Equidistant Natural Spline', 'Chebyshev Natural Spline', 'Location', 'best');
    xlabel('x'); ylabel('|f(x) - p(x)|');
    grid on;

    % Add maximum error values to console
    fprintf('\n%s Maximum Errors (%d nodes):\n', funDisp, numPoints);
    fprintf('Equidistant Polynomial:     %.2e\n', max(errorEqui));
    fprintf('Chebyshev Polynomial:       %.2e\n', max(errorCheb));
    fprintf('Equidistant Natural Spline: %.2e\n', max(errorSplineEqui));
    fprintf('Chebyshev Natural Spline:   %.2e\n\n', max(errorSplineCheb));
end

function nodes = chebyshevNodes(a, b, n)
    nodes = (a + b)/2 + (b - a)/2 * cos((2*(0:n) + 1) * pi/(2*(n + 1)));
end

%% Execute comparisons
for k = 2.^(2:4)
    % Absolute value function comparison
    plotInterpolation(@(x) abs(x), "|x|", -2, 2, k)
    % Runge function interpolation
    plotInterpolation(@(x) 1./(1 + 25*x.^2), "Runge Function", -1, 2, k)
end

for k = 2.^(2:4)
    % Error comparison for Runge function
    plotErrorComparison(@(x) 1./(1 + 25*x.^2), "Runge Function", -1, 1, k)
end