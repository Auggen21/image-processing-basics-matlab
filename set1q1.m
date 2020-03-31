clc;
clear all;
close all;
i=imread('cameraman.tif');
subplot(1,2,1),imshow(i),title('Original Image')
details=imfinfo('cameraman.tif')
a=details.FileSize;
imwrite(i,'new.jpg');
new=imread('new.jpg');
subplot(1,2,2),imshow(new),title('Copied Image')
newdetails=imfinfo('new.jpg')
b=newdetails.FileSize;
c=a/b;
display('Compression ratio')
display(c)