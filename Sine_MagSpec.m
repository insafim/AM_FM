fs = 100e3;         %Sampling Frequency
t = 0:1/fs:0.01;
L = length(t);

m = cos(2*pi*fm*t);    %Message Signal

%frequency specifications
df = fs/L;
min_f = -fs/2;
max_f = fs/2-df;
f = min_f:df:max_f;

%Magnitude Spectrum of AM Signal,s(t)
Mw = abs(fftshift(fft(m)));
figure(1)
plot(f/1000,Mw/L)
%ylim([0,0.55]);
xlim([-7,7]);
title('Magnitude Spectrum M(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor