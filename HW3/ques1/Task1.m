clear
M = 100;
sigma_true = 4;
sigma_prior = 1;
mean_true = 10;
mean_prior = 10.5;
errors_ml = zeros(M,10);
errors_map1 = zeros(M,10);
errors_map2 = zeros(M,10);
iter1 = 1;
N = [5 10 20 40 60 80 100 500 1000 10000];
for j = 1:10
    for i = 1:M
        data = randn(N(j),1);
        data = data.*4 + 10;
        ml = mean(data);
        errors_ml(i,j) = abs((ml - mean_true)/mean_true);
        map_1 = (mean_prior*(sigma_true)^2/N(j) + ml*(sigma_prior)^2)/(sigma_true^2/N(j) + sigma_prior^2);
        errors_map1(i,j) = abs((map_1 - mean_true)/mean_true);
        map_2 = ml;
        if map_2 < 9.5
            map_2 = 9.5;
        elseif map_2 > 11.5
            map_2 = 11.5;
        end
        errors_map2(i,j) = abs((map_2 - mean_true)/mean_true);
    end
end
subplot(2,2,1);
boxplot(errors_ml);
title('Maximum Likelihood');
set(gca,'XTickLabel',N);
xlabel('N');
ylabel('Relative Error');
subplot(2,2,2);
boxplot(errors_map1);
title('MAP1');
set(gca,'XTickLabel',N);
xlabel('N');
ylabel('Relative Error');
subplot(2,2,3);
boxplot(errors_map2);
title('MAP2');
set(gca,'XTickLabel',N);
xlabel('N');
ylabel('Relative Error');