rng(0);
pis = zeros(1,8);

for j=1:8
n = 10^j;
X = 2*single(rand(2,n)) - 1;
in = 0;
for i = X
in = in + (norm(i) <= 1);
end
pis(1,j) = 4*in/n;
end
