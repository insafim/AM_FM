clear all;

fs = 10000; %sampling frequency

%time and frequency specifications
dt = 1/fs;
t = 0:dt:1-dt;
L = length(t);
df = fs/L;
f = (-fs/2):df:(fs/2)-df;


Ac = 1;
fc=200; %carrier frequency
fm=10;  %message frequency

%carrier signal
ct = Ac*cos(2*pi*fc*t);

%message signal
mt=cos(2*pi*fm*t);

%set plot colors
color1 = [0.8500 0.3250 0.0980]; %orange
color2 = [0 0.4470 0.7410]; %lightblue
color3 = [0.9290 0.6940 0.1250]; %darkyellow

%MatLab Exersice 1
figure(1);
plot(t,ct,'LineWidth',1,'Color',color3); hold on;
plot(t,mt,'LineWidth',1,'Color',color2);
xlim([0,0.2]);
legend('Carrier signal','Message signal');
xlabel('Time/s');
ylabel('Amplitude');
title('Message signal and Carrier signal');

kf = 1;
B=[0,0.25,0.5,1,2.405,3.838]; %Beta Values

for i=1:length(B)
    
    xfm = Ac*cos((2*pi*fc*t) + (B(i))*mt); %frequency modulated signal in time domain
    XFM = fftshift(fft(xfm)); %frequency spectrum of xfm 
 
    figure(i+1);
    
    subplot(2,1,1);
    plot(t,xfm)
    grid on;
    xlim([0,0.05]);
    xlabel('Time(s)');
    ylabel('Amplitude')
    title(['Time series plot of FM Signal for \beta = ',num2str(B(i))]);
    
    subplot(2,1,2);
    plot(f,abs(XFM)/L);
    ylim([0;0.55]);
    xlim([-300,300]);
    grid on;
    xlabel('Frequency/Hz');
    ylabel('Amplitude')
    title(['Frequency Spectrum of FM Signal for \beta = ',num2str(B(i))]);
    
end


