% Saiprasad Patil 60001200090
clc;
clear all;
a = imread("wagon.jpg");
plot(a)
subplot(3,2,1);
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
        RobertsR(i,j) = Rr;
    end
end
subplot(3,2,2);
imshow(RobertsR);
title("R-plane after Roberts filter");
for i = 1:x-1
    for j = 1:y-1
        Rgx = a(i,j,2)*robertsX(1) + a(i,j+1,2)*robertsX(2) + a(i+1,j,2)*robertsX(3) + a(i+1,j+1,2)*robertsX(4);
        Rgy = a(i,j,2)*robertsY(1) + a(i,j+1,2)*robertsY(2) + a(i+1,j,2)*robertsY(3) + a(i+1,j+1,2)*robertsY(4);
        Rg = (Rgx + Rgy) / 2;
        RobertsG(i,j) = Rg;
    end
end
subplot(3,2,3);
imshow(RobertsG);
title("G-plane after Roberts filter");
for i = 1:x-1
    for j = 1:y-1
        Rbx = a(i,j,3)*robertsX(1) + a(i,j+1,3)*robertsX(2) + a(i+1,j,3)*robertsX(3) + a(i+1,j+1,3)*robertsX(4);
        Rby = a(i,j,3)*robertsY(1) + a(i,j+1,3)*robertsY(2) + a(i+1,j,3)*robertsY(3) + a(i+1,j+1,3)*robertsY(4);
        Rb = (Rbx + Rby) / 2;
        RobertsB(i,j) = Rb;
    end
end
subplot(3,2,4);
imshow(RobertsB);
title("B-plane after Roberts filter");
Roberts = cat(3,RobertsR,RobertsG,RobertsB);
subplot(3,2,5);
imshow(Roberts);
title("Image after Roberts filter");
