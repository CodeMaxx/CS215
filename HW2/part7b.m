A= imread('parrots.png');
Cor = zeros(1,101);
z = (0:100);
for k = (0:100)
X1 = A(:,1:768-k);
X2 = A(:,1+k:768);
X1 = single(X1(:));
X2 = single(X2(:));
R = corrcoef(single(X1),single(X2));
Cor(1,k+1) = R(1,2);
end

plot(z,Cor)
ylim([0,1])
xlabel('z');
ylabel('Correlation Coefficient');