function num = ibuma1(buma)
%IBUMA1 此处显示有关此函数的摘要
%   此处显示详细说明
if(isempty(buma))
    num=0;
elseif(buma(1)==1)
    num=bin2dec(num2str(buma));
else
    num=-bin2dec(num2str(1-buma));
end

