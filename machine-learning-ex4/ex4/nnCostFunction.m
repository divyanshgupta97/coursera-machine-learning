function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
 Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

 Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

 m = size(X, 1);

 J = 0;
 Theta1_grad = zeros(size(Theta1));
 Theta2_grad = zeros(size(Theta2));

 A_1 = ([ones(m, 1) X])';
 Z_2 = Theta1 * A_1;
 A_2 = [ones(1, m); sigmoid(Z_2)];
 Z_3 = Theta2 * A_2;
 A_3 = sigmoid(Z_3);
 Y = eye(num_labels)(:, y);
 J = J + (-1 / m) * (trace(Y' * log(A_3)) + trace((1 - Y') * log(1 - A_3))) ....
     + (lambda / (2 * m)) * (sum(sum(Theta1(:, [2: end]).^2)) + sum(sum(Theta2(:, [2: end]).^2)));
 del_3 = A_3 - Y;
 del_2 = ((Theta2' * del_3) .* [ones(1, size(Z_2, 2)); sigmoidGradient(Z_2)])([2: end], :);
 big_del_1 = (1 / m) * (del_2 * A_1') + (lambda / m) * [zeros(size(Theta1, 1), 1) Theta1(:, [2: end])];
 big_del_2 = (1 / m) * (del_3 * A_2') + (lambda / m) * [zeros(size(Theta2, 1), 1) Theta2(:, [2: end])];
 Theta1_grad = Theta1_grad + big_del_1;
 Theta2_grad = Theta2_grad + big_del_2;

 grad = [Theta1_grad(:) ; Theta2_grad(:)];
end
