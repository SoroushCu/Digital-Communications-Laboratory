function [b_gray] = gray_code(k)
    if k == 1
        b_gray = [0;1];
    else
        Zeros = zeros(2^(k-1), 1);
        Ones = ones(2^(k-1), 1);
        temp = gray_code(k-1);
        b_gray = [Zeros, temp; ...
                  Ones, temp(end:-1:1, :)];
    end
end
