function [sym_idx] = sym_encoding(b_tx,flg_gray_encode)
    
    sz = size(b_tx);
    pkt_size = sz(1);
    k = sz(2);
    sample_per_symbl = 2^k;
    symbols = 0:sample_per_symbl-1;
    b_gray = gray_code(k);
    b_binary = de2bi(symbols,k,'left-msb');
    
    if flg_gray_encode == 1
       sym_idx = zeros(pkt_size,1);
       for i=1:length(b_tx)
            temp = b_tx(i,:);
            for j=0:length(b_gray)-1
                if b_gray(j+1,:) == temp
                   sym_idx(i) = j;
                   break;
                end
            end
       end
    end
    
    if flg_gray_encode == 0
       sym_idx = zeros(pkt_size,1);
       for i=1:length(b_tx)
            temp = b_tx(i,:);
            for j=0:length(b_binary)-1
                if b_binary(j+1,:) == temp
                   sym_idx(i) = j;
                   break;
                end
            end
       end
    end

end