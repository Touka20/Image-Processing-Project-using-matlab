function m= info_hide3(x,m)
% x为待隐藏的信息
% m为zigzag后的数组（每一列是某块的zigzag矢量）
for i=1:1:size(m,2)
    z=1:1:size(m,1);
    no0=m(:,i)~=0;
    z=z(no0);
    if(m(end,i)~=0)%如果最后一位非零，则将信息放在最后一位
        m(end,i)=x(i);
    else
        m(z(end)+1,i)=x(i);%否则追加在最后一个非零位后面
    end
end

