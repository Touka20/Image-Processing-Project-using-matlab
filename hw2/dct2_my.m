function C = dct2_my(x)
%DCT2_MY 自己实现的二维DCT函数
N=size(x,1);
A=zeros(N)+[0:N-1]';
B=zeros(N);
B(1,:)=1:2:2*N-1;

D=sqrt(2/N)*cos(A*B*pi/2/N);
D(1,:)=sqrt(1/N);

C=D*double(x)*D';
end

