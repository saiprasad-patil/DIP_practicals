clc
clear all
%Saiprasad Patil - 60001200090
%Aditya Suri - 60001200093
c = imread('C:\Users\djsce.student\MATLAB\Projects\DIP_PSY\images\watermark.png')
m = imresize(c,[256,256]);
f1 = figure;
f1 = imshow(m)
title('SAP ID')

%watermark image resizing
a = imread("cameraman.tif")
b=a;
f2 = figure;
f2 = imshow(a)
title('Original Image')


%watermartkimage using bitplane slicing
b=a;
for i=1:1:256
    for j=1:1:256
        k = b(i,j);
        l = m(i,j);
        BB = dec2bin(k);
        VV = dec2bin(l,8);
        BB(1) = VV(8);
        BB(2) = VV(7);
        BB(3) = VV(6);
        % BB(4) = VV(5);
        % BB(5) = VV(4);
        % BB(6) = VV(3);
        % BB(7) = VV(2);
        % BB(8) = VV(1);
        k = bin2dec(BB);
        b(i,j) = k;
    end
end
f3 = figure;
f3 = imshow(b)
title('Watermark image using bitplane slicing')