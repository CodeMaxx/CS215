N = 100000;
R = 10;
U = rand(1,N)*2*pi;
X = zeros(2,N);
X(1,:) = R*cos(U);
X(2,:) = R*sin(U);

ml = zeros(2,1);
ml(1,1) = sum(X(1,:))/N;
ml(2,1) = sum(X(2,:))/N;
ml;
cov(X(1,:)',X(2,:)');