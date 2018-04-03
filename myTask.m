clear all
close all

image=imread('test.png');
image=imread('blurryImage.png');
%image=image(250:354,1:204,:);
figure, imshow(image)
[h, w, d]=size(image);
U = double(reshape(image,w*h,d))/255;

%% Write your method here
c_s = 4.0;
c_U = 0.5;

G = gradient(h, w);

g = (0.5*G)*U;

f1 = (G'*G + c_U * speye(h*w));
f2 = c_s*G'*g + c_U*U;

U_new = f1\f2;


image =uint8(reshape(U_new,h,w,d)*255);
figure, imshow(image)
imwrite(image,'out.png')

%% Test


%G = sparse(ci,cj,cv);