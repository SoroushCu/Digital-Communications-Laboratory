function [tx_smpl, cons] = pulse_modulation(sym_idx, modulation, M, fs, smpl_per_symbl, pulse_name , pulse_shape_mode, varargin)
[cons, Es_avg] = constellation(M, modulation);
[p, t] = pulse_shape(pulse_name, fs, smpl_per_symbl);
mod_sym = zeros(length(sym_idx),1);
for i=1:length(sym_idx)
    mod_sym(i) = cons(sym_idx(i)+1);   
end
if pulse_shape_mode=='kron'
    tx_smpl = kron(mod_sym,p);
else
    disp('Only Kron!')
end
end