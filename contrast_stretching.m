%contrast stretching 
A = zeros(128:128);  %128x128 image 
A(1:64,1:64) = 8;  %First quater= 8
A(1:64,65:128) = 64; %Second quater = 64
A(65:128, 1:128) = 128; %Bottom half = 128
C = uint8(A);  %Unsigned integer 8 

cont_time_start = tic;
w1=40;
w2=150;
r1=8;
r2=63;
L=255;
a=w1/r1;
b=(w2-w1)/(r2-r1);
g=(L-w2)/(L-r2);
figure('Name','Contrast stretching');
subplot(2,2,3);
imshow(C);
title('Input Image');
subplot(2,2,1);
imhist(C);
title('Histogram of input image');
[x,y]=size(C);
for i=1:x
    for j=1:y
        if C(i,j)<=r1
            r=C(i,j);
        elseif C(i,j)>r1 && C(i,j)<=r2
            r=C(i,j);
            C(i,j)=(b*(r-r1))+w1;
        else
            r=C(i,j);
            C(i,j)=(g*(r-r2))+w2;
        end
    end
end
subplot(2,2,4);
imshow(C);
title('Output Image');
subplot(2,2,2);
imhist(C);
title('Output histogram');
cont_time_end = toc(cont_time_start); 
disp(['Contrast stretching: Time for user-defined function- ',num2str(cont_time_end)]);

%built in function for contrast stretching 
T_start_bi_cont_cs = tic;
A = zeros(128:128);  %128x128 image 
A(1:64,1:64) = 8;  %First quater= 8
A(1:64,65:128) = 64; %Second quater = 64
A(65:128, 1:128) = 128; %Bottom half = 128
C = uint8(A);  %Unsigned integer 8 
U= imadjust(cast(C,'uint8'),[0.0313;0.2509],[0.1568,0.58823]);
figure('Name','Built-in');
subplot(2,2,1);
imhist(C);
title('input histogram');
subplot(2,2,3);
imshow(C)
title('input image');
subplot(2,2,4);
imshow(U);
title('output image');
subplot(2,2,2);
imhist(U);
title('output histogram');
T_stop_bi_cs = toc(T_start_bi_cont_cs );
disp(['Contrast stretching: Time for built-in function- ',num2str(cont_time_end)]);
