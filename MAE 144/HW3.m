clear 
close all

%1-3
syms s
P= RR_tf(.1,[ 1 .1]); 
delayapprox= RR_pade(6,2,2);
G = delayapprox *P; 
k =RR_tf(.1);
D = RR_tf([1 2.53 1.61],[1 0]);
L = k*G*D; T = L/(1+L);

P1= tf(.1,[ 1 .1]);
delayapprox1= tf([3 -3 1],[3 3 1]);
G1 = delayapprox1 *P1; 
D1= tf(1);
L1 = G1*D1; T1 = L1/(1+L1);
figure(4)
bode(G1*D1);
figure(5)
rlocus(L1);

figure(1) 
RR_bode(L);
figure(2) 
RR_rlocus(G, D);
figure(3) 
 g.T=100;            
 g.N=1000;
RR_step(T,g);


