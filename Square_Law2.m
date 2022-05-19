Fs = 100000; %sampling frequency
t = 0:1/Fs:1-1/Fs;
ac = 1;
fc=2000;ka=0.5;fm=500;
%carrier signal
ct = ac*cos(2*pi*fc*t);     

%message signal
mt=cos(2*pi*fm*t);

xam1=ac*(1+ka.*mt).*cos(2*pi*fc*t);
figure(1);
plot(t,xam1);
grid on;

figure(2);
ff1 = fftshift(fft(xam1));
f = -Fs/2:1:Fs/2-1;
plot(f/1000,abs(ff1)/Fs);
ylim([0,1.2]);
title('Frequency Spectrum for case 1')
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

figure(3);
plot(t,dm1new);
xlim([0.1,0.2]);
title('Demodulated Message Signal Case 1');
