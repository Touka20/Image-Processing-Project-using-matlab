function AC = ac_decode(x,w,h)
%AC_DECODE 
%   x为ac码流 w为横向块数 h为纵向块数
load('JpegCoeff.mat');
ZRL=[1 1 1 1 1 1 1 1 0 0 1];
EOB=[1 0 1 0];

num=w*h;
AC=zeros(8*8-1,num);
ac_todo=x;
for j=1:1:num
    shit=[];
    while(~isequal(ac_todo(1:4),EOB))%判断是否遇到EOB终止符
        flag=true;    
        while(flag)%处理ZRL
                if(length(ac_todo)>=11)
                    if(ac_todo(1:11)==ZRL)    
                        shit=[shit zeros(1,16)];
                        ac_todo(1:11)=[];
                    else
                        flag=false;
                    end
                else 
                    break;
                end
         end      

        for i=1:1:size(ACTAB,1)%在ACTAB中匹配run/size编码
           L=ACTAB(i,3);
           if(L<=length(ac_todo))%ac_todo较短后，
               %下面的if语句可能索引超出数组长度(L过大)
               if(ac_todo(1:L)==ACTAB(i,4:L+3))
                   run=ACTAB(i,1);
                   Size=ACTAB(i,2);
                   ac_todo(1:L)=[];
                   amp=ac_todo(1:Size);
                   ac_todo(1:Size)=[];
                   shit=[shit zeros(1,run) ibuma1(amp)];
                   break;
               end
           end
        end
    end
    ac_todo(1:4)=[];
    shit=[shit zeros(1,63-length(shit))];
    AC(:,j)=shit';
end
end

