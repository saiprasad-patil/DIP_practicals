%Saiprasad Patil 60001200090
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
% Dilation
dilation = zeros(x,y);
for i = 1:x-1
    for j = 1:y-1
        if (a(i,j) == st(1,1) || a(i,j+1) == st(1,2))
            dilation(i,j) = 1;
        end
    end
end
% Erosion
erosion = zeros(x,y);
for m = 1:x-1
    for n = 1:y-1
        if (a(m,n) == st(1,1) && a(m,n+1) == st(1,2))
            erosion(m,n) = 1;
        end
    end
end
% Opening
e_a = zeros(x,y);
opening = zeros(x,y);
for m = 1:x-1
    for n = 1:y
        if (a(m,n) == st(1,1) && a(m+1,n) == st(2,1))
            e_a(m,n) = 1;
        end
    end
end
for i = 1:x-1
    for j = 1:y
        if (e_a(i,j) == st(1,1) || e_a(i+1,j) == st(2,1))
            opening(i,j) = 1;
        end
    end
end
% Closing
d_a = zeros(x,y);
closing = zeros(x,y);
for m = 1:x-1
    for n = 1:y
        if (a(m,n) == st(1,1) || a(m+1,n) == st(2,1))
            d_a(m,n) = 1;
        end
    end
end
for i = 1:x-1
    for j = 1:y
        if (d_a(i,j) == st(1,1) && d_a(i+1,j) == st(2,1))
            closing(i,j) = 1;
        end
    end
end

disp("Saiprasad Patil 60001200090");
disp("Original:");
disp(a);
disp("Structuring element:");
disp(st);
disp("Dilation:");
disp(dilation);
disp("\n");
disp(imdilate(a,st));
##disp("Erosion:");
##disp(erosion);
##disp("E(A):");
##disp(e_a);
##disp("After Opening:");
##disp(opening);
##disp("D(A):");
##disp(d_a);
##disp("After Closing:");
##disp(closing);
