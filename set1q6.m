close all
clear all
im=imread('einstein.tif');
[row,col]=size(im);
a=double(im);
figure, subplot(1,3,1), imshow(im),title ('original image')

% Brightness
b=im+100;
b=uint8(b);
subplot(1,3,2),imshow(b),title ('Brightness Enhanced')

%contrast
alpha=.1;
beta=2;
gamma=.1;
low=80;
high=170;
out1=alpha*a.*(a<low);
out2=beta*(a-low).*(low<a<high)+out1;
out3=gamma*(a-high).*(high<a)+out2;
con=out1+out2+out3;
subplot(1,3,3),imshow(uint8(con)),title ('Contrast Enhanced')

%complement
im2=imread('mars_moon_phobos.tif');
figure, subplot(1,2,1), imshow(im2),title ('original image')
d=256-im2;
subplot(1,2,2),imshow(d),title ('Complement of  Image')

%binary contrast image
im3=imread('spot_shaded_text_image.tif');
figure, subplot(1,2,1), imshow(im3),title ('original image')
t=25;
e=255*(im3>t);
subplot(1,2,2),imshow(e),title ('Binary Image Enhancement')

%brightness slicing

im4=imread('kidney.tif');
figure, subplot(1,3,1), imshow(im4),title ('original image')
lo=180;
hi=250;
fst=(lo<im4);
lst=(im4<hi);
rng=(fst==lst);
f=rng*255;
subplot(1,3,2),imshow(uint8(f)),title ('Brightness Slicing without background')
fb=f+double(im4);
subplot(1,3,3),imshow(uint8(fb)),title('Brightness Slicing with background')

%lowpass filtering
im5=imread('cameraman.tif');
[row,col]=size(im5);
figure, subplot(1,2,1), imshow(im5),title ('original image')
lpf=zeros(row,col);
ws=11;
avg=ones(ws,ws)/(ws*ws);
pd=(ws-1)/2;
start=ws-pd;
f=padarray(im5,[pd pd],'replicate');
[r,c]=size(f);
for i=start:r-pd
    for j=start:c-pd
        window=f(i-pd:i+pd,j-pd:j+pd);
        su=0;        
        for s=1:ws
            for t=1:ws
                su=su+avg(s,t)*window(s,t);
            end
        end
        lpf(i-start+1,j-start+1)=su;
    end
end
out=lpf;
subplot(1,2,2),imshow(uint8(out)),title ('Low Pass Filtered Image')

%highpass filtering
im6=imread('blurry_moon.tif');
[row,col]=size(im6);
figure, subplot(1,2,1), imshow(im6),title ('original image')
im6=double(im6);
ws=3;
pd=(ws-1)/2;
lap=-1*ones(ws,ws);
lap(pd+1,pd+1)=-1*sum(lap(:));
start=ws-pd;
f=padarray(im6,[pd pd],'replicate');
[r,c]=size(f);
for i=start:r-pd
    for j=start:c-pd
        window=f(i-pd:i+pd,j-pd:j+pd);
        su=0;      
        for s=1:ws
            for t=1:ws
                su=su+lap(s,t)*window(s,t);
            end
        end
        hpf(i-start+1,j-start+1)=su;
    end
end
asd=uint8(hpf);
subplot(1,2,2),imshow(uint8(hpf)),title ('High Pass Filtered Image')


