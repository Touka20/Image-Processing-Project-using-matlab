function y = buma1(x)
    if(x>0)
        y=double(dec2bin(x))-48;
    elseif(x<0)
        y=49-double(dec2bin(-x));
    else
        y=[];
    end
end

