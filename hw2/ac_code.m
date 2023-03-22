function AC = ac_code(x)
load('JpegCoeff.mat');
idx=1:1:length(x);
notzero=(x~=0);
idx=idx(notzero);%idx存储非0系数的下标
if length(idx)>0 
    woc=idx(1);%第一个非0系数的run就是自己
    run=[woc diff(idx)]-1;%其余非0系数的run要对idx做差分-1
else run=[];
end
m=x(notzero);%m存储非0系数的值
Size=uint8(floor(log2(abs(m)))+1);%获取size
AC=[];
for i=1:1:length(idx)
    F_0=floor(run(i)/16);%ZRL个数
    rest_0=mod(run(i),16);%插完ZRL后还剩下多少个0
    L=ACTAB(rest_0*10+Size(i),3);%run/size的huffman编码长度
    r_s=[repmat([1 1 1 1 1 1 1 1 0 0 1],1,F_0),...
         ACTAB(rest_0*10+Size(i),4:L+3)];
    amp=buma1(m(i));%amplitude编码
    AC=[AC r_s amp];
end
AC=[AC 1 0 1 0];%接上EOF
end

