function [r] = corr_m(x,y)
    n_x = length(x);
    n_y = length(y);
    if n_y >= n_x 
        l = n_y - n_x + 1;
        maxsig=y;
        minsig=x;
        maxlen=n_y;
        minlen=n_x;
    else 
        l = n_x - n_y + 1;
        maxsig=x;
        minsig=y;
        maxlen=n_x;
        minlen=n_y;
    end
    r = zeros(1,l);
    for i = 1: l
        r(i) = sum(minsig.* conj(maxsig(i: i+minlen -1)));
    end
    plot(1:l ,r )
end