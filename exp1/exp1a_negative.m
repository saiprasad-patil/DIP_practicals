% Saiprasad  Patil - 60001200090

a = imread('cameraman.tif');
[r, c] = size(a);
b = 255-a;

figure(1);
imshow(a);

figure(2);
imshow(b);