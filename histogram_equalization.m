close all 
clear all 
A = zeros(128:128);  %128x128 image 
A(1:64,1:64) = 8;  %First quater= 8
A(1:64,65:128) = 64; %Second quater = 64
A(65:128, 1:128) = 128; %Bottom half = 128
C = uint8(A);  %Unsigned integer 8 
figure('Name','Histogram equalization');
subplot(2,2,3);
imshow(C);  %Displaying the input image 
title('Input image');
subplot(2,2,1);
imhist(C);  %Displaying the histogram of the input 
title('Histogram of input');
subplot(2,2,4);
B = histeq(C);
imshow(B); %Displaying the output of the equalized image
title('Output of image');
subplot(2,2,2);
imhist(B,64); %Displaying the histogram equalization of the input image
title('Histogram of output');
