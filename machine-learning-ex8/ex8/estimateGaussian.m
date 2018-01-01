function [mu sigma2] = estimateGaussian(X)
  [m, n] = size(X);
  mu = zeros(n, 1);
  sigma2 = zeros(n, 1);
  mu = mean(X);
  sigma2 = ((m - 1) / m) * var(X);  
end
