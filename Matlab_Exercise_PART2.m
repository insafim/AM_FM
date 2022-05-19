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
%changing fm and beta=4
B=4;
fm=[20,40,60,100];
kf=1;
for i=1:4;
    am=B*fm(i)/kf;
    %frequency modulated signal
    xfm = cos((2*pi*fc*t) + B*sin(2*pi*fm(i)*t));

    %frequency spectrum of xfm 
    l=length(t);
    ff1 = fftshift(fft(xfm));
    df=fs/l;
    f = -fs/2:df:fs/2-df;
    figure();
    plot(f,abs(ff1)/l);
    ylim([0;0.55]);
    %xlim([0,300]);
    xlabel('Frequency/Hz');
    ylabel('Amplitude')
    title(['Frequency Spectrum of x_f_m for A_m=',num2str(am),' and f_m=',num2str(fm(i)),' Hz']);
    %time series signal
    figure();
    plot(t,xfm)
    xlim([0,0.1]);
    xlabel('Time(s)');
    ylabel('Amplitude')
    title(['Time series plot of x_f_m for A_m=',num2str(am),' and f_m=',num2str(fm(i)),' Hz']);
end