clear;
rng(0);
pis = zeros(1,8);

for j=1:8
n = 10^j;
f = n;
in = 0;
tic;
while f > 0
X = 2*single(rand(2,min(f,100000000))) - 1;
f = f - min(f,100000000);
% for i = X
% in = in + (norm(i) <= 1);
% end
X = X.^2;
X = sum(X);
in = in + sum(X <= 1);
end
toc;
pis(1,j) = 4*in/n;
end

n = 103600;
X = 2*single(rand(2,n)) - 1;
in = 0;
for i = X
in = in + (norm(i) <= 1);
end
pi_for_M = 4*in/n;
