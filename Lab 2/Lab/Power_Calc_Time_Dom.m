function Power_Calc_Time_Dom(A,N,f0)
    fs = 250e6;
    n = 0:N-1;
    x= A*exp(1i*2*pi*f0*(1/fs).*n);
    Pow = rms(x).^2;
    disp('Power calculated in time domain :');
    disp(Pow);
end