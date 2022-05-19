Fs = 30000;         %sampling frequency
t = 0:1/Fs:1-1/Fs;

Ac = 1;
Ka = 0.5;
fm = 500;
fc = 2000;
m = cos(2*pi*fm*t);
c = Ac*cos(2*pi*fc*t);
s = (1 + Ka*m).*c;

n = length(s);
X = fft(s);
Y = fftshift(X);
fshift = (-n/2:n/2-1)*(Fs/n); % zero-centered frequency range
powershift = abs(Y);          % zero-centered magnitude
figure(4);
plot(fshift/1000,powershift/Fs);
ylim([0,0.7]);
xlim([-10,10]);
title('Magnitude Spectrum')
xlabel('Frequency (kHz)')
ylabel('Magnitude')
grid on