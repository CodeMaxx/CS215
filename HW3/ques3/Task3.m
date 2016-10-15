clear;
N = 1000000;
R = 10;
% Picking theta from uniform distribution
U = rand(1,N)*2*pi;
X = zeros(2,N);
% Initialising 2-D variable
X(1,:) = R*cos(U);
X(2,:) = R*sin(U);

ml = zeros(2,1);
% Calculating Mu
ml(1,1) = sum(X(1,:))/N;
ml(2,1) = sum(X(2,:))/N;
ml
% Calculating Covariance Matrix
cov(X(1,:)',X(2,:)')