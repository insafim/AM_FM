clear all;
close all;
Fs = 25000; %sampling frequency
t = 0:1/Fs:1-1/Fs;
ac = 1;
fc=2000;ka=0.5;fm=500;
%carrier signal
ct = ac*cos(2*pi*fc*t);     

%message signal
mt=cos(2*pi*fm*t);

xam1=ac*(1+ka.*mt).*cos(2*pi*fc*t);
figure();
subplot(3,1,1);
plot(t,xam1);
grid on;

fc=5000;ka=0.7;fm=1000;
%carrier signal
ct = ac*cos(2*pi*fc*t);     

%message signal
mt=cos(2*pi*fm*t);

xam2=ac*(1+ka.*mt).*cos(2*pi*fc*t);

subplot(3,1,2);
plot(t,xam2);
grid on;
fc=5000;ka=1;fm=1000;
%carrier signal
ct = ac*cos(2*pi*fc*t);     

%message signal
mt=cos(2*pi*fm*t);

xam3=ac*(1+ka.*mt).*cos(2*pi*fc*t);

subplot(3,1,3);
plot(t,xam3);
grid on;

figure();
ff1 = fftshift(fft(xam1));
f = -Fs/2:1:Fs/2-1;
subplot(3,1,1);
plot(f/1000,abs(ff1)/Fs);
ylim([0,1.2]);
title('Frequency Spectrum for case 1')
xlabel('Frequency (kHz)')
ylabel('Magnitude')
grid on

ff2 = fftshift(fft(xam2));
f = -Fs/2:1:Fs/2-1;
subplot(3,1,2);
plot(f/1000,abs(ff2)/Fs);
ylim([0,1.2]);
title('Frequency Spectrum for case 2')
xlabel('Frequency (kHz)')
ylabel('Magnitude')
grid on

ff3 = fftshift(fft(xam3));
f = -Fs/2:1:Fs/2-1;
subplot(3,1,3);
plot(f/1000,abs(ff3)/Fs);
ylim([0,1.2]);
title('Frequency Spectrum for case 3')
xlabel('Frequency (kHz)')
ylabel('Magnitude')
grid on

%demodulation

xsq=xam1.*xam1;

Fpass = 0.37; 
Fstop = 0.43;
Ap = 1;
Ast = 30;

Fpass = 370;
Fstop = 430;
Ap = 1;
Ast = 30;
Fs = 2000; 

d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);