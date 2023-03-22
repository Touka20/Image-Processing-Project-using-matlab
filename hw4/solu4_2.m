load('V.mat');%已经训练好的人脸特征矢量（L=3、4、5）
I=imread('a.jpeg');
[H,W,~]=size(I);
window=20;%每次检测的窗格大小
step=3;%窗格移动的步长
formatSpec = "L=%d";

for k=3:1:5   
    window=20+k;
    face=false(H,W);
    for i=1:step:H+1-window
        for j=1:step:W+1-window
            img=I(i:i+window-1,j:j+window-1,:);
            u=u_R(img,k);%提取特征
            err=dis(u,V(k-2,1:2^(3*k)));%计算距离
            if(err<0.6+0.03*k)
                face(i:i+window-1,j:j+window-1)=true;
            end
        end
    end

[L,n]=bwlabel(face);%连通分量标签和个数
face=false(H,W);%

for i=1:1:n
    [r,c]=find(L==i);
    min_row=min(r);
    max_row=max(r);
    y=max_row-min_row;
    min_col=min(c);
    max_col=max(c);
    x=max_col-min_col;
   face(min_row:floor(min_row+y*0.02),min_col:max_col)=true;
   face(ceil(max_row-y*0.02):max_row,min_col:max_col)=true;
   face(min_row:max_row,min_col:floor(min_col+x*0.02))=true;
   face(min_row:max_row,ceil(max_col-x*0.02:max_col))=true;%边界设为1，一会儿画线
end

face=cat(3,face,false(H,W),false(H,W));
P=I;
P(face)=255;

subplot(2,2,k-2);
imshow(P);
title(sprintf(formatSpec,k),'FontSize',20);
end

