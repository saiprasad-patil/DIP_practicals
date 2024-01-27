% Saiprasad Patil - 60001200090
a = imread('cameraman.tif');
[r, c] = size(a);
L = 255;
r1 = 50;
r2 = 100;
s = 0;

m = 255/(r2-r1);
for i = 1:r
    for j =1:c
        if 0 <= a(i,j) && a(i,j) <= r1
            s(i,j) = 0;
        elseif r1 < a(i,j) && a(i,j) <= r2
            s(i,j) = m*(a(i,j)-r1);
        elseif r2 < a(i,j) && a(i,j) <= L
            s(i,j) = 255;
        end
    end
end


figure(1);
imshow(a);
figure(2);
imshow(uint8(s));