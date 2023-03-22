function y = info_hide2(x,c)
%INFO_HIDE1 此处显示有关此函数的摘要
%   此处显示详细说明
h=size(c,1);
w=size(c,2);
y=c;
for i=1:2:h
    for j=1:2:w
        m=floor(i/2)+1;
        n=floor(j/2)+1;
        bin=buma1(c(i,j));
        if(isempty(bin))
            if(x(m,n)==1)
               bin=1;
            else bin=[];
            end
        else
            bin(end)=x(m,n);           
        end
        y(i,j)=ibuma1(bin);
    end
end

