t = -10:0.0001:10;

x1 = rectpuls(t,1);
xhat1 = (1/pi)*(log(t+0.5)-log(t-0.5));

figure(1); 
plot(t,x1,'LineWidth',1);hold on;6
plot(t,xhat1,'LineWidth',1);grid on;
legend('Square Pulse','Hibert Transform');

x2 = tripuls(t,2);
xhat2 = (t/pi).*(log(t.^2-1)-log(t.^2))+(1/pi)*(log(t+1)-log(t-1));

figure(2);
plot(t,x2,'LineWidth',1);hold on;
plot(t,xhat2,'LineWidth',1);grid on;
legend('Triangular Pulse','Hibert Transform');

x3 = sin(pi*t)./(pi*t);
xhat3 = (1./(pi*t)).*(1-cos(pi*t));

figure(3);
plot(t,x3,'LineWidth',1);hold on;
plot(t,xhat3,'LineWidth',1);grid on;
legend('sinc(t)','Hibert Transform');

