f=zeros(300,300);
f(5:24,13:17)=1;
figure(1)
imshow(f,'InitialMagnification','fit');
F=fft2(f,256,256);
F2=fftshift(F);
figure(2)
imshow(F2,[-1 5],'InitialMagnification','fit');
colormap(jet);
