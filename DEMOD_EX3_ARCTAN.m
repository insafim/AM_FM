%demodulation: Arctangent
clear all;
close all;
fs = 100000; %sampling frequency
t = 0:1/fs:1-1/fs;
ac = 1;
fc=10000;fm=1000;
%carrier signal
ct = ac*cos(2*pi*fc*t);
%message signal: Sinusoid
mt=cos(2*pi*fm*t);
figure(1);
subplot(3,1,1);
plot(t,mt);
title('Message Signal');
xlabel('Time(s)');
ylabel('Magnitude/V');
grid on;
xlim([0,0.02]);

%FM signal
B=1; %beta
xfm = cos(2*pi*fc*t + B*sin(2*pi*fm*t));
% figure(2);
subplot(3,1,2);
plot(t,xfm);
xlabel('Time(s)');
ylabel('Magnitude/V');
grid on;
title('Modulated Signal');
xlim([0,0.002]);

%BPF specifications
fl=fc-fm/2; %fc-fcut
fh=fc+fm/2; %fc+fcut
wl=fl/(fs/2);
wh=fh/(fs/2);
[p,q]=butter(3,[wl,wh]);

xmfilt=filter(p,q,xfm);

xq=xmfilt.*sin(2*pi*fc*t);
xi=xmfilt.*cos(2*pi*fc*t);

%defining LPF butterworth filter
[b,a] = butter(3,1*fm/(fs/2));

%filtered signals
qt=filter(b,a,xq);
it=filter(b,a,xi);

xatan=atan2(qt,it);

dem=gradient(xatan);
% figure(3);
subplot(3,1,3);
plot(t,dem);
grid on;
ylim([-0.02,0.02]);
xlabel('Time(s)');
ylabel('Magnitude/V');
title('Demodulated signal');
xlim([0,0.02]);

%second message signal
fm=2000;
mt=cos(2*pi*fm*t);
figure(2);
subplot(3,1,1);
plot(t,mt);
xlabel('Time(s)');
ylabel('Magnitude/V');
title('Message Signal');
grid on;
xlim([0,0.02]);

%FM signal
B=1; %beta
xfm = cos(2*pi*fc*t + B*sin(2*pi*fm*t));
% figure(2);
subplot(3,1,2);
plot(t,xfm);
xlabel('Time(s)');
ylabel('Magnitude/V');
grid on;
title('Modulated Signal');
xlim([0,0.002]);

%BPF specifications
fl=fc-0.75*fm; %fc-fcut
fh=fc+0.75*fm; %fc+fcut
wl=fl/(fs/2);
wh=fh/(fs/2);
[p,q]=butter(3,[wl,wh]);

xmfilt=filter(p,q,xfm);

xq=xmfilt.*sin(2*pi*fc*t);
xi=xmfilt.*cos(2*pi*fc*t);

%defining butterworth filter
[b,a] = butter(3,fm/(fs/2));

%filtered signals
qt=filter(b,a,xq);
it=filter(b,a,xi);

xatan=atan2(qt,it);

dem=gradient(xatan);
% figure(3);
subplot(3,1,3);
plot(t,dem);
grid on;
ylim([-0.05,0.05]);
xlabel('Time(s)');
ylabel('Magnitude/V');
title('Demodulated signal');
xlim([0,0.02]);