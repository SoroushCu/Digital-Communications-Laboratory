function Y = conv_m(x, h)
%First of all we need to form the X and H vectors, we must pay attention to
%swap the lengths of h and x when initializing X and H
    X = [x, zeros(1, length(h))]; 
    H = [h, zeros(1, length(x))];
    %For brevity we define leny
    leny=length(x) + length(h) - 1;
    Y = zeros(1,leny); 
    %Here we go on to perform the convolution as it is defined.
    for i = 1 : leny
        for j = 1 : length(x)
            if (i - j + 1 > 0)
                Y(i) = Y(i) + X (j) * H(i - j + 1); 
            end
        end
    end
end