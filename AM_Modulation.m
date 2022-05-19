dt = 1/3000000;
Ac = 10;
Am = 1;
t = -1:dt:1;

Fc = 100;
Fm = 2;

wc = 2*pi*Fc;
wm = 2*pi*Fm;

c = Ac*cos(wc*t);

m = Am*cos(wm*t);

Ka = 0.5;

s = (1 + Ka*m).*c;

%sb = Ka*m.*c;

%usb = Ac*Ka*cos((wc-wm)*t);

%plot(usb,'g');
%hold on;
plot(m,'g','LineWidth',2);
hold on;
plot(s,'y');