fs = 3000;
dt = 1/fs;
Ac = 1;
t = -3:dt:3;

Ka = 0.5;
fm = 0.5;
fc = 2;
m = cos(2*pi*fm*t);
c = Ac*cos(2*pi*fc*t);
s = (1 + Ka*m).*c;
figure(1);
plot(m);

figure(2);
plot(c);

figure(3);
plot(s);


spec = fftshift(abs(fft(s)));
n = length(s);
f = -n/2:n/2-1;
f = (f*fs/n)/1000;
figure(4);
plot(f,spec); %Plotting the Magnitude Spectrum after Normalization
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');
title('Magnitude Spectrum vs f')

