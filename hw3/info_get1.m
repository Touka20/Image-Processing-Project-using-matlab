function y = info_get1(c)
% 输入为量化后的DCT系数矩阵 输出y为信息
h=size(c,1);
w=size(c,2);
y=zeros(h,w);
for i=1:1:h
    for j=1:1:w
        bin=buma1(c(i,j));
        if(isempty(bin))
            y(i,j)=0;
        else 
            y(i,j)=bin(end);
        end
    end
end

