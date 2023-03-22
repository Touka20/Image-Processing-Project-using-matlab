clear; 
addpath('../hw2/');
load('../hall.mat');
W=ceil(size(hall_gray,2)/8);
H=ceil(size(hall_gray,1)/8);
error=zeros(1,3);
compress_rate=zeros(1,3);
PYNR=zeros(1,3);
c=dct_lh(hall_gray);%量化后矩阵
for k=1:1:10
info1=randi([0 1],H*8,W*8);
info2=randi([0 1],H*4,W*4);
info3=randi([0 1],1,H*W);

%method1
%信源隐藏信息、进行编码
y1=info_hide1(info1,c);
m1=zeros(64,H*W);
for i=1:1:H
    for j=1:1:W
        m1(:,(i-1)*W+j)=zigzag(y1(8*i-7:8*i,8*j-7:8*j)); 
    end
end

[DC_code_m1,AC_code_m1]=code(m1);
%信宿解码、寻找信息
ima1=decode(DC_code_m1,AC_code_m1,W,H);
c1=dct_lh(ima1);
y1_=info_get1(c1);

error(1)=error(1)+immse(y1_,info1);
compress_rate(1)=...
compress_rate(1)+120*168*8/(length(DC_code_m1)+length(AC_code_m1));
PYNR(1)=PYNR(1)+10*log10(255^2/immse(hall_gray,uint8(ima1)));

%method2
%信源隐藏信息、进行编码
y2=info_hide2(info2,c);
m2=zeros(64,H*W);
for i=1:1:H
    for j=1:1:W
        m2(:,(i-1)*W+j)=zigzag(y2(8*i-7:8*i,8*j-7:8*j)); 
    end
end
[DC_code_m2,AC_code_m2]=code(m2);
%信宿解码、寻找信息
ima2=decode(DC_code_m2,AC_code_m2,W,H);
c2=dct_lh(ima2);
y2_=info_get2(c2);
error(2)=error(2)+immse(y2_,info2);
compress_rate(2)=...
compress_rate(2)+120*168*8/(length(DC_code_m2)+length(AC_code_m2));
PYNR(2)=PYNR(2)+10*log10(255^2/immse(hall_gray,uint8(ima2)));

%method3
%信源隐藏信息、进行编码
idx=info3==0;
info3(idx)=-1;
m3=zeros(64,H*W);
for i=1:1:H
    for j=1:1:W
        m3(:,(i-1)*W+j)=zigzag(c(8*i-7:8*i,8*j-7:8*j)); 
    end
end

m3=info_hide3(info3,m3);
[DC_code_m3,AC_code_m3]=code(m3);
%信宿收到编码、解码、寻找信息
ima3=decode(DC_code_m3,AC_code_m3,W,H);
c3=dct_lh(ima3);
getm3_zigzag=zeros(64,H*W);
for i=1:1:H
    for j=1:1:W
        getm3_zigzag(:,(i-1)*W+j)=zigzag(c3(8*i-7:8*i,8*j-7:8*j)); 
    end
end
compress_rate(3)=...
compress_rate(3)+120*168*8/(length(DC_code_m3)+length(AC_code_m3));
PYNR(3)=PYNR(3)+10*log10(255^2/immse(hall_gray,uint8(ima3)));
y3_=info_get3(getm3_zigzag);
error(3)=error(3)+immse(y3_,info3)/4;
end

error=error/10
PYNR=PYNR/10
compress_rate=compress_rate/10
subplot(2,2,1);
imshow(uint8(ima1));
title('m1');
subplot(2,2,2);
imshow(uint8(ima2));
title('m2');
subplot(2,2,3);
imshow(uint8(ima3));
title('m3');
subplot(2,2,4);
imshow(hall_gray);
title('hall\_gray');