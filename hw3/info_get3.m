function info = info_get3(m)
info=zeros(1,size(m,2));
idx=m~=0;
for i=1:1:size(m,2)
    lie=m(idx(:,i),i);
    info(i)=lie(end);  
end