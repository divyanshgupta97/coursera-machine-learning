function Z = projectData(X, U, K)
  Z = zeros(size(X, 1), K);
  Z = Z + X * U(:, 1: K);
end
