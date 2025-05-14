function y = polynomInterpolationValues(x, samplingPoints, functionValues)
    coefficents = zeros(1, length(samplingPoints));
    for k=1:length(samplingPoints)
        coefficents(k)=functionValues(1);
        for j=1:length(samplingPoints)-k
            functionValues(j)=(functionValues(j+1)-functionValues(j))/(samplingPoints(j+k)-samplingPoints(j));
        end
    end

    y = coefficents(length(coefficents));

    for k=length(coefficents):-1:2
       y = coefficents(k-1)+(x-samplingPoints(k-1)).*y;
    end
end