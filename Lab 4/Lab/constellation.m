function [cons, Es_avg] = constellation(M, modulation)
modulation = lower(modulation);
switch modulation
    case 'pam'
        cons = (-(M-1):2:(M-1))';
        cons = cons/sqrt(abs(cons'*cons)/M);
        Es_avg = abs(cons'*cons)/M;
end
end

