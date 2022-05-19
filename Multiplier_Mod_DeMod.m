fs = 1000e3;         %sampling frequency
dt = 1/fs;
t = 0:dt:8e-4-dt;
L = length(t);

fm = 15e3;
fc = 250e3;
Ac = 1;
Am = 0.5;

m = Am*cos(2*pi*fm*t); %message signal
c = Ac*cos(2*pi*fc*t); %carrier signal
s = m.*c;              %DSB-SC modulated signal

    
%Low Pass Butterworth Filter
cutoff = 2*15e3; %Hz
N_cutoff = cutoff/(fs/2); %Normalized cutoff frequency
order = 5;
[b,a] = butter(order,N_cutoff);


%Demodulation
e = s.*c;
g = filter(b,a,e); %filter output
md = 2*g;          %Adjusting the amplitude

%frequency
df = fs/L;
f = -fs/2:df:fs/2-df;


%Magnitude Spectrums
mf = abs(fftshift(fft(m)))/L; %message signal
cf = abs(fftshift(fft(c)))/L; %carrier signal
sf = abs(fftshift(fft(s)))/L; %modulated signal
ef = abs(fftshift(fft(e)))/L; 
mdf = abs(fftshift(fft(md)))/L; %demodulated signal


%plotting
figure(1) ;

subplot(4,2,1);
plot(t,m) ;
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Message signal");

subplot(4,2,2);
plot(f/1000,mf);
xlabel("Frequency/kHz");
ylabel("Amplitude/V");
title("Message signal frequency spectrum");


subplot(4,2,3);
plot(t,s) ;
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Modulated signal");

subplot(4,2,4);
plot(f/1000,sf);
xlabel("Frequency/kHz");
ylabel("Amplitude/V");
title("Modulated signal frequency spectrum");


subplot(4,2,5);
plot(t,e) ;
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Demodulated signal");

subplot(4,2,6);
plot(f/1000,ef);
xlabel("Frequency/kHz");
ylabel("Amplitude/V");
title("Demodulated signal frequency spectrum");


subplot(4,2,7);
plot(t,md) ;
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Filtered signal");

subplot(4,2,8);
plot(f/1000,mdf);
xlabel("Frequency/kHz");
ylabel("Amplitude/V");
title("Filtered signal frequency spectrum");


