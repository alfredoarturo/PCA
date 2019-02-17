clear all; close all; clc; pkg load image;

col = 12
row = 3
ind = 0


A = zeros(120, 80, 6);
MA = zeros(120, 80);
carp = 'alfredo'
l = 0
w = 1/12;
h = 1/row;
b = 1-h*(ind/12 + 1);
for i=1:12
  ind = ind + 1;
  file = ['fotos/', carp, '/img', num2str(i) ' (1)'];
  A(:, :, i) = imresize(double(rgb2gray(imread(file, 'jpg'))), [120,80]);
  axis off
  box off
  subplot('Position',[l b w h]);, pcolor(flip(A(:, :, i)')), shading interp, colormap(gray);
  l = l + w
  MA = MA + A(:, :, i);
end
MA = MA/12;

C = zeros(120, 80, 6);
MC = zeros(120, 80);
carp = 'clooney'
for i=1:12
  ind = ind + 1;
  file = ['fotos/', carp, '/img', num2str(i) ' (1)'];
  C(:, :, i) = imresize(double(rgb2gray(imread(file, 'jpg'))), [120,80]);
  subplot(row, col, ind), pcolor(flip(C(:, :, i))), shading interp, colormap(gray);
  MC = MC + C(:, :, i);
end
MC = MC/12;

D = zeros(120, 80, 6);
MD = zeros(120, 80);
carp = 'downey'
for i=1:12
  ind = ind + 1;
  file = ['fotos/', carp, '/img', num2str(i) ' (1)']
  D(:, :, i) = imresize(double(rgb2gray(imread(file, 'jpg'))), [120,80]);
  subplot(row, col, ind), pcolor(flip(D(:, :, i))), shading interp, colormap(gray);
  MD = MD + D(:, :, i);
end
MD = MD/12;

figure(2)
subplot(2,2,1), pcolor(flip(MA')), shading interp, colormap(gray);
subplot(2,2,2), pcolor(flip(MC)), shading interp, colormap(gray);
subplot(2,2,3), pcolor(flip(MD)), shading interp, colormap(gray);


D=[reshape(A(:, :, 1), 1, 120*80)
   reshape(A(:, :, 2), 1, 120*80)
   reshape(A(:, :, 3), 1, 120*80)
   reshape(A(:, :, 4), 1, 120*80)
   reshape(A(:, :, 5), 1, 120*80)
   reshape(A(:, :, 6), 1, 120*80)
   reshape(A(:, :, 7), 1, 120*80)
   reshape(A(:, :, 8), 1, 120*80)
   reshape(A(:, :, 9), 1, 120*80)
   reshape(A(:, :, 10), 1, 120*80)
   reshape(A(:, :, 11), 1, 120*80)
   reshape(A(:, :, 12), 1, 120*80)
   reshape(C(:, :, 1), 1, 120*80)
   reshape(C(:, :, 2), 1, 120*80)
   reshape(C(:, :, 3), 1, 120*80)
   reshape(C(:, :, 4), 1, 120*80)
   reshape(C(:, :, 5), 1, 120*80)
   reshape(C(:, :, 6), 1, 120*80)
   reshape(C(:, :, 7), 1, 120*80)
   reshape(C(:, :, 8), 1, 120*80)
   reshape(C(:, :, 9), 1, 120*80)
   reshape(C(:, :, 10), 1, 120*80)
   reshape(C(:, :, 11), 1, 120*80)
   reshape(C(:, :, 12), 1, 120*80)
   reshape(D(:, :, 1), 1, 120*80)
   reshape(D(:, :, 2), 1, 120*80)
   reshape(D(:, :, 3), 1, 120*80)
   reshape(D(:, :, 4), 1, 120*80)
   reshape(D(:, :, 5), 1, 120*80)
   reshape(D(:, :, 6), 1, 120*80)
   reshape(D(:, :, 7), 1, 120*80)
   reshape(D(:, :, 8), 1, 120*80)
   reshape(D(:, :, 9), 1, 120*80)
   reshape(D(:, :, 10), 1, 120*80)
   reshape(D(:, :, 11), 1, 120*80)
   reshape(D(:, :, 12), 1, 120*80)
    ];
    
A = (D')*D;

[V,D]=eigs(A,20, 'lm');

figure(3)
subplot(2, 3, 1), face1=reshape(V(:,1), 120, 80); pcolor(flipud(face1)), shading interp, colormap(gray);
subplot(2, 3, 2), face1=reshape(V(:,2), 120, 80); pcolor(flipud(face1)), shading interp, colormap(gray);
subplot(2, 3, 3), face1=reshape(V(:,3), 120, 80); pcolor(flipud(face1)), shading interp, colormap(gray);
subplot(2, 3, 4), face1=reshape(V(:,4), 120, 80); pcolor(flipud(face1)), shading interp, colormap(gray);
subplot(2, 3, 5), face1=reshape(V(:,5), 120, 80); pcolor(flipud(face1)), shading interp, colormap(gray);
subplot(2, 3, 6), semilogy(diag(D), 'ko', 'Linewidth', [2])



vecA = reshape(MA, 1, 120*80);
vecC = reshape(MC, 1, 120*80);
vecD = reshape(MD, 1, 120*80);

projA = vecA*V;
projC = vecC*V;
projD = vecD*V;

figure(4)
subplot(3, 1, 1), bar(projA(2:20))
subplot(3, 1, 2), bar(projC(2:20))
subplot(3, 1, 3), bar(projD(2:20))



test = imresize(double(rgb2gray(imread('fotos/test/test1 (1)', 'jpg')))', [120,80]);
vect = reshape(test, 1, 120*80);
projt = vect*V;


disA = norm(projA - projt, 2)
disC = norm(projC - projt, 2)
disD = norm(projD - projt, 2)

if disA < disC
  if disA < disD
    fprintf("Es Alfredo\n")
  else
    fprintf("Es Downey\n")
  endif
else
  if disC < disD
    fprintf("Es Clooney\n")
  else
    fprintf("Downey\n")
  endif
endif

test = imresize(double(rgb2gray(imread('fotos/test/test2 (1)', 'jpg')))', [120,80]);
vect = reshape(test, 1, 120*80);
projt = vect*V;

disA = norm(projA - projt, 2)
disC = norm(projC - projt, 2)
disD = norm(projD - projt, 2)

if disA < disC
  if disA < disD
    fprintf("Es Alfredo\n")
  else
    fprintf("Es Downey\n")
  endif
else
  if disC < disD
    fprintf("Es Clooney\n")
  else
    fprintf("Downey\n")
  endif
endif

test = imresize(double(rgb2gray(imread('fotos/test/test3 (1)', 'jpg')))', [120,80]);
vect = reshape(test, 1, 120*80);
projt = vect*V;

disA = norm(projA - projt, 2)
disC = norm(projC - projt, 2)
disD = norm(projD - projt, 2)

if disA < disC
  if disA < disD
    fprintf("Es Alfredo\n")
  else
    fprintf("Es Downey\n")
  endif
else
  if disC < disD
    fprintf("Es Clooney\n")
  else
    fprintf("Downey\n")
  endif
endif




