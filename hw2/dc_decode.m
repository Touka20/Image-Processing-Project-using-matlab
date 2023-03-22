function DC = dc_decode(x,w,h)
%dc_decode
%   x为dc码流 w为横向块数 h为纵向块数
load('JpegCoeff.mat');
DC=[];
dc_todo=x;%用于存储尚未解码的部分
while ~isempty(dc_todo)
    for i=1:1:size(DCTAB,1)%在DCTAB中查找dc_todo最前面的huffman编码
        L=DCTAB(i,1);
        if(dc_todo(1:L)==DCTAB(i,2:L+1))
            category=i-1;
            dc_todo(1:L)=[];%将已经解码的category从dc_todo中删掉
            break;
        end
    end
    mag=dc_todo(1:category);
    dc_todo(1:category)=[];%将已经解码的magnitude从dc_todo中删除
    DC=[DC ibuma1(mag)];%由补码得到十进制数并拼接
end
end

