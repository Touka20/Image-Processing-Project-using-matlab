clear;
load('jpegcodes.mat');
load('JpegCoeff.mat');
W=ceil(width/8);
H=ceil(height/8);
DC_decode=dc_decode(DC_code,ceil(width/8),ceil(height/8));

for i=2:1:length(DC_decode)
    DC_decode(i)=DC_decode(i-1)-DC_decode(i);
end%反差分

AC_decode=ac_decode(AC_code,ceil(width/8),ceil(height/8));

code=[DC_decode;AC_decode];
recover=uint8(zeros(height,width));

for i=1:1:H
    for j=1:1:W
        c=QTAB.*izigzag(code(:,W*(i-1)+j));%反量化
        p=idct2(c);%逆离散余弦变换
        p=p+128;
        recover(8*i-7:8*i,8*j-7:8*j)=p;%安置这一像素块
    end
end


load('../hall.mat');
image_initial=padarray(hall_gray,[H*8-size(hall_gray,1),W*8-size(hall_gray,2)],...
    "replicate","post");

mse=immse(image_initial,recover);
PSNR=10*log10(255^2/mse)

subplot(1,2,1);
imshow(image_initial);
title('原图');
subplot(1,2,2);
imshow(recover);
title('解编码后');