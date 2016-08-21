%  mu1 = mean(X1);
%  mu2 = mean(X2);
%  X3 = int32(X1).*int32(X2);
%  mu3 = mean(X3);
%  cov = mu3 - mu1*mu2;
%  X1 = single(X1);
%  X2 = single(X2);
%  varx1 = var(X1);
%  varx2 = var(X2);
%  cor = cov/sqrt(varx1*varx2);

A= imread('parrots.png');
Cor = zeros(1,101);
z=(0:100);
for k = (0:100)
X1 = A(1:512-k,:);
X2 = A(1+k:512,:);
X1 = X1(:);
X2 = X2(:);
R = corrcoef(single(X1),single(X2));
Cor(1,k+1) = R(1,2);
end

plot(z,Cor)
ylim([0,1])