%demodulation using differentiation
clear all;
close all;
fs = 200000; %sampling frequency
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
grid on;
title('Message Signal');
xlim([0,0.01]);

%FM signal
B=1; %beta
xfm = cos(2*pi*fc*t + B*sin(2*pi*fm*t));
subplot(3,1,2);
plot(t,xfm);
grid on;
title('Modulated Signal');
xlim([0,0.01]);

%gradient of the modulated signal
grad=gradient(xfm);
subplot(3,1,3);
title('Demodulated Signal');

% envelope detection: Done using the hilbert transform
%upper envelope
y1 = abs(hilbert(grad));
%removing the DC component from the envelope to recover the dem sig
y12=y1-mean(y1);
plot(t,y12)
grid on;
xlim([0,0.01]);
ylim([-0.2,0.2]);
 

%message signal: Rectangular pulse train

w = 0.5e-3; %pulse width
d= w/2:w*2:10; %delay vector
mt=pulstran(t,d,'rectpuls',w);
% m2t = square(2*pi*fm*t,50); 
figure(2);
subplot(3,1,1);
plot(t,mt);
title('Message Signal');
xlim([0,0.01]);
grid on;
ylim([-1.1,1.1]);

%FM signal
%fm modulation
%setting beta to 0.5
xfm = fmmod(mt,fc,fs,0.5*fm);
subplot(3,1,2);
plot(t,xfm);
grid on;
xlim([0,0.02]);

grad=gradient(xfm);

%envelope detection: Done using the hilbert transform
%upper envelope
y2 = abs(hilbert(grad));
%removing the DC value
y22=y2-mean(y2);
subplot(3,1,3);
plot(t,y22)
grid on;
xlim([0,0.01]);
ylim([-0.04,0.04]);


