%运行此程序前请先运行solu2_8

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

height=H*8;width=W*8;
save('jpegcodes.mat','DC_code','AC_code','height','width');%保存结果
