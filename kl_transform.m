clc
clear all 
close all 

bi_KL_start = tic;
img=imread("image3.jfif");
gray =  rgb2gray(img);
figure;
subplot(1,2,1);
imshow(gray);
title('Input image');
I=double(gray);
[V,~]=eig(cov(I'));
KLT = V' * I;
F= KLT*I';
subplot(1,2,2);
imshow(F)
title('KL transform');
bi_KL_stop = toc(bi_KL_start);
disp(['Time taken for built-in function: KL Transform -  ',num2str(bi_KL_stop)]);
