function y = dct_lh(x)
%DCT_LH 此处显示有关此函数的摘要
%   此处显示详细说明
load("JpegCoeff.mat");
W=ceil(size(x,2)/8);
H=ceil(size(x,1)/8);
extend=padarray(x,[H*8-size(x,1),W*8-size(x,2)],...
    "replicate","post");
extend=double(extend)-128;
y=zeros(8*H,8*W);
for i=1:1:H
    for j=1:1:W
        t=extend(8*i-7:8*i,8*j-7:8*j);
        y(8*i-7:8*i,8*j-7:8*j)=round(dct2(t)./QTAB);
    end
end
end

