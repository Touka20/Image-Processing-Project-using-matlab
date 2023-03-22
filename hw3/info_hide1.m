function y = info_hide1(x,c)
% x是待隐藏的信息 c是量化后的DCT系数
h=size(c,1);
w=size(c,2);
y=zeros(h,w);%用于存储加入隐藏信息的DCT系数，作为返回值
for i=1:1:h
    for j=1:1:w
        bin=buma1(c(i,j));
        if(isempty(bin))
            if(x(i,j)==1)
               bin=1;
            else bin=[];
            end
        else
            bin(end)=x(i,j);           
        end
        y(i,j)=ibuma1(bin);
    end
end

