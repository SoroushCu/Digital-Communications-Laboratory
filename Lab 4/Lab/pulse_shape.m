function [p, t] = pulse_shape(pulse_name, fs, smpl_per_symbl)
% This function generate pulse shaping filters.
% smpl_per_symbl: Samples per Symbol
% fs            : Baseband Sampling Frequency

% 'pulse_name' Options:  
%      rectangular
%      triangular
%      sine
%      raised_cosine
%      root_raised_cosine
%      gaussian

% For 'raised_cosine', 'root_raised_cosine', 'gaussian' two excess options is required
%      'beta'                 : rollof factor.
%      'span_in_symbl'        : the truncated interval of pulse

ts = 1/fs;              % Baseband Sampling Period
Ts = smpl_per_symbl*ts; % Pulse Duration
pulse_name = lower(pulse_name);
if nargin == 3
    t = (0:smpl_per_symbl-1)' * ts;
    switch pulse_name
        case 'rectangular'
            p = ones(smpl_per_symbl, 1);
        case 'triangular'
            p = max( Ts/2 - abs(t-Ts/2) , 0);
    end
end
Ep = abs(p' * p);
p = p / sqrt(Ep);