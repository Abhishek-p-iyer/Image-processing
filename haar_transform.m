%This code uses the function haar_transform_updated.m which I've used as a reference from Mathworks -  https://in.mathworks.com/matlabcentral/fileexchange/45247-code-for-generating-haar-matrix
  
clc
clear all
close all
image = imread('image4.jpg');
gr = rgb2gray(image);
start = tic;
pyr1 = impyramid(gr,'reduce');
pyr2 = impyramid(pyr1,'reduce');
N1 = length(pyr1);
N2 = length(pyr2);
[Hr1] = haar_transform_updated(N1);
[Hr2] = haar_transform_updated(N2);
haar_pyr1 = (Hr1)*double(pyr1)/(Hr1);
haar_pyr2 = (Hr2)*double(pyr2)/(Hr2);


figure('Name','Haar-transform of Image pyramid');
colormap(gray(255));
subplot(2,2,1)
imshow(pyr1);
axis on;
title('Image pyramid 1 - N/2xN/2');
subplot(2,2,2)
imshow(cast(abs(haar_pyr1),'uint8'));
title('Haar transform of N/2xN/2');
subplot(2,2,3)
imshow(pyr2);
axis on;
title('Image pyramid 2 - N/4xN/4');
subplot(2,2,4)
imshow(cast(abs(haar_pyr2),'uint8'));
title('Haar transform of N/4xN/4');

figure('Name','Sub-bands');
subplot(4,1,1);
imhist(cast(pyr1,'uint8'));
title('Sub-band of the image pyramid 1 - N/2xN/2');
subplot(4,1,2);
imhist(cast(abs(haar_pyr1),'uint8'));
title('Sub-band of the Haar transformed image - N/2xN/2');
subplot(4,1,3);
imhist(cast(pyr2,'uint8'));
title('Sub-band of the image pyramid 1 - N/4xN/4');
subplot(4,1,4);
imhist(cast(abs(haar_pyr2),'uint8'));
title('Sub-band of the image pyramid 2 - N/4xN/4');
stop = toc(start);
Y=['Time taken for haar transform as well as sub-bands   ',num2str(stop)];
disp(Y);
