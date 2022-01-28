zooming in of an image using nearest neighbour method 
T_user_near = tic;
gray = rgb2gray(img);
figure('Name','Nearest Neighbour Method');
subplot(2,2,1);
imshow(gray);
axis([0,636,0,318]);
axis on;
title('input image');
Col = 636;
Row = 318;
ratio_R = Row/size(gray,1);
ratio_C = Col/size(gray,2);
IR = ceil([1:(size(gray,1)*ratio_R)]./(ratio_R));
IC = ceil([1:(size(gray,2)*ratio_C)]./(ratio_C));
B=gray(:,IC);
B=B(IR,:);
subplot(2,2,3);
imshow(B);
axis([0,636,0,318]);
axis on;
title('user-defined function')
T_user_end_near = toc(T_user_near);
Y=['Nearest Neighbour Method: Time for user-defined funtion- ',num2str(T_user_end_near)];
disp(Y)

%zooming in of an image using nearest neigbhour built-in function 
T_built_near = tic;
scale = 2;
near_neigh = imresize(gray,scale,'nearest');
subplot(2,2,4);
imshow(near_neigh);
title('Built-in function');
axis([0,636,0,318]);
axis on;
T_built_end_near = toc(T_built_near);
mean_sq_error_near = immse(B,near_neigh);
disp(['Nearest Neighbour Method: Time for built-in function- ',num2str(T_built_end_near)]);
disp(['Mean square error for Nearest Neighbour Method: ', num2str(mean_sq_error_near)]);
