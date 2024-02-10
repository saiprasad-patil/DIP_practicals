% Saiprasad Patil - 60001200090
a = imread('cameraman.tif');
[r,c] = size(a);
L = 255;
th = 50;

for i = 1:r
    for j =1:c
        if a(i,j) <= th
            s(i,j) = 0;
        elseif th < a(i,j) && a(i,j) <= L
            s(i,j) = L;
        end
    end
end

figure(1);
imshow(a);
figure(2);
imshow(s);