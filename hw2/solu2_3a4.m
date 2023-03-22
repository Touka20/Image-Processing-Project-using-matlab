clear;
load('../hall.mat');
image=double(hall_gray(108:115,100:107));
C=dct2(image-128);

right=C;
right(:,5:8)=0;
left=C;
left(:,1:4)=0;
tp=C';
r90=rot90(C,1);
r180=rot90(C,2);

subplot(2,3,1);
imshow(getp(right));
title('colomns on the right set to 0');
subplot(2,3,2);
imshow(getp(left));
title('left');
subplot(2,3,3);
imshow(getp(tp));
title('transposition');
subplot(2,3,4);
imshow(getp(r90));
title('rot90°')
subplot(2,3,5);
imshow(getp(r180));
title('rot180°')
subplot(2,3,6);
imshow(uint8(image));
title('original');
