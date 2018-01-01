function p = predict(Theta1, Theta2, X)
  m = size(X, 1);
  num_labels = size(Theta2, 1);

  p = zeros(size(X, 1), 1);

  A_1 = [ones(m, 1) X];
  Z_2 = A_1 * Theta1';
  A_2 = sigmoid(Z_2);
  A_2 = [ones(m, 1) A_2];
  Z_3 = A_2 * Theta2';
  A_3 = sigmoid(Z_3);
  [max_val indices] = max(A_3, [], 2);
  p = p + indices;
end
