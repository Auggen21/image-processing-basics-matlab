clear all;
close all;
of=imread('embedded_square_noisy_512.tif');
f=double(of);
ws=7;
pd=(ws-1)/2;
start=ws-pd;
f=padarray(f,[pd pd]);
[row,col]=size(f);
for i=start:ws:row-pd
    for j=start:ws:col-pd
        im=f(i-pd:i+pd,j-pd:j+pd);
        s=0;
        enimg=zeros(ws,ws);
        for a=1:256           
            b=(im==a);                                  
            s=s+sum(b(:));
            out(a)=ceil(255*s/(ws*ws));        
            enimg=enimg+ out(a)*b;
        end           
        outres(i-start+1:i-start+ws,j-start+1:j-start+ws)=enimg;
    end    
end
outres=uint8(outres);
figure,subplot(1,2,1),imshow(of),title('Original Image');
subplot(1,2,2),imshow(outres),title('After Local Histogram Equalization');
