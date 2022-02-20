clc
clear all 
close all 
img = imread('image3.jfif');
img = rgb2gray(img);
out=dct2(cast(img,'double'));
 

%user defined functions 
C=cast(zeros(size(img)),'double');
inp=cast(img,'double');
[k,l]=size(img);
temp = 0;
alpha = 0;
for i=1:k
    for j=1:l
        if(i==1)
            if(j==1)
                alpha = (1/sqrt(k))*(1/sqrt(l));
            else
                alpha = (1/sqrt(k))*(sqrt(2/l));
            end
        else 
            if(j==1)
                alpha = (sqrt(2/k))*(1/sqrt(l));
            else
                alpha = (sqrt(2/k))*(sqrt(2/l));
            end
        end 
        for m=1:k
            for n=1:l
                p=(i*(2*m+1))/(2*k);
                q=(j*(2*n+1))/(2*l);
                temp = temp + inp(m,n)*cosd(p*180)*cosd(q*180);
                C(i,j) = alpha*temp;
            end 
        end 
        temp = 0;
        
    end
    
end
figure;
subplot(1,2,1);
imshow(cast(out,'uint8'));
title('inbuilt function');
subplot(1,2,2);
imshow(cast((C),'uint8'));
title('user defined function');

