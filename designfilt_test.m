% N = 50;
% Fpass = 1000;
% Fstop = 1030;
% Fs = 100000; 
% 
% % Design method defaults to 'equiripple' when omitted
% % deq = designfilt('lowpassfir','FilterOrder',N,'PassbandFrequency',Fpass,...
% %   'StopbandFrequency',Fstop,'SampleRate',Fs);
% 
% dls = designfilt('lowpassfir','FilterOrder',N,'PassbandFrequency',Fpass,...
%   'StopbandFrequency',Fstop,'SampleRate',Fs,'DesignMethod','ls');
% 
% fvtool(dls);

Fpass = 1000;
Fstop = 1050;
Ap = 0.5;
Ast = 80;
Fs = 10e3; 
d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);
fvtool(d)
