function [det_sym] = min_dist_detector(rx_sym, constellation)
    det_sym = zeros(length(rx_sym),1);
    for i=1:length(rx_sym)
       symbol = rx_sym(i);
       distance = abs(constellation - symbol);
       [~,det_sym(i)] = min(distance); 
    end
end