 I=imread('timg.jpg');
I=im2double(I);
T=dctmtx(8);
B=blkproc(I,[8 8],'P1*x*P2',T,T');
mask=[1 1 1 1 1 1 1 1  
         1 1 1 1 1 1 1 1  
         1 1 1 1 1 1 1 1  
         1 1 1 1 1 1 1 1  
         1 1 1 1 1 1 1 0  
         1 1 1 1 1 1 1 1  
         1 1 1 1 1 1 1 1  
         1 1 1 1 1 1 1 1 ];
B2=blkproc(B,[8 8],'P1.*x',mask);
I2=blkproc(B2,[8 8],'P1*x*P2',T',T);
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(I2);
