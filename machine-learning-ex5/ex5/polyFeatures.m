function [X_poly] = polyFeatures(X, p)
  X_poly = zeros(numel(X), p);

  for i = 1:p
    X_poly(:, i) = X.^i;
  end
end
