function y = info_get2(c)
%INFO_GET1 
h=size(c,1);
w=size(c,2);
y=zeros(ceil(h/2),ceil(w/2));
for i=1:2:h
    for j=1:2:w
        m=ceil(i/2);
        n=ceil(j/2);
        bin=buma1(c(i,j));
        if(isempty(bin))
            y(m,n)=0;
        else 
            y(m,n)=bin(end);
        end
    end
end

