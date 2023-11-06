close all
clear 

D = RR_tf([-1],[-10],181.8);
G = RR_tf([1],[1,0,0],1);
L = D*G;
T= L / (1+L);
figure(1) 
RR_rlocus(G,D);
figure(2)
RR_bode(L);