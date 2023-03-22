clear;
load('jpegcodes.mat');
input_l=height*width*8;
output_l=length(DC_code)+length(AC_code);
rate=input_l/output_l