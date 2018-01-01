function p = predict(theta, X)
  m = size(X, 1);
  p = zeros(m, 1);
  p = p + floor(sigmoid(X*theta) + 0.5);
end
