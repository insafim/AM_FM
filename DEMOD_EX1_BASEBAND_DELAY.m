%implement the baseband delay FM demodulator
clear all;
close all;
fs = 500000; %sampling frequency
t = 0:1/fs:1-1/fs;
ac = 1;
fc=10000;fm=1000;
%carrier signal
ct = ac*cos(2*pi*fc*t);

%message signal
mt=cos(2*pi*fm*t);
figure(1);
subplot(3,1,1)
plot(t,mt);
title('Message signal');
xlim([0,0.03]);
grid on;

%FM signal
B=1; %beta
xfm = cos(2*pi*fc*t + B*sin(2*pi*fm*t));
subplot(3,1,2)
plot(t,xfm);
title('Modulated signal');
xlim([0,0.002]);
grid on;
yi=xfm.*cos(2*pi*fc*t);
yq=xfm.*sin(2*pi*fc*t);

%defining butterworth filter
[b,a] = butter(10,1*fc/(fs/2));

%filtered signals
yi2=filter(b,a,yi);
yq2=filter(b,a,yq);
y = complex(yi2,yq2);

%delaying y by one unit and taking the conjugate
ydel=zeros(size(y));
n=1;
ydel(n+1:end)=y(1:end-n);
yconj=conj(ydel);

wn=y.*yconj;

%demodulated signal
vn=angle(wn);

subplot(3,1,3)
plot(t,vn);
title('Demodulated signal');
xlim([0,0.03]);
ylim([-0.03,0.02])
grid on;
