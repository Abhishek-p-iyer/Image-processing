%built-in matlab code for DCT 
bi_dct_start = tic;
img = imread('image3.jfif');
figure;
subplot(2,2,1);
imshow('image3.jfif');
title('Input image - RGB');
gray =  rgb2gray(img);
subplot(2,2,2);
imshow(gray);
title('Gray scale image');
%dct = dct2(gray);
G = double(gray);
D = dctmtx(size(G,1));
dct = D*G*D';
subplot(2,2,3);
imshow(log(abs(dct)),[]);
title('built in function - DCT');
bi_dct_stop = toc(bi_dct_start);
disp(['Time taken for built-in function: DCT -  ',num2str(bi_dct_stop)]);

%user-defined function for DCT
ud_dct = tic;
[M,N] = size(G);
temp = zeros(size(G));
B=zeros(size(G));
x=1:M;
x=repmat(x',1,N);
y=repmat(1:N,M,1);

for i=1:M
    for j=i:N
        if(i==1)
            alpha_p=sqrt(1/M);
        else 
            alpha_p=sqrt(2/M);
        end
        
        if(j==1)
            alpha_q=sqrt(1/N);
        else 
            alpha_q=sqrt(2/N);
        end
        
        cos_p = cos((pi*(2*x-1)*(i-1))/(2*M));
        cos_q = cos((pi*(2*y-1)*(j-1))/(2*N));
        temp = G.*cos_p*cos_q;
        B(i,j) = alpha_p*alpha_q*sum(sum(temp));
    end
end
ud_dct_stop = toc(ud_dct);
subplot(2,2,4);
imshow(log(abs(B)),[]);
title('Built-in function - DCT');
mean_sq_error_dct = immse(B,dct);
disp(['Time taken for user-defined function- DCT -  ',num2str(ud_dct_stop)]);
disp(['mean sqaure error - ', num2str(mean_sq_error_dct)]);
