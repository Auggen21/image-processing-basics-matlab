clc;
clear all;
close all;
a=imread('cameraman.tif');
j = imadjust(a,[0 1],[1 0]);
figure;
subplot(1,2,1);
imshow(a);title('Original Image')
subplot(1,2,2);
imshow(j);title('Negative Image')