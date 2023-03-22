function [DC_code,AC_code] = code(x)
%输入zigzag数组，输出DC、AC编码
H=size(x,1)/8;
W=size(x,2)/8;
cd_dif=zeros(1,H*W);
cd_dif(1)=x(1,1);
for i=2:1:H*W
    cd_dif(i)=x(1,i-1)-x(1,i);
end % 差分编码
DC_code=dc_code(cd_dif);%调用dc编码函数
AC_code=[];%用于存储AC编码的数组。
for i=1:1:size(x,2)
    code=ac_code(x(2:end,i));%ac编码
    AC_code=[AC_code code];
end
end

