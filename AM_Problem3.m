dt = 1/30000;
t = -1:dt:1;

Ac = 100;
fc = 10000;
f1 = 1000;
f2 = 500*sqrt(2);

wc = 2*pi*fc;
w1 = 2*pi*f1;
w2 = 2*pi*f2;

mt = 0.2*sin(w1*t)+0.5*cos(w2*t);

st = Ac*(1+mt);

figure(1);
plot(t,mt);
xlim([0,0.03]);


figure(2);
plot(t,st);
xlim([0,0.03]);

max(mt)
min(mt)