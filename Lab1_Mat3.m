fs = 10e3;         %sampling frequency
dt = 1/fs;
t = 0:dt:0.3-dt;
L = length(t);

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
mu = 1; 

Xam = K*Vdc*Ac*(1+mu*cos(wm*t)).*cos(wc*t);

Xen = K*Vdc*Ac*(1+mu*cos(wm*t));


figure(1);
plot(t,Xam,"LineWidth",1); hold on;
plot(t,Xen,"LineWidth",1);
xlabel("Time/s");
ylabel("Amplitude/V");
title("AM Signal and Envelop");
legend("AM Signal","Envelop");
