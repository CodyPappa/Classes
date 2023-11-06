close all
clear 
syms k
D = tf(1, [1 0 0] );
G = tf(1,1);
L = D*G;
T= L / (1+L);

rlocus(L);
%bode(L);

