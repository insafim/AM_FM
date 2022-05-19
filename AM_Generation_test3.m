Fs = 1000;
t = 0:1/Fs:1-0.001;
x = cos(2*pi*100*t);

figure(1);
plot(x)
xdft = fft(x);
xdft = xdft(1:length(x)/2+1);
freq = 0:Fs/length(x):Fs/2;

figure(2)
plot(freq/1000,abs(xdft)/Fs);
xlabel('kHz');