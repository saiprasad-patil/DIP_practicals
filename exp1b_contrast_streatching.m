% Saiprasad Patil - 60001200090
r = imread('cameraman.tif');
L = 255;

r1 = 50;
r2 = 100;
s1 = 25;
s2 = 200;

m1 = s1/r1;
m2 = (s2-s1)/(r2-r1);
m3 = (L- s2)/(L-r2);

if 0 <= r <= r1
    s = m1*r;
elseif r1 < r < r2
        s =m2(r-r1) + s1;
elseif r2 < r < L
        s = m3(r-r2) + s2;
end

figure(1);
imshow(r);
figure(2);
imshow(s);