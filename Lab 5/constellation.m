function [cons, Es_avg] = constellation(M, modulation)
modulation = lower(modulation);
switch modulation
    case 'pam'
        cons = (-(M-1):2:(M-1))';
        cons = cons/sqrt(abs(cons'*cons)/M);
        Es_avg = abs(cons'*cons)/M;
    case 'psk'
        s_i = cos(2*pi/M*(0:(M-1)))';
        s_q = sin(2*pi/M*(0:(M-1)))';
        cons = complex(s_i, s_q);
        cons = cons/sqrt(abs(cons'*cons)/M);
        Es_avg = abs(cons'*cons)/M;

        cons = cons(:);
        cons = cons/sqrt(abs(cons'*cons)/M);
        Es_avg = abs(cons'*cons)/M;
    case 'qam'
         if mod(log2(M),2)==0
             m1 = log2(M)/2;
             m2 = m1;
             v1 = 1j* (-sqrt(M)+1:2:sqrt(M)-1).';
             v2 = (-sqrt(M)+1:2:sqrt(M)-1).';
        else
             m1 = floor(log2(M)/2);
             m2 = log2(M)-m1;
             v1 = 1j* (-2^m1 + 1:2:2^m1-1).';
             v2 = (-2^m1 + 1:2:2^m1-1).';
        end
        cons = ones(M,1);
        for k = 1 : 2^m2
            if mod(k,2) ==0
                cons(2^m1 * (k-1) + 1:2^m1 * k,1) = v1 + v2(k);
            else
                cons(2^m1 * (k-1) + 1:2^m1 * k,1) = flip(v1) + v2(k); 
            end
        end
        Es_avg = sum(abs(cons).^2)/M;
        cons = cons / sqrt(Es_avg);
        Es_avg = sum(abs(cons).^2)/M;
end

