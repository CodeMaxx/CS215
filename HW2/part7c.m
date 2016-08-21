A= imread('parrots.png');
v = A(:);
v=v(randperm(length(v)));
A = reshape(v,[512,768]);
X1 = A(:,1:768-1);
X2 = A(:,1+1:768);
X1 = single(X1(:));
X2 = single(X2(:));

mu1 = mean(X1);
mu2 = mean(X2);
X3 = int32(X1).*int32(X2);
mu3 = mean(X3);
cov = mu3 - mu1*mu2;
X1 = single(X1);
X2 = single(X2);
varx1 = var(X1);
varx2 = var(X2);
cor = cov/sqrt(varx1*varx2);

X1_hist = zeros(26,1);
X2_hist = zeros(26,1);
X1X2_hist = zeros(26,26);
for a = 1:size(X1,1)
       X1_hist(floor(X1(a,1)/10)+1,1) = X1_hist(floor(X1(a,1)/10)+1,1) + 1;
       X2_hist(floor(X2(a,1)/10)+1,1) = X1_hist(floor(X2(a,1)/10)+1,1) + 1;
       X1X2_hist(floor(X1(a,1)/10)+1,floor(X2(a,1)/10)+1) = X1X2_hist(floor(X1(a,1)/10)+1,floor(X2(a,1)/10)+1) + 1;
end

X1_hist = X1_hist./sum(X1_hist);
X2_hist = X2_hist./sum(X2_hist);
X1X2_hist = X1X2_hist./sum(sum(X1X2_hist));
p = 0;
q = 0;
for a = 1:26
    for b = 1:26
        p = p + (X1X2_hist(a,b) - X1_hist(a)*X2_hist(b))^2;
    end
end
for a = 1:26
    for b = 1:26
        q = q + abs(X1X2_hist(a,b) - X1_hist(a)*X2_hist(b));
    end
end