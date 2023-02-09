function  Power_Calc_Freq_Dom(A,N,f0)
    fs = 250e6;
    n = 0:N-1;
    x= A*exp(1i*2*pi*f0*(1/fs).*n);
    Xf=fftshift(fft(x,N));
    X = abs(Xf).^2;
    Pow=sum(X/length(x).^2);
     disp('Power calculated in frequency domain :');
    disp(Pow);

end