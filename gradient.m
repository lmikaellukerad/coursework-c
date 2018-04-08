function [ G ] = gradient( h, w)
%GRADIENT Summary of this function goes here
% In this gradient function we create column and row index vectors for both
% horizontal gradients and vertical gradients. These index vectors are
% created based on a selection pattern that can be found in the slides. The
% horizontal and vertical gradient matrices are calculated separately and
% are combinedd at the end.

x = [-1 1];
y = [1 2];
z = [1 h + 1];

x_w = h*(w-1);
x_h = w*(h-1);

hj_1 = repmat(y, [1 x_h]);
hj_2 = repmat(0:(x_h - 1), [2 1]);
hj_2 = hj_2(:)';
hj_3 = repmat(0:(w - 1), [(2*(h-1)) 1]);
hj_3 = hj_3(:)';
hj = hj_1 + hj_2 + hj_3;

hi = repmat(1:x_h, [2 1]);
hi = hi(:)';

hv = repmat(x, [1 x_h]);

wi = repmat(1:x_w, [2 1]);
wi = wi(:)';

wj_1 = repmat(z, [1 x_w]);
wj_2 = repmat(0:h:(h*(w-2)), [2 1]);
wj_2 = repmat(wj_2(:)', [1 h]);
wj_3 = repmat(0:(h - 1), [(2*(w-1)) 1]);
wj_3 = wj_3(:)';
wj = wj_1 + wj_2 + wj_3; 

wv = repmat(x, [1 x_w]);

Gh = sparse(hi, hj, hv);
Gv = sparse(wi, wj, wv);

G = [Gv; Gh];


