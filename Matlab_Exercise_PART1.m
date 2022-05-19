clear all;
close all;
fs = 10000; %sampling frequency
t = 0:1/fs:1-1/fs;
ac = 1;
fc=200;fm=10;
%carrier signal
ct = ac*cos(2*pi*fc*t);

%message signal
mt=cos(2*pi*fm*t);

% figure(1);
% plot(t,ct);
% xlim([0,0.05]);
% 
% figure(2);
% plot(t,mt);

%beta values
B=[0,0.25,0.5,1,2.405,3.838];
kf=1;
for i=1:6;
    am=B(i)*(fm/kf);
    %frequency modulated signal
    xfm = cos((2*pi*fc*t) + (B(i))*mt);

    %frequency spectrum of xfm 
    l=length(t);
    ff1 = fftshift(fft(xfm));
    df=fs/l;
    f = -fs/2:df:fs/2-df;
    figure();
    subplot(2,1,1);
    plot(f,abs(ff1)/l);
    ylim([0;0.55]);
    xlim([-300,300]);
    grid on;
    %xlim([0,300]);
    xlabel('Frequency/Hz');
    ylabel('Amplitude')
    title(['Frequency Spectrum of x_f_m for A_m=',num2str(am),' and \beta=',num2str(B(i))]);
    %time series signal
%     figure();
    subplot(2,1,2);
    plot(t,xfm)
    grid on;
    xlim([0,0.1]);
    xlabel('Time(s)');
    ylabel('Amplitude')
    title(['Time series plot of x_f_m for A_m=',num2str(am),' and \beta=',num2str(B(i))]);
end


