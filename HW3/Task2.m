N = [5 10 20 40 60 80 100 500 1000 10000];
ml = zeros(100,10);
bay = zeros(100,10);
for k=1:10
for c = 1:100
X = rand(N(k),1);
Y = -0.2*log(X);
ml(c,k) = abs((N(k)/sum(Y)- 5)/5);
bay(c,k) = abs(((N(k) + 5.5)/(sum(Y)+1) - 5)/5);
end
end

subplot(2,1,1) 
boxplot(ml);
title('Maximum Likelihood');
set(gca,'XTickLabel',N);
xlabel('N');
ylabel('Relative Error');
subplot(2,1,2) 
boxplot(bay);
title('Posterior Mean');
set(gca,'XTickLabel',N);
xlabel('N');
ylabel('Relative Error');

%  for c=1:10
%      %mk = zeros(100,2);
%      %mk(:,1) = ml(:,c);
%      %mk(:,2) = bay(:,c);
%      mk = zeros(10,1);
%      mk(c,1) = (median(ml(:,c)) < median(bay(:,c)));     %boxplot(mk);
% end
% mk