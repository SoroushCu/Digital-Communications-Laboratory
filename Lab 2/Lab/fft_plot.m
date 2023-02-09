function  fft_plot(A,N,f0)
    fs = 250e6;
    n = 0:N-1;
    x= A*exp(1i*2*pi*f0*(1/fs).*n);
    f = -fs/2:fs/N: fs/2 -fs/N;
    Xf=fftshift(fft(x,N));
    Xf = Xf;
    stem(f,abs(Xf).^2)
    grid on 
    xlabel('Frequency (Hz)'); 
    ylabel('Magnitude');
    title ('Frequency Response');
    disp("Ratio=");
    disp(N*(1/fs*f0));
end