function [U, S] = pca(X)
 [m, n] = size(X);
 U = zeros(n);
 S = zeros(n);
 covMat = (1 / m) * X' * X;
 [U, S, V] = svd(covMat);
end
