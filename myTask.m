clear all
close all

image=imread('test.png');
image=imread('blurryImage.png');
figure, imshow(image)
[h, w, d]=size(image);
U = double(reshape(image,w*h,d))/255;

%% Write your method here
c_s = 3.0;
c_U = 0.5;

G = gradient(h, w);

g = (0.5*G)*U;

U_new = ((G'*G + c_U* speye(h*w)))\(c_s*G'*g + c_U*U);


image =uint8(reshape(U_new,h,w,d)*255);

figure, imshow(image)
imwrite(image,'out.png')
