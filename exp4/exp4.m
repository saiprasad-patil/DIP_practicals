% Saiprasad Patil
clc;
a = imread("pout.tif");
figure(1);
imshow(a);
title("Original");
[rows, cols] = size(a);

pixel_freq = zeros(1,256);  
pdf = zeros(1,256); 
cdf = zeros(1,256); 

for r = 1:rows
    for c = 1:cols
        pixel_value = a(r, c);
        pixel_freq(pixel_value + 1) = pixel_freq(pixel_value + 1) + 1;
    end
end

figure(2);
bar(pixel_freq);
title('Pixel Value Histogram');
xlabel('Pixel Value');
ylabel('Frequency');

sumArray = sum(pixel_freq,2);
[rpf,cpf] = size(pixel_freq);
for i = 1:cpf
    pdf(i) = pixel_freq(i) / sumArray;
end


