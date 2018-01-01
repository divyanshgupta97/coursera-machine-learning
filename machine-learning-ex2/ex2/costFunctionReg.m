function [J, grad] = costFunctionReg(theta, X, y, lambda)
  m = length(y);
  J = 0;
  grad = zeros(size(theta));
  J = J + (-1/m)*[y' * log(sigmoid(X * theta)) + (1 - y)' * log(1 - sigmoid(X * theta))] + (lambda/(2*m)) * ((theta([2:end], :))' * theta([2:end], :));
  grad = grad + (1/m) * (X'*(sigmoid(X * theta) - y)) + (lambda/m) * [0; theta([2:end],:)]
end
