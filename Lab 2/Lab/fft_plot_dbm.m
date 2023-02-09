function  fft_plot_dbm(A,N,f0)
    fs = 250e6;
    n = 0:N-1;
    A = A/sqrt(2);
    x= A*exp(1i*2*pi*f0*(1/fs).*n);
    f = -fs/2:fs/N: fs/2 -fs/N;
    Xf=fftshift(fft(x,N)/N);
    X=abs(Xf).^2 / 50;
    X=10.*log10(X)+30;
    plot(f,X)
    grid on 
    xlabel('Frequency (Hz)'); 
    ylabel('Magnitude');
    ylim([-50 20]);
    xlim([-150e6 150e6]);
    title ('Frequency Response');
end