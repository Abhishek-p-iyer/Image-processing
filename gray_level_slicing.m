%Gray level slicing 
glc_time_in = tic;
A = zeros(128:128);  %128x128 image 
A(1:64,1:64) = 8;  %First quater= 8
A(1:64,65:128) = 64; %Second quater = 64
A(65:128, 1:128) = 128; %Bottom half = 128
C = uint8(A);  %Unsigned integer 8 
x1 = 8;
x2 = 64;
figure('Name','Gray level slicing');
subplot(2,2,3);
imshow(C);
title('Original Image');
subplot(2,2,1);
imhist(C);
title('Histogram of Input');
[x,y,z]=size(C);
for i=1:x
    for j=1:y
        if C(i,j)>=x1 && C(i,j)<=x2
            C(i,j)=255;
        end
    end
end
subplot(2,2,4);
imshow(C);
title('Output image');
subplot(2,2,2);
imhist(C);
title('Histogram of output image');
glc_time_out = toc(glc_time_in);
disp(['Gray level slicing: Time for user-defined function- ',num2str(glc_time_out)]);
