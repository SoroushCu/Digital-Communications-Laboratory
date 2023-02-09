function [rx_sym] = corr_match(pkt_size,rx_smpl, p, smpl_per_symbl, rx_mode)
    if rx_mode==1
        %matched filter
        temp = conv(rx_smpl,p);
        r_index = (1:pkt_size)*smpl_per_symbl + 1;
        rx_sym = temp(r_index);
    elseif rx_mode ==2
        %Correlation
        rx_sym = zeros(pkt_size,1);
        for i=0:pkt_size-1
           temp_signal = rx_smpl(i*smpl_per_symbl + 1:smpl_per_symbl*(i+1));
           rx_sym(i+1) = sum(p.*temp_signal);
        end
    end
end