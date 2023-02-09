function [] = Spectrum_Plotter(N,f0)
    Fs = 250*10^6;
    n = 1 : 512;
    x = 2*exp(1j*2*pi*f0*n/Fs);
    freq = [0:N-1]/N * Fs - Fs/2;
    x_f=corr_spctrm(x,N);
   figure
   subplot(3,1,1)
    plot(freq, (db(abs(x_f))))
    title('Using corrspctrm function')
subplot(3,1,2)
    plot(freq, db(abs(fftshift(fft(x,N)))))
    title('Using built in Matlab function')
    subplot(3,1,3)
    hold on
    plot(freq, (db(abs(x_f))))
    plot(freq, db(abs(fftshift(fft(x,N)))))
        title('Built in function and corrspctrm function in one plot')
    hold off


end