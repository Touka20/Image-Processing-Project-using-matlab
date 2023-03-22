clear;
load('JpegCoeff.mat');
load('../hall.mat');
image=double(hall_gray(108:115,100:107));
C=dct2(image-128);
C2=dct2(image)-dct2(128*ones(8,8));





