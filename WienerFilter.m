clc 
clear all
close all 

img = imread('image3.jfif');
img = rgb2gray(img);
figure;
subplot(221);
imshow(img);
title('input image');
%img = double(img);

%{
blurr = imgaussfilt(img,5);
subplot(222);
imshow(blurr);
title('blurred image');
%}
noise = imnoise(img, 'salt & pepper');
subplot(223);
imshow(noise);
title('noisy image');

rest = wiener2(noise,[10,10]);
subplot(224);
imshow(rest);
title('restored image');
