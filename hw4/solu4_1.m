clear;
file_path = 'Faces\';
img_path_list = dir(strcat(file_path,'*.bmp'));%在某文件夹中获取特定扩展名文件的方法
len=length(img_path_list);
L_choice=[3 4 5];
V=zeros(3,2^(3*5));

for k=1:1:3
    L=L_choice(k);
    u=zeros(1,2^(3*L));
    for i=1:1:len
        name=img_path_list(i).name;
        I=double(imread(strcat(file_path,name)));
        u=u+u_R(I,L);%u_R用于计算颜色特征矢量
    end
    V(k,1:2^(3*L))=u/len;
    subplot(3,1,k);
    plot(u/len);
end

save('V.mat','V');%将训练好的模型保存，以便后续使用