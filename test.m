
%corresponding correct gradient matrices
G1 = [-0.5, 0.5, 0; 0, -0.5, 0.5];
G2 = 0.5*[-1, 0, 1, 0; 0, -1, 0, 1; -1, 1, 0, 0; 0, 0, -1, 1];

G1test = gradient(1, 3);
G2test = gradient(2, 2);

G11test = 0.5*full(G1test);
G22test = 0.5*full(G2test);

result1 = G1 == G11test;
result2 = G2 == G22test;