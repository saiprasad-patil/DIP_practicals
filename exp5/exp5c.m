% Saiprasad Patil 60001200090
clc;
clear all;
a = imread("wagon.jpg");
subplot(3,2,1);
imshow(a);
title("Original");
[x,y,z] = size(a);
sobelX = [-1,0,1,-2,0,2,-1,0,1];
sobelY = [-1,-2,-1,0,0,0,1,2,1];
for i = 2:x-2
    for j = 2:y-2
        Prx = a(i-1,j-1,1)*sobelX(1) + a(i-1,j,1)*sobelX(2) + a(i-1,j+1,1)*sobelX(3) + a(i,j-1,1)*sobelX(4) + a(i,j,1)*sobelX(5) + a(i,j+1,1)*sobelX(6) + a(i+1,j-1,1)*sobelX(7) + a(i+1,j,1)*sobelX(8) + a(i+1,j+1,1)*sobelX(9);
        Pry = a(i-1,j-1,1)*sobelY(1) + a(i-1,j,1)*sobelY(2) + a(i-1,j+1,1)*sobelY(3) + a(i,j-1,1)*sobelY(4) + a(i,j,1)*sobelY(5) + a(i,j+1,1)*sobelY(6) + a(i+1,j-1,1)*sobelY(7) + a(i+1,j,1)*sobelY(8) + a(i+1,j+1,1)*sobelY(9);
        Pr = (Prx + Pry) / 2;
        SobelR(i,j) = Pr;
    end
end
subplot(3,2,2);
imshow(SobelR);
title("R-plane after Sobel filter");
for i = 2:x-2
    for j = 2:y-2
        Pgx = a(i-1,j-1,2)*sobelX(1) + a(i-1,j,2)*sobelX(2) + a(i-1,j+1,2)*sobelX(3) + a(i,j-1,2)*sobelX(4) + a(i,j,2)*sobelX(5) + a(i,j+1,2)*sobelX(6) + a(i+1,j-1,2)*sobelX(7) + a(i+1,j,2)*sobelX(8) + a(i+1,j+1,2)*sobelX(9);
        Pgy = a(i-1,j-1,2)*sobelY(1) + a(i-1,j,2)*sobelY(2) + a(i-1,j+1,2)*sobelY(3) + a(i,j-1,2)*sobelY(4) + a(i,j,2)*sobelY(5) + a(i,j+1,2)*sobelY(6) + a(i+1,j-1,2)*sobelY(7) + a(i+1,j,2)*sobelY(8) + a(i+1,j+1,2)*sobelY(9);
        Pg = (Pgx + Pgy) / 2;
        SobelG(i,j) = Pg;
    end
end
subplot(3,2,3);
imshow(SobelG);
title("G-plane after Sobel filter");
for i = 2:x-2
    for j = 2:y-2
        Pbx = a(i-1,j-1,3)*sobelX(1) + a(i-1,j,3)*sobelX(2) + a(i-1,j+1,3)*sobelX(3) + a(i,j-1,3)*sobelX(4) + a(i,j,3)*sobelX(5) + a(i,j+1,3)*sobelX(6) + a(i+1,j-1,3)*sobelX(7) + a(i+1,j,3)*sobelX(8) + a(i+1,j+1,3)*sobelX(9);
        Pby = a(i-1,j-1,3)*sobelY(1) + a(i-1,j,3)*sobelY(2) + a(i-1,j+1,3)*sobelY(3) + a(i,j-1,3)*sobelY(4) + a(i,j,3)*sobelY(5) + a(i,j+1,3)*sobelY(6) + a(i+1,j-1,3)*sobelY(7) + a(i+1,j,3)*sobelY(8) + a(i+1,j+1,3)*sobelY(9);
        Pb = (Pbx + Pby) / 2;
        SobelB(i,j) = Pb;
    end
end
subplot(3,2,4);
imshow(SobelB);
title("B-plane after Sobel filter");
Sobel = cat(3,SobelR,SobelG,SobelB);
subplot(3,2,5);
imshow(Sobel);
title("Image after Sobel filter");