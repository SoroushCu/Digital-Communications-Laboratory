function [X] = corr_spctrm(x, n_psd)
%Here we shall implement the fft exactly as depicted in the DSP with MATLAB
%help given in the lab instructions.
r_kpos = zeros(1,n_psd);
 for k=1:n_psd-1
    % We create Temp Column wise due to our preference to work with columns
    % in communications.
    Temp = zeros(n_psd-k,1);
    %Now we go on to create r for positive indiced values
    for n=k+1:n_psd
        Temp(n-k) = x(n)*conj(x(n-k));
    end
    r_kpos(k)=(1/n_psd)*sum(Temp(n-k));
 end
rforkzero=1/n_psd*x(n)*conj(x(n));
r=[rforkzero r_kpos];
X = fftshift(fft(r,n_psd));
end