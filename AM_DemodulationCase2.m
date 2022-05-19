fs = 30e3;         %Sampling Frequency
t = 0:1/fs:0.1;
L = length(t);

Ac = 1;

Ka = 0.7;
fm = 1000;
fc = 5000;

m = cos(2*pi*fm*t);    %Message Signal
c = Ac*cos(2*pi*fc*t); %Carrier Signal
s = (1 + Ka*m).*c;     %AM Signal
s2 = 2*s.*s; %Squaring & Applying a gain of 2


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
%xlim([-7,7]);
title('Magnitude Spectrum M(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor

%Magnitude Spectrum of AM Signal,s(t)
Sw = abs(fftshift(fft(s)));
figure(3)
plot(f/1000,Sw/L)
%ylim([0,0.6]);
%xlim([-7,7]);
title('Magnitude Spectrum S(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor

%Magnitude Spectrum of Squared Signal,s2(t)
Vw = abs(fftshift(fft(s2)));
figure(4)
plot(f/1000,Vw/L)
%ylim([0,1]);
%xlim([-7,7]);
title('Magnitude Spectrum S2(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor


Fpass = 2000;
Fstop = 2050;
Ap = 0.5;
Ast = 80; 
d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',fs);

%fvtool(d)

v = filter(d,s2); %Apply filter to s2

%Message signal obatained from demodulation
md = sqrt(v);
md = md - 1;

%Magnitude Spectrum of filtered Signal,v(t)
Vw = abs(fftshift(fft(v)));
figure(5)
plot(f/1000,Vw/L)
%ylim([0,1]);
%xlim([-7,7]);
title('Magnitude Spectrum V(w) for Case(i)')
xlabel('Frequency/kHz')
ylabel('Amplitude/V')
grid on
grid minor

figure(6);
subplot(2,1,1);
plot(t,m);
%ylim([-1,1])
%xlim([0,0.01]);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Message Signal m(t) for Case(i)')

subplot(2,1,2);
plot(t,md);
%ylim([-1,1])
%xlim([0,0.01]);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Message Signal md(t) for Case(i)')
