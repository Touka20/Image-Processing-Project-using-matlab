function DC = dc_code(x)
%DC_CODE 

load('JpegCoeff.mat');
DC=[];
Cat=uint8(floor(log2(abs(x)))+1);
for i=1:1:length(x)
    category=Cat(i);
    L=DCTAB(category+1,1);
    mag=buma1(x(i));
    DC=[DC DCTAB(category+1,2:L+1) mag];
end
end

