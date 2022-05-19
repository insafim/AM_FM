Fpass = 2000;
Fstop = 2200;
Ap = 1;
Ast = 30;
Fs = 100000; 

d = designfilt('lowpassfir','PassbandFrequency',Fpass,...
  'StopbandFrequency',Fstop,'PassbandRipple',Ap,...
  'StopbandAttenuation',Ast,'SampleRate',Fs);
  
hfvt = fvtool(d);

