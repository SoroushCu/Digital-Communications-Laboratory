function [det_sym_idx, rx_sym] = pulse_demodulation(pkt_size,rx_smpl, modulation, M, fs, smpl_per_symbl, pulse_name , rx_mode, varargin)
    [p, t] = pulse_shape(pulse_name, fs, smpl_per_symbl);
    [rx_sym] = corr_match(pkt_size,rx_smpl, p, smpl_per_symbl, rx_mode);
    [cons, Es_avg] = constellation(M, modulation);
    [det_sym_idx] = min_dist_detector(rx_sym, cons);
    det_sym_idx =  det_sym_idx - 1;
end