function  fft_plot_offset(A,N,f0)
    fs = 250e6;
    n = 0:N-1;
    x= A*exp(1i*2*pi*f0*(1/fs).*n);
    f = -fs/2:fs/N: fs/2 -fs/N;
    f02 = f0 +fs/N;
    
    Xf=fftshift(fft(x,N));
    X = abs(Xf).^2;
    x2= A*exp(1i*2*pi*f02*(1/fs).*n);
    Xf2=fftshift(fft(x2,N));
    X2 = abs(Xf2).^2;
    stem(f,X/max(X) * A^2)
    hold on 
    stem(f,X2/max(X2) * A^2)
    legend ('without shift' , 'with shift')
    grid on 
    xlabel('Frequency (Hz)'); 
    ylabel('Magnitude');
    title ('Frequency Response');
    xlim ([40e6 70e6])

end