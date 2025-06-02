function y = splineInterpolationValues(x, samplingPoints, functionValues)
    y = fnval(csape(samplingPoints, functionValues), x);
end