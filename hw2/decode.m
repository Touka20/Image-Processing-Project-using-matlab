function y = decode(DC_code,AC_code,W,H)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

load('JpegCoeff.mat');
DC_decode=dc_decode(DC_code,W,H);
for i=2:1:length(DC_decode)
    DC_decode(i)=DC_decode(i-1)-DC_decode(i);
end%反差分
AC_decode=ac_decode(AC_code,W,H);
code=[DC_decode;AC_decode];
y=zeros(8*H,8*W);
for i=1:1:H
    for j=1:1:W
        c=QTAB.*izigzag(code(:,W*(i-1)+j));%反量化
        p=idct2(c);%逆离散余弦变换
        p=p+128;
        y(8*i-7:8*i,8*j-7:8*j)=p;%安置这一像素块
    end
end
end

