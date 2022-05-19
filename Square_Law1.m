Fs = 100000; %sampling frequency
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

s1=2*xam1.*xam1;

Fpass = 1000;
Fstop = 1050;
Ap = 1;
Ast = 50;
Fs = 100e3; 

d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);

dm1 = filter(d,s1); % apply filter to your data
dm1new=sqrt(dm1)-1;
figure(7);

subplot(3,1,1);
plot(t,dm1new);

title('Demodulated Message Signal Case 1');

%xam2
s2=2*xam2.*xam2;

Fpass = 2000;
Fstop = 2050;
Ap = 1;
Ast = 50;
Fs = 100e3; 

d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);

dm2 = filter(d,s2); % apply filter to your data
dm2new=sqrt(dm2)-1;
figure(7);

subplot(3,1,2);
plot(t,dm2new);

title('Demodulated Message Signal Case 2');

%case3
s3=2*xam3.*xam3;

Fpass = 2000;
Fstop = 2050;
Ap = 1;
Ast = 50;
Fs = 100e3; 

d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);

dm3 = filter(d,s3); % apply filter to your data
dm3new=sqrt(dm3)-1;
figure(7);

subplot(3,1,3);
plot(t,dm3new);

title('Demodulated Message Signal Case 3');

