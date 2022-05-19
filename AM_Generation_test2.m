Fs = 10000;          % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

Ac = 1;

Ka = 0.5;
fm = 500;
fc = 2000;
m = cos(2*pi*fm*t);
c = Ac*cos(2*pi*fc*t);
s = (1 + Ka*m).*c;
figure(1);
plot(m);
figure(2);
plot(c);
figure(3);
plot(s);

n = length(s);
X = fft(s);
Y = fftshift(X);
fshift = (-n/2:n/2-1)*(Fs/n); % zero-centered frequency range
powershift = abs(Y);          % zero-centered magnitude
figure(4);
plot(fshift/1000,powershift/Fs);


