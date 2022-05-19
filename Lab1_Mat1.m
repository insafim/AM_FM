fs = 10e3;         %sampling frequency
dt = 1/fs;
t = 0:dt:0.3-dt;
L = length(t);
df = fs/L;
f = -fs/2:df:fs/2-df;

Ac = 2;   %V
fc = 200; %Hz
wc = 2*pi*fc; %rad/s

Am = 1;   %V
fm = 10;  %Hz
wm = 2*pi*fm; %rad/s

m = Am*cos(wm*t); %message signal
c = Ac*cos(wc*t); %carrier signal

K = 1;
Vdc = 1;
mu = 0; 

Xam = K*Vdc*Ac*(1+mu*cos(wm*t)).*cos(wc*t);

%Magnitude Spectrums
mf = abs(fftshift(fft(m)))/L; %message signal
cf = abs(fftshift(fft(c)))/L; %carrier signal
Xamf = abs(fftshift(fft(Xam)))/L; %modulated signal

figure(1);
subplot(3,2,1);
plot(t,c);
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Carrier signal");

subplot(3,2,2);
plot(f,cf);
ylim([0,1.2]);
xlim([-400,400]);
xlabel("Frequency/Hz");
ylabel("Amplitude/V");
title("Carrier signal frequency spectrum");

subplot(3,2,3);
plot(t,m);
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("Message signal");

subplot(3,2,4);
plot(f,mf);
ylim([0,0.7]);
xlim([-100,100]);
xlabel("Frequency/Hz");
ylabel("Amplitude/V");
title("Message signal frequency spectrum");


subplot(3,2,5);
plot(t,Xam);
xlabel("Time/s") ;
ylabel("Amplitude/V");
title("AM signal : mu=0");

subplot(3,2,6);
plot(f,Xamf);
ylim([0,1.2]);
xlim([-400,400]);
xlabel("Frequency/Hz");
ylabel("Amplitude/V");
title("AM signal frequency spectrum");




