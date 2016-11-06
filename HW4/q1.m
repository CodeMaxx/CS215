rng(0);
n = 10^8;

X = 2*single(rand(2,n)) - 1;

in = 0;

tic;
for i = X
if(norm(i) <= 1)
    in = in + 1;
end
end
toc;
pi = 4*in/n