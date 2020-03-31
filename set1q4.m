clear all;
close all;
im=imread('pout.tif');
s=0;
[row,col]=size(im);
enimg=zeros(row,col);
for a=0:255
    b=(im==a);
    s=s+sum(b(:));
    su(a+1)=sum(b(:));
    out(a+1)=ceil(255*s/numel(im));  
    enimg=enimg+ out(a+1)*b;
end
l=uint8(enimg);
figure,subplot(2,2,1),imshow(im),title('Original Image');
subplot(2,2,2),imhist(im),title('Histogram of original image')
axis([0 300 0 4000])
subplot(2,2,3),imshow(l),title('After Histogram Equalization');
subplot(2,2,4),imhist(l),title('Histogram of histogram equalized image')
axis([0 300 0 4000])