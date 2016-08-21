clear;clc;
x = (-10:0.02:10);
y = 5*sin(2*x+pi/3);
k = randperm(1001);
k = k(1:40);
z = y;
for elm = k
    z(elm) = z(elm) + 100 + 20*rand(1);
end

y_median = zeros(1,1001);
y_mean = zeros(1,1001);

for elm = (1:1001)
    y_median(elm) = median(z(max(1,elm-8):min(elm+8,1001)));
end

for elm = (1:1001)
    y_mean(elm) = mean(z(max(1,elm-8):min(elm+8,1001)));
end

plot(x,z);
plot(x,y_mean);
plot(x,y_median);
plot(x,y,'r',x,z,'g',x,y_mean,'m',x,y_median,'b');
legend('Original', 'Corrupt Wave', 'Moving mean filtering', 'Moving median filtering');
xlabel('x','FontSize',15);
ylabel('y','FontSize',15);
rel_median_sq_error = sum((y - y_median).^2)/sum(y.^2)
rel_mean_sq_error = sum((y - y_mean).^2)/sum(y.^2)

