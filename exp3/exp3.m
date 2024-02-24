% Saiprasad Patil
disp("Saiprasad Patil  60001200090")
a = imread("cameraman.tif");
figure(1);
imshow(a);
da = double(a);
title("Original");
b = imnoise(a, 'salt & pepper');
figure(2);
imshow(b);
title("Salt & Pepper Noise");
c = imnoise(a, 'gaussian');
figure(4);
imshow(c);
title("Gaussian Noise");

for i = 2:255
    for j = 2:255
        mask = [b(i-1, j-1), b(i-1, j), b(i-1, j+1), b(i, j-1), b(i, j), b(i, j+1), b(i+1, j-1), b(i+1, j), b(i+1, j+1)];
        M = median(mask);
        b(i,j) = M;
    end
end
figure(3);
imshow(b);
title("Median Filter");

for k = 2:255
    for l = 2:255
        mask = [c(k-1, l-1), c(k-1, l), c(k-1, l+1), c(k, l-1), c(k, l), c(k, l+1), c(k+1, l-1), c(k+1, l), c(k+1, l+1)];
        A = mean(mask);
        c(k,l) = A;
    end
end
figure(5);
imshow(c);
title("Average Filter");

for m = 2:255
    for n = 2:255
        mask = [-1,-1,-1,-1,8,-1,-1,-1,-1];
        H = da(m-1, n-1)*mask(1) + da(m-1, n)*mask(2) + da(m-1, n+1)*mask(3) + da(m, n-1)*mask(4) + da(m, n)*mask(5) + da(m, n+1)*mask(6) + da(m+1, n-1)*mask(7) + da(m+1, n)*mask(8) + da(m+1, n+1)*mask(9);
        hpf(m,n) = H;
    end
end
figure(6);
imshow(uint8(hpf));
title("High Pass Filter");