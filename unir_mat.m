function [Dat, i] = unir_mat(Dat, A, num, i)
  for j = 1:num;
    Dat(i+j-1, :) = reshape(A(:, :, j), 1, 120*80);
  endfor
  i = i+num;
endfunction