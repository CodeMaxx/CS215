clear;
N = [5 10 20 40 60 80 100 500 1000 10000];
%defining the matrices for storing the errors
ml = zeros(100,10);
bay = zeros(100,10);
for k=1:10
for c = 1:100
X = rand(N(k),1);
%getting the data set
Y = -0.2*log(X);
%Calculating the errors and storing in the corresponding matrix
ml(c,k) = abs((N(k)/sum(Y)- 5)/5);
bay(c,k) = abs(((N(k) + 5.5)/(sum(Y)+1) - 5)/5);
end
end
%Plotting the graphs
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
