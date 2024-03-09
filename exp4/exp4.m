clc;
a = imread("pout.tif");
figure(1);
imshow(a);
title("Original Image");
figure(2);
histogram(a);
title("Original Histogram")
hist = imhist(a);
pdf = hist / numel(a);
cdf = cumsum(pdf);
heq = uint8(255 * cdf(a));
figure(3);
imshow(heq);
title("Histogram Equalized Image");
figure(4);
histogram(heq);
title("Equalized Histogram");