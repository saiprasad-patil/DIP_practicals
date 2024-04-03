% Saiprasad Patil 60001200090
clc;
close all;
a=imread('images\exp6_test.png');
[r, c]=size(a);
g=zeros(r,c);
figure(1); imshow(a);
[Y,X]=ginput(1);
temp=a(round (X), round (Y));
g(round(X), round(Y))=1;
for x=2:1:r-1
    for y=2:1:c-1
        for p=2:1:r-1
            for q=2:1:c-1
                if(g(p,q)==1)
                    if a(p,q)==a(p,q+1)
                        g(p,q+1)=1;
                    end
                    if a(p,q)==a(p,q-1)
                        g(p,q-1)=1;
                    end
                    if a(p,q)==a(p-1,q)
                        g(p-1,q)=1;
                    end
                    if a(p,q)==a(p+1,q)
                        g(p+1,q)=1;
                    end
                end
            end
        end
    end
end

figure(2);
imshow(g);
subplot(1,2,1)
imshow(a);
title('Original Image');
subplot(1,2,2)
imshow(g);
title('Output');
