clear all
close all

%A �Simple� Implementation (part 1)

% Input: source and target images and selections
% Simple case: whole source image is selected

target=imread('target.jpg');
source=imread('source.jpg');

[h_s, w_s, d_s]=size(source);
[h_t, w_t, d_t]=size(target);

% Index inner and boundary pixels
cutout = target(221:282, 5:79, :);
%cutout_inside = cutout;
cutout(2:61, 2:74, :) = 0;
[h_c, w_c, d_c]=size(cutout);

% Create vector U for inner and boundary pixels
U = double(reshape(source,w_s*h_s,d_s))/255;

% Create vector U_b storing the boundary pixels of the target
U_b = double(reshape(cutout,w_c*h_c,d_c))/255;
U_b = U_b(any(U_b,2),:);

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
g_hat = S * g;

