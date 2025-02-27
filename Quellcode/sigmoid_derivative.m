function y = sigmoid_derivative(x)
sigmoid = 1 ./ (1 + exp(-x));
y = sigmoid .* (1 - sigmoid);
end
