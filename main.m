clear all; close all; clc; pkg load image;

col = 25
row = 7
ind = 0

personas = cellstr(["alfredo"; "downey";"clooney";"lee";"watson"; "fox"; "briares";"test"]);

[A,MA,ind] = cargarimg(25, ind, personas{1,:}, row, col,t=1);
[C,MC,ind] = cargarimg(25, ind, personas{2,:},row,col, t=0);
[D,MD,ind] = cargarimg(25, ind, personas{3,:},row,col, t=0);
[L,ML,ind] = cargarimg(25, ind, personas{4,:},row,col, t=0);
[W,MW,ind] = cargarimg(25, ind, personas{5,:},row,col, t=0);
[F,MF,ind] = cargarimg(25, ind, personas{6,:},row,col, t=0);
[B,MB,ind] = cargarimg(25, ind, personas{7,:},row,col, t=0);

figure(2)
subplot(3,3,1), pcolor(flip(MA)), shading interp, colormap(gray);
subplot(3,3,2), pcolor(flip(MC)), shading interp, colormap(gray);
subplot(3,3,3), pcolor(flip(MD)), shading interp, colormap(gray);
subplot(3,3,4), pcolor(flip(ML)), shading interp, colormap(gray);
subplot(3,3,5), pcolor(flip(MW)), shading interp, colormap(gray);
subplot(3,3,6), pcolor(flip(MF)), shading interp, colormap(gray);
subplot(3,3,7), pcolor(flip(MB)), shading interp, colormap(gray);


Dat = zeros(row*col, 120*80);
i = 1
[Dat, i] = unir_mat(Dat, A, 25, i);
[Dat, i] = unir_mat(Dat, C, 25, i);
[Dat, i] = unir_mat(Dat, D, 25, i);
[Dat, i] = unir_mat(Dat, L, 25, i);
[Dat, i] = unir_mat(Dat, W, 25, i);
[Dat, i] = unir_mat(Dat, F, 25, i);
[Dat, i] = unir_mat(Dat, B, 25, i);


X = mean(Dat);
figure(3)
Mu = reshape(X,120, 80);
pcolor(flipud(Mu)), shading interp, colormap(gray);

clear A;
clear C;
clear D;
clear L;
clear W;
clear F;
clear B;

Cov = (Dat')*Dat;

fprintf("calma\n")
[V,~]=eigs(Cov,200, 'lm');
fprintf("listo\n")


proys = zeros(row, 100);
proys(1, :) = reshape(MA, 1, 120*80)*V;
proys(2,:) = reshape(MC, 1, 120*80)*V;
proys(3,:) = reshape(MD, 1, 120*80)*V;
proys(4,:) = reshape(ML, 1, 120*80)*V;
proys(5,:) = reshape(MW, 1, 120*80)*V;
proys(6,:) = reshape(MF, 1, 120*80)*V;
proys(7,:) = reshape(MB, 1, 120*80)*V;

figure(4)
subplot(3, 3, 1), bar(proys(1, 2:20))
subplot(3, 3, 2), bar(proys(2, 2:20))
subplot(3, 3, 3), bar(proys(3, 2:20))
subplot(3, 3, 4), bar(proys(4, 2:20))
subplot(3, 3, 5), bar(proys(5, 2:20))
subplot(3, 3, 6), bar(proys(6, 2:20))
subplot(3, 3, 7), bar(proys(7, 2:20))

test = imresize(double(rgb2gray(imread('fotos/test/test1 (1)', 'jpg')))', [120,80]);
proyt = (reshape(test, 1, 120*80))*V;
c = clase(proys, proyt, row, V);
figure(5)
pcolor(flip(test)), shading interp, colormap(gray);
fprintf([personas{c}, '\n\n']);


test = imresize(double(rgb2gray(imread('fotos/test/test2 (1)', 'jpg'))), [120,80]);
proyt = reshape(test, 1, 120*80)*V;
c = clase(proys, proyt, row, V);
figure(5)
pcolor(flip(test)), shading interp, colormap(gray);
fprintf([personas{c}, '\n\n']);


test = imresize(double(rgb2gray(imread('fotos/test/test3 (1)', 'jpg'))), [120,80]);
proyt = reshape(test, 1, 120*80)*V;
c = clase(proys, proyt, row, V);
figure(5)
pcolor(flip(test)), shading interp, colormap(gray);
fprintf([personas{c}, '\n\n']);

test = imresize(double(rgb2gray(imread('fotos/test/test4 (1)', 'jpg'))), [120,80]);
vect = reshape(test, 1, 120*80);
proyt = vect*V;
c = clase(proys, proyt, row, V);
figure(5)
pcolor(flip(test)), shading interp, colormap(gray);
fprintf([personas{c}, '\n\n']);

test = imresize(double(rgb2gray(imread('fotos/test/test5 (1)', 'jpg'))), [120,80]);
vect = reshape(test, 1, 120*80);
proyt = vect*V;
c = clase(proys, proyt, row, V);
figure(5)
pcolor(flip(test)), shading interp, colormap(gray);
fprintf([personas{c}, '\n\n']);

test = imresize(double(rgb2gray(imread('fotos/test/test6 (1)', 'jpg'))), [120,80]);
vect = reshape(test, 1, 120*80);
proyt = vect*V;
c = clase(proys, proyt, row, V);
figure(5)
pcolor(flip(test)), shading interp, colormap(gray);
fprintf([personas{c}, '\n\n']);

test = imresize(double(rgb2gray(imread('fotos/test/test7 (1)', 'jpg'))), [120,80]);
vect = reshape(test, 1, 120*80);
proyt = vect*V;
c = clase(proys, proyt, row, V);
figure(5)
pcolor(flip(test)), shading interp, colormap(gray);
fprintf([personas{c}, '\n\n']);
