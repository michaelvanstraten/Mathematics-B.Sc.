function retval = NumDeriv (f, point, StepSize, order, q, mode)
  switch mode
    case "right"
      retval = (f(point + StepSize) - f(point)) / StepSize;
    case "left"
      retval = (f(point) - f(point - StepSize)) / StepSize;
    case "central"
      retval = (f(point + StepSize) - f(point - StepSize)) / (2*StepSize);
    case "extrapolation"
      h = StepSize .* q .^ (1:order);
      retval = NevilleSchema(h, (f(point + h) - f(point)) ./ h, 0);
  endswitch
endfunction
