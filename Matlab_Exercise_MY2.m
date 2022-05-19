clear all;
clc;

fs = 10000; %sampling frequency

%time and frequency specifications
dt = 1/fs;
t = 0:dt:1-dt;
L = length(t);
df = fs/L;
f = (-fs/2):df:(fs/2)-df;

Ac = 1;
fc=200; %carrier frequency
fm=[20,60,200,400]; %message frequencies

%carrier signal
ct = Ac*cos(2*pi*fc*t);

B=4; %Beta

kf=1;
for i=1:length(fm)
    
    mt=cos(2*pi*fm(i)*t); %message signal
    
    xfm = cos((2*pi*fc*t) + B*mt); %fm signal in time domain
    XFM = fftshift(fft(xfm)); %frequency spectrum of xfm 
 
    figure(i);
    
    subplot(2,1,1);
    plot(t,xfm)
    grid on;
    xlim([0,0.1]);
    xlabel('Time(s)');
    ylabel('Amplitude')
    title(['Time series plot of FM Signal for fm = ',num2str(fm(i)),'Hz']);
    
    subplot(2,1,2);
    plot(f,abs(XFM)/L);
    xlim([-1000,1000]);
    grid on;
    xlabel('Frequency/Hz');
    ylabel('Amplitude')
    title(['Frequency Spectrum of FM Signal for fm = ',num2str(fm(i)),'Hz']);
    
end