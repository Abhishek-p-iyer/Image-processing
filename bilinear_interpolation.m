%Bi-linear interpolation
%Bi-linear interpolation user defined 
T_user_bi_lin = tic;
fac = 2;
im=cast(gray,'int16'); 
figure('Name','Bi-linear interpolation');
subplot(2,2,1);
imshow(cast(im,'uint8'));
title('Input image');
[h,v,d]=size(im);

for i=1:h
    for j=1:v
      im1(1+(i-1)*fac,1+(j-1)*fac,:)=im(i,j,:); 
    end
       
       axis([0,636,0,318]);
       axis on;
end

%bilinear interpolation implementation
for i=1:1+(h-2)*fac     %row number
    for j=1:1+(v-2)*fac %column number
    
       if ((rem(i-1,fac)==0) && (rem(j-1,fac)==0)) 
       else  
           h00=im1( ceil(i/fac)*fac-fac+1,ceil(j/fac)*fac-fac+1,:); 
           h10=im1( ceil(i/fac)*fac-fac+1+fac,ceil(j/fac)*fac-fac+1,:);
           h01=im1( ceil(i/fac)*fac-fac+1,ceil(j/fac)*fac-fac+1+fac,:);
           h11=im1( ceil(i/fac)*fac-fac+1+fac,ceil(j/fac)*fac-fac+1+fac,:);
           
           x=rem(i-1,fac); %coordinates of calculating pixel.
           y=rem(j-1,fac);  
          
           dx=x/fac; %localizeing the  pixel being calculated to the nearest four know pixels.
           dy=y/fac;
          
           b1=h00;    %constants of bilinear interpolation.
           b2=h10-h00;
           b3=h01-h00;
           b4=h00-h10-h01+h11;           
           im1(i,j,:)=b1+b2*dx+b3*dy+b4*dx*dy; %equation of bilinear interpolation.
         end
    end
end
subplot(2,2,3);
imshow(cast(im1,'uint8'));
title('User defined functions');
axis([0,636,0,318]);
axis on;
T_user_bi_lin_end = toc(T_user_bi_lin);
C=['Bi-linear interpolation: Time for user-defined function- ',num2str(T_user_bi_lin_end)];
disp(C);

%Bi-linear interpolation built in fuction
T_built_bi_lin = tic;
ratio = 2;
bi_lin = imresize(gray,ratio,'bilinear');
%figure('Name','built-in function');
subplot(2,2,4);
imshow(bi_lin);
axis([0,636,0,318]);
axis on;
title('built-in function');
bi_lin_inter = bi_lin(1:(h*2)-1,1:(v*2)-1);
T_built_bi_lin = toc(T_built_bi_lin);
mean_err_bi=immse(bi_lin_inter,cast(im1,'uint8'));
disp(['Bi-linear interpolation: Time for built-in function- ',num2str(T_built_bi_lin)]);
disp(['mean square error: ',num2str(mean_err_bi)]);
