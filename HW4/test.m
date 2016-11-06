rng(0)
c =  [1.6250, -1.9486 ; -1.986, 3.8750]; 
a1 = sqrt(c(1,1));
a2 = sqrt(c(2,2) - c(1,2)^2/c(1,1));
a  = [a1, 0 ; c(1,2)/a1, a2];
N = [10,10^2,10^3,10^4,10^5];
mean_errors = zeros(100,5);
covar_errors = zeros(100,5);
for N = [10,10^2,10^3,10^4,10^5]
    for i = 1:100
        w = randn(2,N);
        x = a*w ;
        x(1,:) = x(1,:) + 1;
        x(2,:) = x(2,:) + 2;
        sample_mean_x = sum(x(1,:))/N;
        sample_mean_y = sum(x(2,:))/N;
        var_x = var(x(1,:));
        var_y = var(x(2,:));
        covariance = sum((x(1,:) - 1).*(x(2,:) - 2))/N;
        sample_covar = [var_x , covariance; covariance, var_y];
        mean_error = sqrt((sample_mean_x - 1)^2 + (sample_mean_y - 2)^2)/(sqrt(1^2 + 2^2));
        covar_error = sqrt(trace((c - sample_covar)'*(c - sample_covar)))/sqrt(trace((c)'*(c)));
        mean_errors(i,log10(N)) = mean_error;
        covar_errors(i,log10(N)) = covar_error;
    end    
end
subplot(2,1,1) 
boxplot(mean_errors);
title('Error in mean');
xlabel('log(N)');
ylabel('Relative Error');
subplot(2,1,2)
boxplot(covar_errors);
title('Error in Covariance');
xlabel('log(N)');
ylabel('Relative Error');
