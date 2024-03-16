% Saiprasad Patil 60001200090
clc;
clear all;
a = imread("blobs.png");
figure(1)
% subplot(3,2,1);
imshow(a);
title("Original");
[x,y,z] = size(a);
robertsX = [-1,0,0,1];
robertsY = [0,-1,1,0];

for i = 1:x-1
    for j = 1:y-1
        Rrx = a(i,j,1)*robertsX(1) + a(i,j+1,1)*robertsX(2) + a(i+1,j,1)*robertsX(3) + a(i+1,j+1,1)*robertsX(4);
        Rry = a(i,j,1)*robertsY(1) + a(i,j+1,1)*robertsY(2) + a(i+1,j,1)*robertsY(3) + a(i+1,j+1,1)*robertsY(4);
        Rr = (Rrx + Rry) / 2;
        X_img(i,j) = Rrx;
        Y_img(i,j) = Rry;
        RobertsR(i,j) = Rr;
    end
end
figure(2)
imshow(X_img)
title("X-plane");
figure(3)
imshow(Y_img)
title("Y-plane");
% subplot(3,2,2);

% imshow(RobertsR);
% title("R-plane after Roberts filter");
Roberts = cat(3,X_img,Y_img);
figure(4)
% subplot(3,2,5);
imshow(Roberts);
title("Image after Roberts filter");


