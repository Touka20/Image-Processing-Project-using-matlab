function u = u_R(I,L)
I=double(I);
[h,w,~]=size(I);
u=zeros(1,2^(3*L));
RGB=floor(I/(2^(8-L)));
p=RGB(:,:,1)*2^(2*L)+...
  RGB(:,:,2)*2^(L)+...
  RGB(:,:,3);
for i=1:1:h*w
   u(p(i)+1)=u(p(i)+1)+1;
end

%for i=1:1:2^(3*L)
    %u(i)=sum(p==i-1,'all');
%end

u=u/(h*w);
end