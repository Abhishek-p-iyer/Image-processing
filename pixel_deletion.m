%pixel deletion in of a grayscale image 
figure('Name','Pixel deletion');
subplot(1,2,1);
imshow(gray);
axis([0,318,0,159]);
axis on;
title('original grayscale image');
pd = gray(1:140,1:100);
subplot(1,2,2);
imshow(pd);
axis([0,318,0,159]);
axis on;
title('pixel deletion');
