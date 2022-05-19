fs = 50e3;         %Sampling Frequency
t = 0:1/fs:0.01;
L = length(t);

Ac = 1;

Ka = 0.5;
fm = 500;
fc = 2000;
m = cos(2*pi*fm*t);    %Message Signal
c = Ac*cos(2*pi*fc*t); %Carrier Signal
s = (1 + Ka*m).*c;     %AM Signal

figure(1);
subplot(3,1,1);
plot(t,m);
ylim([-1,1])
xlim([0,0.01]);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Message Signal m(t) for Case(i)')

subplot(3,1,2);
plot(t,c);
ylim([-1,1])
xlim([0,0.01]);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Carrier Signal c(t) for Case(i)')

subplot(3,1,3);
plot(t,s);
ylim([-1.5,1.5])
xlim([0,0.01]);
xlabel('Time/s');
ylabel('Amplitude/V');
title('AM Signal s(t) for Case(i)')


%Magnitude Spectrum of AM Signal,s(t)

df = fs/L;
min_f = -fs/2;
max_f = fs/2-df;
f = min_f:df:max_f;

Sw = abs(fftshift(fft(s)));

figure(4)
plot(f/1000,Sw/L)
ylim([0,0.55]);

xlim([-20,20]);
title('Magnitude Spectrum S(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor

