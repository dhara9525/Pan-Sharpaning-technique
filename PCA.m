%%% Read color image 426 x 640 x 3
I=imread('fruits_rgb.jpg');
figure;
imagesc(I);
title('Original color image');
I=double(I);
% Change size to 272640 x 3
[m, n, k]=size(I);
len=m*n;
X= [reshape(I(:,:,1),len,1) reshape(I(:,:,2),len,1) reshape(I(:,:,3),len,1)];
%%% Read gray scale image
J = imread('fruits_gray.jpg');
figure; imagesc(J); colormap(gray);
title('Original gray scale image');
J = double(J);
[gm, gn] = size(J);
JX = reshape(J,len,1);
%%% Process color image and gray-scale image
muX=mean(X);
muJX=mean(JX);
xminusmux=X-muX;
jxminumsmujx=JX-muJX;
[rowX,colX]=size(X);
covX=1/(rowX-1)*xminusmux'*xminusmux;
eigX=eig(covX);
[rowJX,colJX]=size(JX);
covJX=1/(rowJX-1)*jxminumsmujx'*jxminumsmujx;
eigJX=eig(covJX);

%%% Use all pcs to compute Xhat which the recovered image
% Xhat is 272640 x 3


% Xhat>


% Convert Xhat to 426 x 640 x 3
Xhat3(:,:,1) = reshape(Xhat(:,1),m,n);
Xhat3(:,:,2) = reshape(Xhat(:,2),m,n);
Xhat3(:,:,3) = reshape(Xhat(:,3),m,n);
% Display Xhat
I3 = uint8(Xhat3);
figure; imagesc(I3);
title('Pan-sharpened image')