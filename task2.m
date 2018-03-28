clear all
close all

target=imread('target.jpg');
source=imread('source.jpg');
figure, imshow(image)
[h, w, d]=size(image);
U = double(reshape(image,w*h,d))/255;