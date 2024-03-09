% Saiprasad Patil 60001200090
clc;
clear all;
a = imread("wagon.jpg");
subplot(3,2,1);
imshow(a);
title("Original");
[x,y,z] = size(a);
prewittX = [-1,0,1,-1,0,1,-1,0,1];
prewittY = [-1,-1,-1,0,0,0,1,1,1];
for i = 2:x-2
    for j = 2:y-2
        Prx = a(i-1,j-1,1)*prewittX(1) + a(i-1,j,1)*prewittX(2) + a(i-1,j+1,1)*prewittX(3) + a(i,j-1,1)*prewittX(4) + a(i,j,1)*prewittX(5) + a(i,j+1,1)*prewittX(6) + a(i+1,j-1,1)*prewittX(7) + a(i+1,j,1)*prewittX(8) + a(i+1,j+1,1)*prewittX(9);
        Pry = a(i-1,j-1,1)*prewittY(1) + a(i-1,j,1)*prewittY(2) + a(i-1,j+1,1)*prewittY(3) + a(i,j-1,1)*prewittY(4) + a(i,j,1)*prewittY(5) + a(i,j+1,1)*prewittY(6) + a(i+1,j-1,1)*prewittY(7) + a(i+1,j,1)*prewittY(8) + a(i+1,j+1,1)*prewittY(9);
        Pr = (Prx + Pry) / 2;
        PrewittR(i,j) = Pr;
    end
end
subplot(3,2,2);
imshow(PrewittR);
title("R-plane after Prewitt filter");
for i = 2:x-2
    for j = 2:y-2
        Pgx = a(i-1,j-1,2)*prewittX(1) + a(i-1,j,2)*prewittX(2) + a(i-1,j+1,2)*prewittX(3) + a(i,j-1,2)*prewittX(4) + a(i,j,2)*prewittX(5) + a(i,j+1,2)*prewittX(6) + a(i+1,j-1,2)*prewittX(7) + a(i+1,j,2)*prewittX(8) + a(i+1,j+1,2)*prewittX(9);
        Pgy = a(i-1,j-1,2)*prewittY(1) + a(i-1,j,2)*prewittY(2) + a(i-1,j+1,2)*prewittY(3) + a(i,j-1,2)*prewittY(4) + a(i,j,2)*prewittY(5) + a(i,j+1,2)*prewittY(6) + a(i+1,j-1,2)*prewittY(7) + a(i+1,j,2)*prewittY(8) + a(i+1,j+1,2)*prewittY(9);
        Pg = (Pgx + Pgy) / 2;
        PrewittG(i,j) = Pg;
    end
end
subplot(3,2,3);
imshow(PrewittG);
title("G-plane after Prewitt filter");
for i = 2:x-2
    for j = 2:y-2
        Pbx = a(i-1,j-1,3)*prewittX(1) + a(i-1,j,3)*prewittX(2) + a(i-1,j+1,3)*prewittX(3) + a(i,j-1,3)*prewittX(4) + a(i,j,3)*prewittX(5) + a(i,j+1,3)*prewittX(6) + a(i+1,j-1,3)*prewittX(7) + a(i+1,j,3)*prewittX(8) + a(i+1,j+1,3)*prewittX(9);
        Pby = a(i-1,j-1,3)*prewittY(1) + a(i-1,j,3)*prewittY(2) + a(i-1,j+1,3)*prewittY(3) + a(i,j-1,3)*prewittY(4) + a(i,j,3)*prewittY(5) + a(i,j+1,3)*prewittY(6) + a(i+1,j-1,3)*prewittY(7) + a(i+1,j,3)*prewittY(8) + a(i+1,j+1,3)*prewittY(9);
        Pb = (Pbx + Pby) / 2;
        PrewittB(i,j) = Pb;
    end
end
subplot(3,2,4);
imshow(PrewittB);
title("B-plane after Prewitt filter");
Prewitt = cat(3,PrewittR,PrewittG,PrewittB);
subplot(3,2,5);
imshow(Prewitt);
title("Image after Prewitt filter");