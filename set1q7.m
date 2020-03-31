close all
clear all;

while 1 
ch=menu(' SELECT','1.SELECT IMAGE','2.TRANSLATION',' 3.ROTATION',' 4.SCALING',' 5. SKEWING',' 6.EXIT');
switch ch 

case 1
i=input('Enter the image name:');
im=imread(i);
im=double(im);
[row,col]=size(im);
figure,imshow(uint8(im)),title('Original Image')

%Translation
case 2
tx=input('Enter the translation in X direction:');
ty=input('Enter the translation in Y direction:');
T=[tx;ty];
out1=zeros(row+tx,col+ty);
for i=1:row
    for j=1:col
        P=[i;j];
        TP=ceil(T+P);
        out1(TP(1),TP(2))=im(i,j);    
    end
end
figure,imshow(uint8(out1)),title(['Translated Image with tx=',num2str(tx),',ty=',num2str(ty)])

%Rotation
case 3
degree=input('Enter the rotation angle in degree:');
angle=degree*pi/180;
R=[cos(angle) -sin(angle); sin(angle) cos(angle)];
for i=1:row
    for j=1:col
         P=[i;j];
         RP=R*P;
         RP=round(RP);
         first(i,j)=RP(1);
         second(i,j)=RP(2);                
    end
end
fmin=min(first(:));
smin=min(second(:));
first=first-fmin+2;
second=second-smin+2;
outsize1=max(first(:));
outsize2=max(second(:));
out2=256*ones(outsize1+1,outsize2+1);

for i=1:row
    for j=1:col
        a=first(i,j);
        b=second(i,j);
        out2(a,b)=im(i,j);
        out2(a-1,b)=im(i,j);
        out2(a+1,b)=im(i,j);
        out2(a,b-1)=im(i,j);
        out2(a,b+1)=im(i,j);
     end
end
figure,imshow(uint8(out2)),title(['Rotated Image with angle=',num2str(degree)]);

case 4
%Scaling

sx=input('Enter the scaling parameter in x:');
sy=input('Enter the scaling parameter in y:');
S=[sx 0;0 sy];
out3=256*ones(ceil(sx*row),ceil(sy*col));
for i=1:row
    for j=1:col
        P=[i;j];
        NS=ceil(S*P);
        out3(NS(1),NS(2))=im(i,j);       
    end
end

figure,imshow(uint8(out3)),title(['Scaled Image sx=',num2str(sx),',sy=',num2str(sy)]);


case 5
%skewing
skx=input('Enter the skewing parameter in x:');
sky=input('Enter the skewing parameter in y:');
SK=[1 skx;sky 1];
out4=256*ones(row+ceil(skx*col),col+ceil(sky*row));
for i=1:row
    for j=1:col
        P=[i;j];
        NSK=ceil(SK*P);
        out4(NSK(1),NSK(2))=im(i,j); 
    end
end
figure,imshow(uint8(out4)),title(['Skwed Image skx=',num2str(skx),',sky=',num2str(sky)]);
case 6 
close all
break;
end
end




