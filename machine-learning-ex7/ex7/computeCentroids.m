function centroids = computeCentroids(X, idx, K)
  [m n] = size(X);
  centroids = zeros(K, n);

  for i = 1: K
    y = i == idx;
    centroids(i, :) = (y' * X) / size(find(i == idx), 1);
  end
  
end
