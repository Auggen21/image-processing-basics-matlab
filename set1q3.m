clear all;
close all;
i=imread('cameraman.tif');
for a=0:255
    b=(i==a);
    d(a+1)=sum(b(:));
end
figure,subplot(2,1,1),bar(d)
title('Histogram without using inbuilt function'),axis([0 300 0 2000])
subplot(2,1,2),imhist(i),
title('Histogram using inbuilt function'),axis([0 300 0 2000])


