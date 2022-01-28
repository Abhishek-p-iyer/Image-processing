img = imread('image1.jfif');
figure('Name','Image Transformation');
subplot(4,2,1);
imshow(img);
title('Input image');

f = max(max(img));
neg = f - img;
subplot(4,2,2);
imshow(neg);
title('Negative of the image');


%for gamma less than 1 - bright image 
%for gamma more than 1 - darker image 
%c = 2; % formula - c*r^gamma 
img1 = img(:,:,1);
gamma = [0.5 0.7 0.8 0.9 1 2 3 4 5]; %gamma array 
[r,c] = size(img1);
for k = 1:length(gamma)
    for i = 1:r 
        for j = 1:c 
            IMG(i,j) = c*(double(img1(i,j)).^gamma(k));
        end 
    end
end 
%plotting the images 
subplot(4,2,3);
imshow(img);
title('Input image');
subplot(4,2,4);
imshow(IMG,[],'border','tight');
title('Power law transformation');


[l,m] = size(img1);
LT = zeros(l,m);
    for i = 1:l
        for j = 1:m
            e = double(img(i,j))/255;
            LT(i,j) = 2*log(1+e);
        end
    end
%plotting the image   
subplot(4,2,5);
imshow(img);
title('Input image');
subplot(4,2,6);
imshow(LT);
title('Logarithmic transformation');
