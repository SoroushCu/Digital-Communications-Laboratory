function [p,t] = pulse_shape(pulse_name, fs, smpl_per_symbl, varargin)
    Ts = smpl_per_symbl*(1/fs);
    t = 0 : 1/fs : Ts;   
    if pulse_name == "triangular"
        p = zeros(1, smpl_per_symbl + 1);
        for i = 1 : smpl_per_symbl + 1
            p(i) = max(Ts/2-abs((i-1)/fs-Ts/2),0);
        end
        p = (1/sqrt(sum(p.^2)))*p;
    end    
end