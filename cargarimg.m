function [A, MA, ind] = cargarimg(num, ind, carp, row,col, t)
  A = zeros(120, 80, 6);
  MA = zeros(120, 80);
  l = 0;
  w = 1/num;
  h = 1/row;
  b = 1-h*(ind/num + 1);
  for i=1:num
    ind = ind + 1;
    file = ['fotos/', carp, '/img', num2str(i) ' (1)'];
    if t == 1
      A(:, :, i) = imresize(double(rgb2gray(imread(file, 'jpg')))', [120,80]);
    else
      A(:, :, i) = imresize(double(rgb2gray(imread(file, 'jpg'))), [120,80]);
    endif
    axis off
    box off
    subplot('Position',[l b w h]);, pcolor(flip(A(:, :, i))), shading interp, colormap(gray);
    l = l + w;
    MA = MA + A(:, :, i);
  end
  MA = MA/num;
endfunction