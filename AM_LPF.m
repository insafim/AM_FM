fs = 20e3;         %Sampling Frequency
t = 0:1/fs:0.01;
L = length(t);

Ac = 1;

Ka = 0.5;
fm = 500;
fc = 2000;

m = cos(2*pi*fm*t);    %Message Signal
c = Ac*cos(2*pi*fc*t); %Carrier Signal
s = (1 + Ka*m).*c;     %AM Signal
s2 = 2*s.*s; %Squaring & Applying a gain of 2


%Low Pass FIR Filter
% fpass = 1000;
% fstop = 1020;
% NFpass = 2*pi*fpass/fs; %Normalized Frequency in rad/s
% NFstop = 2*pi*fstop/fs;
% Ap = 0.5;
% Ast = 80;
% 
% d = designfilt('lowpassfir','PassbandFrequency',NFpass,...
%   'StopbandFrequency',NFstop,'PassbandRipple',Ap,...
%   'StopbandAttenuation',Ast,'DesignMethod','kaiserwin');
% 
% fvtool(d)

%LPF
Fpass = 1000;
Fstop = 1050;
Ap = 0.5;
Ast = 80;
Fs = 20e3; 
d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);
%fvtool(d)

v = filter(d,s2); %Apply filter to s2

%Message signal obatained from demodulation
md = sqrt(v);
md = md - 1;

figure(5);
subplot(2,1,1);
plot(t,m);
ylim([-1,1])
xlim([0,0.01]);
xlabel('Time/s');
ylabel('Amplitude/V');
title('Message Signal m(t) for Case(i)')
% 
% subplot(2,1,2);
% plot(t,md);
% ylim([-1,1])
% xlim([0,0.01]);
% xlabel('Time/s');
% ylabel('Amplitude/V');
% title('Message Signal md(t) for Case(i)')
