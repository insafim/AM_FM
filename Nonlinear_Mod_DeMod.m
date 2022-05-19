fs = 1000e3;         %sampling frequency
dt = 1/fs;
t = 0:dt:8e-4-dt;
L = length(t);
df = fs/L;
f = -fs/2:df:fs/2-df;

fm = 15e3;
fc = 250e3;
Ac = 1;
Am = 0.5;

m = Am*cos(2*pi*fm*t); %message signal
c = Ac*cos(2*pi*fc*t); %carrier signal

%MODULATOR

%Adder
x1 = c + m;
x2 = c - m;

%Non-Linear Device
a = 2; b = 1;
y1 = a*x1 + b*(x1.^2);
y2 = a*x2 + b*(x2.^2);

z = y1 - y2;

%BandPass Butterworth Filter
fcut = 2*15e3; %Hz
f_low = (fc - fcut)/(fs/2); %Normalized lower cutoff frequency
f_high = (fc + fcut)/(fs/2); %Normalized higher cutoff frequency
order = 3;
[b,a] = butter(order,[f_low,f_high]);

%modulated signal
s = filter(b,a,z); %filter output


%DEMODULATOR

%Adder
x3 = c + s;
x4 = c - s;

%Non-Linear Device
a = 2; b = 1;
y3 = a*x3 + b*(x3.^2);
y4 = a*x4 + b*(x4.^2);

z2 = y3 - y4;
    
    
%Low Pass Butterworth Filter (from Section I)
cutoff = 2*15e3; %Hz
N_cutoff = cutoff/(fs/2); %Normalized cutoff frequency
order = 5;
[b2,a2] = butter(order,N_cutoff);

md = filter(b2,a2,z2); %filter output


%frequency spectrum
mf = abs(fftshift(fft(m)))/L; %message signal
sf = abs(fftshift(fft(s)))/L; %modulated signal
mdf = abs(fftshift(fft(md)))/L; %carrier signal



%Plotting
figure(1) ;

subplot(3,2,1);
plot(t,m);
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Message signal");

subplot(3,2,2);
plot(f/1000,mf);
ylim([0,0.3]);
xlabel("Frequency/kHz");
ylabel("Amplitude/V");
title("Message signal frequency spectrum");


subplot(3,2,3);
plot(t,s);
ylim([-2,2]);
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Modulated signal");

subplot(3,2,4);
plot(f/1000,sf);
ylim([0,0.6]);
xlabel("Frequency/kHz");
ylabel("Amplitude/V");
title("Modulated signal frequency spectrum");


subplot(3,2,5);
plot(t,md);
ylim([-4,4]);
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Demodulated signal");

subplot(3,2,6);
plot(f/1000,mdf);
ylim([0,2.5]);
xlabel("Frequency/kHz");
ylabel("Amplitude/V");
title("Demodulated signal frequency spectrum");

