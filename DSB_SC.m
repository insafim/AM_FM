dt = 1/3000;
Ac = 10;
Am = 1;
t = -1:dt:1;

Fc = 100;
Fm = 2;

wc = 2*pi*Fc;
wm = 2*pi*Fm;

c = Ac*cos(wc*t);

m = Am*cos(wm*t);

%Ka = 0.5;

s = m.*c;

plot(s,'y');hold on;
plot(m,'g','LineWidth','2');