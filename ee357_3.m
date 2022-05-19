clear all;
t=-5:0.001:5;
T=2;
y1=tripuls(t,T);
plot(t,y1);
ylim([-0.75,1.25]);
xlabel('Time');
hold on;
grid on;

y2=(t/pi).*log(((t.^2)-1)./(t.^2))+(1/pi).*log((t+1)./(t-1));
plot(t,y2,'r');
hold on;

 y3=imag(hilbert(y1));
 plot(t,y3,'g');
legend('Triangular Pulse','Hilbert Transform');