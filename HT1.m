t = -10:0.1:10;

%y = (1/pi)* (log(t+0.5)-log(t-0.5));
%y = (1/pi)*[((t+1).*log(t+1))+((t-1).*log(t-1))-(2*t.*log(t))];
y = cos(pi*t);
k = (pi*t).^-1;
j = y.*k + k;
plot(t,j);
title("Hilbert transform of Sinc(t)");