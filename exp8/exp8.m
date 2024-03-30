clc;
clear all;
a = [
    0 0 0 0 0 0 0;
    1 1 0 0 1 1 0;
    1 1 0 0 1 1 0;
    1 1 1 1 1 1 0;
    1 1 1 1 1 1 0;
    1 1 0 0 1 1 0;
    1 1 0 0 1 1 0;
    0 0 0 0 0 0 0
];
st = [
     1 1;
     0 0
];
[x,y] = size(a);
dilation = zeros(x,y);
erosion = zeros(x,y);
opening = zeroes(x,y);
%Dilation
for i = 1:x-1
    for j = 1:y-1
        if (a(i,j) == st(1,1) || a(i,j+1) == st(1,2))
            dilation(i,j) = 1;
        end
    end
end
for m = 1:x-1
    for n = 1:y-1
        if (a(m,n) == st(1,1) && a(m,n+1) == st(1,2))
            erosion(m,n) = 1;
        end
    end
end

for i = 1:x-1
    for j = 1:y-1
        if (a(i,j) == st(1,1) || a(i,j+1) == st(1,2))
            opening(i,j) = 1;
        end
    end
end
for m = 1:x-1
    for n = 1:y-1
        if (a(m,n) == st(1,1) && a(m,n+1) == st(1,2))
            opening(m,n) = 1;
        end
    end
end



disp("Saiprasad Patil 60001200090");
disp("Original:");
disp(a);
disp("Dilation:");
disp(dilation);
disp("Erosion:");
disp(erosion);