%bit plane slicing 
T_start_bps = tic;
A = zeros(128:128);  %128x128 image 
A(1:64,1:64) = 8;  %First quater= 8
A(1:64,65:128) = 64; %Second quater = 64
A(65:128, 1:128) = 128; %Bottom half = 128
C = uint8(A);  %Unsigned integer 8 
B = double(C);
D = de2bi(B);
D1 = D(:,1);
r1 = reshape(D1,128,128);
% 2nd Bit plane
D2 = D(:,2);
r2 = reshape(D2,128,[]);
% 3rd Bit Plane
D3 = D(:,3);
r3 = reshape(D3,128,[]);
% 4th Bit Plane
D4 = D(:,4);
r4 = reshape(D4,128,[]);
% 5th Bit Plane
D5 = D(:,5);
r5 = reshape(D5,128,[]);
% 6th Bit Plane
D6 = D(:,6);
r6 = reshape(D6,128,[]);
% 7th Bit Plane
D7 = D(:,7);
r7 = reshape(D7,128,[]);
% 8th Bit Plane
D8 = D(:,8);
r8 = reshape(D8,128,128);
figure('Name','Bit plane slicing');
subplot(2,4,1);
imshow(r1);title('LSB Bit Plane');
subplot(2,4,2);
imshow(r2);title('2nd Bit Plane');
subplot(2,4,3);
imshow(r3);title('3rd Bit Plane');
subplot(2,4,4);
imshow(r4);title('4th Bit Plane');
subplot(2,4,5);
imshow(r5);title('5th Bit Plane');
subplot(2,4,6);
imshow(r6);title('6th Bit Plane');
subplot(2,4,7);
imshow(r7);title('7th Bit Plane');
subplot(2,4,8);
imshow(r8);title('MSB Bit Plane');
T_stop_bps = toc(T_start_bps);
disp(['Bit plane slicing: Time for user-defined function- ',num2str(T_stop_bps)]);

%built-in bit plane slicing 
T_start_bi_bsp = tic;
A = zeros(128:128);  %128x128 image 
A(1:64,1:64) = 8;  %First quater= 8
A(1:64,65:128) = 64; %Second quater = 64
A(65:128, 1:128) = 128; %Bottom half = 128
C = uint8(A);  %Unsigned integer 8 
[m,n] = size(C);
B1=bitget(C,1);
figure('Name','Built-in function for bit-plane slicing ')
subplot(2,4,1);
imshow(logical(B1));
title('Bit plane 1');
B2=bitget(C,2);
subplot(2,4,2);
imshow(logical(B2));
title('Bit plane 2');
B3=bitget(C,3);
subplot(2,4,3);
imshow(logical(B3));
title('Bit plane 3');
B4=bitget(C,4);
subplot(2,4,4);
imshow(logical(B4));
title('Bit plane 4');
B5=bitget(C,5);
subplot(2,4,5);
imshow(logical(B5));
title('Bit plane 5');
B6=bitget(C,6);
subplot(2,4,6);
imshow(logical(B6));
title('Bit plane 6');
B7=bitget(C,7);
subplot(2,4,7);
imshow(logical(B7));
title('Bit plane 7');
B8=bitget(C,8);
subplot(2,4,8);
imshow(logical(B8));
title('Bit plane 8');
T_stop_bi_bps = toc(T_start_bi_bsp);
mean_sq_error_bps = immse(B1,cast(r1,'uint8'));
disp(['Bit plane slicing: Time for built-in function- ',num2str(T_stop_bi_bps)]);
disp(['mean square error: ',num2str(mean_sq_error_bps)]);
