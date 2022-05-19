fs = 1000e3;         %sampling frequency
dt = 1/fs;
t = 0:dt:8e-4-dt;
L = length(t);

fm = 3e3;
fc = 250e3;
Ac = 1;
Am = 1;

m = Am*cos(2*pi*fm*t); %message signal
c = Ac*cos(2*pi*fc*t); %carrier signal
s = m.*c;              %DSB-SC modulated signal

figure(1);
plot(t,m); hold on
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Demodulated signal for different receiver oscillator phase offsets");

%Low Pass Butterworth Filter
cutoff = 2*15e3; %Hz
N_cutoff = cutoff/(fs/2); %Normalized cutoff frequency
order = 5;
[b,a] = butter(order,N_cutoff);

magnitude = [];

for x = 0:pi/50:pi
    c2 = Ac*cos(2*pi*fc*t + x); %receiver oscillator
    e = s.*c2;
    g = filter(b,a,e); %filter output
    md = 2*g;          %Adjusting the amplitude
    magnitude = [magnitude,max(md)];
    plot(t,md);hold on;
end


att_dB = 20*log10(1./magnitude); %Attenuation in dB

x = 0:pi/50:pi;

figure(2);
plot(x,att_dB);
xlabel("Phase Shift/rad") ;
ylabel("Attenuation/dB");
set(gca,'XTick',0:pi/4:pi) ;
set(gca,'XTickLabel',{'0','pi/4','pi/2','3*pi/4','pi'})
title("Attenuation Vs Phase shifts");





