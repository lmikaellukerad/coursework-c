clear all
close all

%A “Simple” Implementation (part 1)

% Input: source and target images and selections
% Simple case: whole source image is selected

target=imread('target.jpg');
source=imread('source.jpg');

[h_s, w_s, d_s]=size(source);
[h_t, w_t, d_t]=size(target);

y_start = 221;
x_start = 105;

% Index inner and boundary pixels
cutout = target(y_start:(y_start+h_s - 1), x_start:(x_start + w_s - 1), :);
cutout(2:(h_s - 1), 2:(w_s - 1), :) = 0;
[h_c, w_c, d_c]=size(cutout);

% Create vector U for inner and boundary pixels
U = double(reshape(source,w_s*h_s, d_s))/255;

% Create vector U_b storing the boundary pixels of the target
U_b = double(reshape(cutout,w_c*h_c, d_c))/255;
% U_b = U_b(any(U_b,2),:);

% Compute a gradient matrix G that contains only the inner gradients and 
% the boundary gradients
G = gradient(h_s, w_s);

% Compute selector matrix S that selects the boundary pixels
x = double(reshape(cutout,w_c*h_c,d_c))/255;
y = x ~= 0;
y = y(:, 1);
S = sparse(diag(y));

% Compute gradients of the source image and create a vector ^g that stores 
% the source gradients and zero for the boundary gradients
g = G * U;
g_hat = g;

a = 1;
f1 = G'*G + a*(S')*S;
f2 = G'*g_hat + a*(S')*U_b;

U_new = f1\f2;



image =uint8(reshape(U_new,h_s,w_s,d_s)*255);
target(y_start:(y_start+h_s - 1), x_start:(x_start + w_s - 1), :) = image;
imwrite(image,'bear.png')
figure, imshow(target)
imwrite(target, 'bearinresult.png')

