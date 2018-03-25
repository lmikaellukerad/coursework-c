image=imread('lena_gray.png');
[h w d]=size(image);
U = double(reshape(image,w*h,d))/255;

%% Write your method here



image =uint8(reshape(U,h,w,d)*255);

figure, imshow(image)
imwrite(image,'out.png')
