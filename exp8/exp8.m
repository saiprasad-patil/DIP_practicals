% Exp7: Discrete Cosine Transform

clc;
clear all;
% Original  Matrix
a = [
    0 1 2 1;
    1 2 3 2;
    2 3 4 3;
    1 2 3 2
];

t = zeros(4, 4);
N = 4;

% Calculating DCT Transformation Matrix
for u = 1:N
    for v = 1:N
        if u == 1
            t(u,v) = 1/sqrt(N);
        else
            t(u,v) = (sqrt(2/N)) * cos((((2*(v-1))+1)*pi*(u-1))/(2*N));
        end
    end
end

% Calculating DCT Matrix
dct = t*a*transpose(t);

disp("Saiprasad Patil 60001200090")
disp("Original matrix:");
disp(a);
disp("DCT transformation matrix(T):");
disp(t);
disp("DCT matrix:");
disp(dct);