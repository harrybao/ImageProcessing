RGB = imread('autumn.tif');
I = rgb2gray(RGB);
figure(1);
imshow(I);
J = dct2(I);
figure(2);
imshow(log(abs(J)),[]), colormap(jet(64)), colorbar
