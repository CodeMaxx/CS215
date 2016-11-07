clear;

fp_label = fopen('train-labels-idx1-ubyte','r');
magic_label = fread(fp_label, 1, 'int32', 0, 'ieee-be');
numLabels = fread(fp_label, 1, 'int32', 0, 'ieee-be');

labels = zeros(1,numLabels);
for i = 1:numLabels
labels(1,i) = fread(fp_label, 1, 'uchar', 0, 'ieee-be');
end

fp_image = fopen('train-images-idx3-ubyte','r');
magic_image = fread(fp_image, 1, 'int32', 0, 'ieee-be');

numImages = fread(fp_image, 1, 'int32', 0, 'ieee-be');
numRows = fread(fp_image, 1, 'int32', 0, 'ieee-be');
numCols = fread(fp_image, 1, 'int32', 0, 'ieee-be');

images = zeros(28, 28, numImages);
numbered_images = zeros(28,28,10); % Mean of matrices
image_num = zeros(1,10);

for i = 1:numImages
images(:,:,i) = fread(fp_image,[28 28],'uchar');
image_num(1,labels(1,i)+1) = image_num(1,labels(1,i) + 1) + 1;
numbered_images(:,:,labels(1,i)+1) = numbered_images(:,:,labels(1,i) + 1) + images(:,:,i);
end

fclose(fp_image);

for i = 1:10
   numbered_images(:,:,i) =  numbered_images(:,:,i)/image_num(1,i);
end

images_785 = reshape(images, [784 numImages]);
images_785 = [images_785; labels];
images_785 = images_785';
images_785 = sortrows(images_785, 785);
images_785 = images_785';

covar = zeros(28*28, 28*28, 10);

sumb = 1;
for i = 1:10
    covar(:,:,i) = cov(images_785(1:784, sumb:sumb + image_num(i) - 1)');
    sumb = sumb + image_num(i);
end

eigenvec = zeros(784,784,10);
eigenval = zeros(784,10);

for i=1:10
   [eigenvec(:,:,i),S] = eig(covar(:,:,i)); 
   eigenval(:,i) = diag(S);
end

max_eigenvec = zeros(784,10);
max_eigenval = zeros(1,10);

for i=1:10
    [j,index] = max(eigenval(:,i));
    max_eigenval(1,i) = j;
    max_eigenvec(:,i) = eigenvec(:,index, i);
    k = sort(eigenval(:,i));
    plot(1:784,k);
    print(strcat(strcat('plot',num2str(i-1)),'.png'),'-dpng');
end

num_modes = zeros(1,10);

for i=1:10
    num_modes(:,i) = sum(eigenval(:,i) > 10000);
end

meannum = reshape(numbered_images, [784 10]);

for i=1:10
    f = max_eigenval(1,i);
    plot1 = meannum(:,i) - sqrt(f)*max_eigenvec(:,i);
    plot2 = meannum(:,i);
    plot3 = meannum(:,i) + sqrt(f)*max_eigenvec(:,i);
    axis equal;
    subplot(1,3,1);
    imagesc(reshape(plot1,[28 28])');
    subplot(1,3,2);
    imagesc(reshape(plot2,[28 28])');
    subplot(1,3,3);
    imagesc(reshape(plot3,[28 28])');
    print(strcat(strcat('figure',num2str(i - 1)),'.png'),'-dpng');
end


