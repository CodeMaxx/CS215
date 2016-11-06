clear;
clc;
rng(0);
c =  [1.6250, -1.9486 ; -1.986, 3.8750]; 
[v,d] = eig(c);
d = sqrt(d);
a = v*d;
N = [10,10^2,10^3,10^4,10^5];
mean_errors = zeros(100,5);
covar_errors = zeros(100,5);
e = zeros(2);
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
        e = eig(covariance);
        sample_covar = [var_x , covariance; covariance, var_y];
        mean_error = sqrt((sample_mean_x - 1)^2 + (sample_mean_y - 2)^2)/(sqrt(1^2 + 2^2));
        covar_error = sqrt(trace((c - sample_covar)'*(c - sample_covar)))/sqrt(trace((c)'*(c)));
        mean_errors(i,log10(N)) = mean_error;
        covar_errors(i,log10(N)) = covar_error;
    end    
end
for N = [10,10^2,10^3,10^4,10^5]
        figure;
        w = randn(2,N);
        x = a*w ;
        x(1,:) = x(1,:) + 1;
        x(2,:) = x(2,:) + 2;
        covariance = sum((x(1,:) - 1).*(x(2,:) - 2))/N;
        var_x = var(x(1,:));
        var_y = var(x(2,:));
        sample_covar = [var_x , covariance; covariance, var_y];
        [v,d] = eig(sample_covar);
        scatter(x(1,:),x(2,:)); 
        hold on;
        plot([1,1+d(1,1)*v(1,1)],[2,2+d(1,1)*v(2,1)],'r','LineWidth',2);                                  
        plot([1,1+d(2,2)*v(1,2)],[2,2+d(2,2)*v(2,2)],'r','LineWidth',2);
        xlabel('X');
        ylabel('Y');
        title(strcat('N = ',int2str(N)));
        print(strcat(num2str(N),'.png'),'-dpng');
end

figure;
subplot(2,1,1);
boxplot(mean_errors);
xlabel('log(N)');
title('Error in Mean');
subplot(2,1,2);
boxplot(covar_errors);
xlabel('log(N)');
title('Error in Covariance Matrix');
print('relativeError.png','-dpng');
