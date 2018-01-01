function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
  m = length(y);

  J = 0;
  grad = zeros(size(theta));

  J = J + (1 / (2 * m)) * sum((X * theta - y).^2) + (lambda / (2 * m)) * sum(theta([2: end], :).^2);
  grad = grad + (1 / m) * (X' * (X * theta - y)) + (lambda / m) * [0; theta([2: end], :)];

  grad = grad(:);
end
