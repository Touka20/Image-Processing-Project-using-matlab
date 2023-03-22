function y = idct_lh(c)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
load('JpegCoeff.mat');
y=zeros(120,168);
for i=1:1:15
    for j=1:1:21
        sb=QTAB.*c(8*i-7:8*i,8*j-7:8*j);%反量化
        p=idct2(sb);%逆离散余弦变换
        p=p+128;
        y(8*i-7:8*i,8*j-7:8*j)=p;%安置这一像素块
    end
end

