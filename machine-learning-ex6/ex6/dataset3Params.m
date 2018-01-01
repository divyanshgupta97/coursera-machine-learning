function [C, sigma] = dataset3Params(X, y, Xval, yval)
  valArray = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
  errorMatrix = zeros(8, 8);

  for i=1:length(valArray)
    C = valArray(i);
    for j=1:length(valArray)
      sigma = valArray(j);
      model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
      predictions = svmPredict(model, Xval);
      errorMatrix(i, j) = mean(double(predictions ~= yval));
    end
  end

  minError = min(errorMatrix(:));
  [row col] = find(minError == errorMatrix);
  C = valArray(row);
  sigma = valArray(col);

end
