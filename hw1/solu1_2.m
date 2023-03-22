clear;
load('../hall.mat');
w=size(hall_color,2);
h=size(hall_color,1);
x=repmat([1:w],h,1);%横坐标矩阵
y=repmat([1:h]',1,w);%纵坐标矩阵

circle=hall_color;
r=min(w/2,h/2);
if_red=(x-w/2).^2+(y-h/2).^2<=r*r&(x-w/2).^2+(y-h/2).^2>=0.9*r*r;
draw_red=cat(3,if_red,false(h,w),false(h,w));
draw_gb=cat(3,false(h,w),if_red,if_red);
circle(draw_red)=255;
circle(draw_gb)=0;
figure;imshow(circle);

chessboard=hall_color;
if_black=mod(floor(x/8)+floor(y/8),2)==0;
draw_black=cat(3,if_black,if_black,if_black);
chessboard(draw_black)=0;
figure;imshow(chessboard);
imwrite(circle,'circle.png');
imwrite(chessboard,'chessboard.png');

