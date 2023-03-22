clear; 
addpath('../hw2/');
load('../hall.mat');
load('JpegCoeff.mat');
info_image=dec2bin(hall_gray);%将像素值转为二进制码
info=randi([0 1],[size(info_image,1),1]);%随机引入待传输信息
info_image(:,8)=48+info;%将信息写入像素矩阵
info_image=bin2dec(info_image);%转回十进制
info_image=reshape(info_image,[size(hall_gray,1) size(hall_gray,2)]);
%变回原图像尺寸

c=zeros(8,8,315);
for i=1:1:15
    for j=1:1:21
        t=info_image(8*i-7:8*i,8*j-7:8*j);
        c(:,:,21*(i-1)+j)=round(dct2(t)./QTAB);
    end
end

m=zeros(64,315);
for i=1:1:315
    m(:,i)=zigzag(c(:,:,i));
end

cd_dif=zeros(1,315);
cd_dif(1)=m(1,1);
for i=2:1:315
    cd_dif(i)=m(1,i-1)-m(1,i);
end % 差分编码

DC_code=dc_code(cd_dif);%调用dc编码函数

AC_code=[];%用于存储AC编码的数组。

for i=1:1:size(m,2)
    code=ac_code(m(2:end,i));%ac编码
    AC_code=[AC_code code];
end

DC_decode=dc_decode(DC_code,21,15);
for i=2:1:length(DC_decode)
    DC_decode(i)=DC_decode(i-1)-DC_decode(i);
end%反差分
AC_decode=ac_decode(AC_code,21,15);
code=[DC_decode;AC_decode];
recover=uint8(zeros(120,168));

for i=1:1:15
    for j=1:1:21
        c=QTAB.*izigzag(code(:,21*(i-1)+j)); %反量化
        p=idct2(c); %逆离散余弦变换
        p=p+128;
        recover(8*i-7:8*i,8*j-7:8*j)=p; %安置这一像素块
    end
end

get_info=dec2bin(recover);
get_info=get_info(:,8);
get_info=get_info-48;

imshow(recover);
wucha=immse(get_info,info)
