clear;
load("../hall.mat");
load("../JpegCoeff.mat");

W=ceil(size(hall_gray,2)/8);
H=ceil(size(hall_gray,1)/8);

extend=padarray(hall_gray,[H*8-size(hall_gray,1),W*8-size(hall_gray,2)],...
   "replicate","post");

extend=double(extend)-128;
c=zeros(8,8,H*W);
for i=1:1:H
    for j=1:1:W
        t=extend(8*i-7:8*i,8*j-7:8*j);
        c(:,:,W*(i-1)+j)=round(dct2(t)./QTAB);
    end
end

m=zeros(64,H*W);
for i=1:1:H*W
    m(:,i)=zigzag(c(:,:,i));
end

cd_dif=zeros(1,H*W);
cd_dif(1)=m(1,1);
for i=2:1:H*W
    cd_dif(i)=m(1,i-1)-m(1,i);
end % 差分编码

DC_code=dc_code(cd_dif);%调用dc编码函数

AC_code=[];%用于存储AC编码的数组。

for i=1:1:size(m,2)
    code=ac_code(m(2:end,i));%ac编码
    AC_code=[AC_code code];
end