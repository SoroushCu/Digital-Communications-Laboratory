function [cons, Es_avg] = constellation(M, modulation)
if strcmp(modulation, 'pam')
    Es_avg = (M^2 - 1)/3;
    cons = (-M+1:2:M-1).'/ sqrt(Es_avg);
Es_avg = 1;
end