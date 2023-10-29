%CP_C2D_matched.m
%setup vars
close all
clear
Ds = RR_tf([3],[1 3 2]);  % build the transfer function
h = 1; 

%build c2d using the matched method
Dz= CP_C2D_matched(Ds, h);

%buld reference c2d with matched method
DSref= tf([3],[1 3 2]);
Dzref = c2d(DSref, h, 'matched');   

%checking the zeros and poles of the two equations, they are the same