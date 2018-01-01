function p = predictOneVsAll(all_theta, X)
  m = size(X, 1);
  num_labels = size(all_theta, 1);

  p = zeros(size(X, 1), 1);

  X = [ones(m, 1) X];

  [max_val indices] =  max(X * all_theta', [], 2);
  p = p + indices;
end
