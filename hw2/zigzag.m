function y = zigzag(x)
%ZIGZAG 自己完成的zigzag扫描算法
N=length(x);
y1=zeros(1,N*(N+1)/2);
y2=zeros(1,(N-1)*N/2);
x_=rot90(x,2);

for i=1:2:N
    idx=i*(i-1)/2;
    for j=1:1:i
        y1(idx+j)=x(i+1-j,j);
    end
end

for i=2:2:N
    idx=i*(i-1)/2;
    for j=1:1:i
        y1(idx+j)=x(j,i+1-j);
    end
end
%前半程扫描结束
for i=1:2:N-1
    idx=i*(i-1)/2;
    for j=1:1:i
        y2(idx+j)=x_(i+1-j,j);
    end
end

for i=2:2:N-1
    idx=i*(i-1)/2;
    for j=1:1:i
        y2(idx+j)=x_(j,i+1-j);
    end
end
%后半程扫描结束
y=[y1,rot90(y2,2)]';%拼接

end

