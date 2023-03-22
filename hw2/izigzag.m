function M = izigzag(x)
%IZIGZAG
N=sqrt(length(x));
M=zeros(N,N);
x_=rot90(x,2);
for i=1:2:N
    idx=i*(i-1)/2;
    for j=1:1:i
        M(i+1-j,j)=x(idx+j);
    end
end

for i=2:2:N
    idx=i*(i-1)/2;
    for j=1:1:i
        M(j,i+1-j)=x(idx+j);
    end
end

M=rot90(M,2);

for i=1:2:N-1
    idx=i*(i-1)/2;
    for j=1:1:i
        M(i+1-j,j)=x_(idx+j);
    end
end

for i=2:2:N-1
    idx=i*(i-1)/2;
    for j=1:1:i
        M(j,i+1-j)=x_(idx+j);
    end
end

M=rot90(M,2);
end

