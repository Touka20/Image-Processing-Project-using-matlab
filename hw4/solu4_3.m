I=imread('a.jpeg');

%旋转90
I1=imrotate(I,-90);
checkface(I1);

%调整尺寸
I2=imresize(I,[size(I,1) 2*size(I,2)]);
checkface(I2);

%调整颜色
I3=imadjust(I,[.2 .3 0; .6 .7 1],[]);
checkface(I3);