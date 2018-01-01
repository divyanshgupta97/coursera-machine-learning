function x = emailFeatures(word_indices)
  n = 1899;
  x = zeros(n, 1);

  for i = 1: n
    x(i) = ismember(i, word_indices);
  end
end
