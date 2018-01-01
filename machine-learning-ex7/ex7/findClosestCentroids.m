function idx = findClosestCentroids(X, centroids)
  K = size(centroids, 1);
  idx = zeros(size(X,1), 1);
  centroidDist = @(x) min(arrayfun(@(i) sum((x - centroids(i, :)).^2), 1: K));

  for i = 1: size(X, 1)
    [minDist, index] = centroidDist(X(i, :));
    idx(i, :) = index;
  end

end
