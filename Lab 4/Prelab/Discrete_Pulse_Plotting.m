function [] = Discrete_Pulse_Plotting(p, t, fs)
N = 256;
%subplot(2, 1, 1);
figure(1)
stem(t, p,'r')
hold on
    plot(t, p, 'b')
hold off
xlabel('Time')
title(' Triangular pulse')
legend('Discrete','Analog')
%subplot(2, 1, 2);
figure(2)
Pulsef = fftshift(fft(p, N));
freq = (0:N-1)/N*fs - fs/2;
Pulsef_dBm = 10 * log10((abs(Pulsef)).^2 / 100) + 30;
stem(freq, Pulsef_dBm,'g')
hold on
plot(freq, Pulsef_dBm,'r')
hold off
xlim([freq(1),freq(end)])
xlabel('Freq')
title('Spectrum of triangular pulse')
legend('Discrete','Analog')
end