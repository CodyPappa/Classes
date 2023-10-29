%CP_C2D_matched.m

close all
clear
z1=1;
p1=10;
Ds = RR_tf([-z1],[0 , -p1],1);  % build the transfer function
h = .01; 
%setup vars
Dz= CP_C2D_matched(Ds, h);

%buld reference c2d with matched method
DSref= tf([1,z1],[1, p1, 0]);
Dzref = c2d(DSref, h, 'matched');   


