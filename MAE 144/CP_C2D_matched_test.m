%CP_C2D_matched.m
syms z1 p1 s
Ds = RR_tf([s+z1],[s*(s+p1)]);
h = .01; 
[Dz] = CP_C2D_matched(Ds, h);