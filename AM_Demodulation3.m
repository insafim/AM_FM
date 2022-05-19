fs = 100e3;         %Sampling Frequency
t = 0:1/fs:0.01;
L = length(t);

Ac = 1;

Ka = 1;
fm = 1000;
fc = 5000;

m = cos(2*pi*fm*t);    %Message Signal
c = Ac*cos(2*pi*fc*t); %Carrier Signal
s = (1 + Ka*m).*c;     %AM Signal
s2 = 2*s.*s;           %Squaring & Applying a gain of 2


%frequency specifications
df = fs/L;
min_f = -fs/2;
max_f = fs/2-df;
f = min_f:df:max_f;


%Magnitude Spectrum of Message Signal,m(t)
Mw = abs(fftshift(fft(m)));
figure(2)
plot(f/1000,Mw/L)
ylim([0,0.6]);
title('Magnitude Spectrum M(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor

%Magnitude Spectrum of AM Signal,s(t)
Sw = abs(fftshift(fft(s)));
figure(3)
plot(f/1000,Sw/L)
title('Magnitude Spectrum S(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor

%Magnitude Spectrum of Squared Signal,s2(t)
Vw = abs(fftshift(fft(s2)));
figure(4)
plot(f/1000,Vw/L)
title('Magnitude Spectrum S2(w) for Case(iii)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor


%LPF
fcut = 3000;
Wcut = fcut/(fs/2);
N = 30;
d = fir1(N,Wcut);

v = filter(d,1,s2); %Apply filter to s2

%Message signal obatained from demodulation
md = sqrt(v);
md = (md - 1);

%Magnitude Spectrum of filtered Signal,v(t)
Vw = abs(fftshift(fft(v)));
figure(5)
plot(f/1000,Vw/L)
title('Magnitude Spectrum V(w) for Case(iii)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor

figure(6);
subplot(2,1,1);
plot(t,m);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Message Signal for Case(iii)')

subplot(2,1,2);
plot(t,md);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Extracted Message Signal Case(iii) - Cutoff=2kHz')


%Using a incorrect Cutoff
fcut = 100;
Wcut = fcut/(fs/2);
N = 80;
d = fir1(N,Wcut);
v2 = filter(d,1,s2); %Apply filter to s2
%Message signal obatained from demodulation
md2 = sqrt(v2);
md2 = (md2 - 1);

fcut = 10000;
Wcut = fcut/(fs/2);
N = 80;
d = fir1(N,Wcut);
v3 = filter(d,1,s2); %Apply filter to s2
%Message signal obatained from demodulation
md3 = sqrt(v3);
md3 = (md3 - 1);


figure(7);
subplot(3,1,1);
plot(t,m);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Message Signal for Case(iii)')

subplot(3,1,2);
plot(t,md2);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Extracted Message Signal for Case(iii) - Cutoff=0.1kHz')

subplot(3,1,3);
plot(t,md3);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Extracted Message Signal for Case(iii) - Cutoff=10kHz')




