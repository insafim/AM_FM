Fs = 100000;         %sampling frequency
t = 0:1/Fs:1-1/Fs;

Ac = 1;

Ka = 0.5;
fm = 500;
fc = 2000;
m = cos(2*pi*fm*t);
c = Ac*cos(2*pi*fc*t);
s = (1 + Ka*m).*c;

s2 = 2*s.*s;

n = length(s2);
X = fft(s2);
Y = fftshift(X);
fshift = (-n/2:n/2-1)*(Fs/n); % zero-centered frequency range
powershift = abs(Y);          % zero-centered magnitude
figure(5);
plot(fshift/1000,powershift/Fs);
ylim([0,1.5]);
xlim([-8,8]);
title('Magnitude Spectrum')
xlabel('Frequency (kHz)')
ylabel('Magnitude')
grid on

cutoff = 1000/Fs/2;
order = 64;
h1 = fir1(order,cutoff);

% Fpass = 1000;
% Fstop = 1100;
% Ap = 1;
% Ast = 50;
% Fs = 100e3; 

Fpass = 2000;
Fstop = 2050;
Ap = 1;
Ast = 50;
Fs = 100e3;

h2 = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);

v2 = filter(h2,s2); % apply filter to your data

v1 = conv(h1,s2);

n = length(v2);
X = fft(v2);
Y = fftshift(X);
fshift = (-n/2:n/2-1)*(Fs/n); % zero-centered frequency range
powershift = abs(Y);          % zero-centered magnitude
figure(6);
plot(fshift/1000,powershift/Fs);
ylim([0,1.5]);
xlim([-8,8]);
title('Magnitude Spectrum')
xlabel('Frequency (kHz)')
ylabel('Magnitude')
grid on

figure(7);
v1 = sqrt(v1);
md1 = v1 - 1;

v2 = sqrt(v2);
md2 = v2 - 1;
plot(md2);
xlim([0,10000]);
title('Demodulated Message Signal mD(t)')