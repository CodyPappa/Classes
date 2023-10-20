Unomega= fft(u);
m=abs(Unomega);
omega1= (0:2*pi:2*pi*999)/1000
omega = t*2*pi
f = (0:length(u)-1)*100/length(u);
plot(f,m)
title('Magnitude')
