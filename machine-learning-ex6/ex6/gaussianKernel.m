function sim = gaussianKernel(x1, x2, sigma)
  sim = 0;
  sim = sim + exp(-((x1 - x2)' * (x1 - x2)) / (2 * sigma.^2));
end
