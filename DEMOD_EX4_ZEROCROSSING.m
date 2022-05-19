%demodulation: FM Zero-Crossing
clear all;
close all;
fs = 10000; %sampling frequency
t = 0:1/fs:1-1/fs;
ac = 1;
fc=300;fm=25;
%carrier signal
ct = ac*cos(2*pi*fc*t);
%message signal: Sinusoid
mt=cos(2*pi*fm*t);
figure(1);
subplot(4,1,1);
plot(t,mt);
title('Message Signal');
xlabel('Time(s)');
ylabel('Magnitude/V');
grid on;
xlim([0,0.5]);

%FM signal
delf=20;
xfm = cos(2*pi*fc*t +(delf/fm)*sin(2*pi*fm*t));
subplot(4,1,2);
plot(t,xfm);
 hold on;
xlabel('Time(s)');
ylabel('Magnitude/V');
grid on;
title('Modulated Signal');
xlim([0,0.05]);
i=1;
zerocross=zeros();
while t(i)<1-1/fs
    if((xfm(i)<0)&&(xfm(i+1)>0))
        zerocross(i)=i*1/fs;
    end
    i=i+1;
end
zerocross;
L=length(zerocross);
y1 = zeros(1,L); 
plot(zerocross,y1,'r*');

%pulse generator
i=1;
pulse=zeros();
while i<=length(t)
    if zerocross(i)~=0
        k=0;
        while k<15
        pulse(i+k)=1;
        k=k+1;
        end
        i=i+k;
    end
    i=i+1;
end

subplot(4,1,3);
t = 0:1/fs:1+6/fs;
plot(t,pulse);
xlim([0,0.05]);
ylim([-0.1,1.1]);
grid on;

%defining LPF butterworth filter
[b,a] = butter(3,1*fm/(fs/2));

%filtered signals
qt=filter(b,a,pulse);

%mean of qt
sum1=0;
for i=1500:1:10000
sum1=sum1+qt(i);
end
qtmean=sum1/8500;
subplot(4,1,4);
plot(t,qt-qtmean);
grid on;
ylim([-0.03,0.03]);
xlim([0,0.5]);
    
    