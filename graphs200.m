t= 0:.01:1;
z1 = .5*t.^2;
z2 = t -1 +exp(-t);
z3 = .5*t -.25 +.25*exp(-2*t);
y= z1+z2+z3;
plot(t,z1,t,z2,t,z3,t,y);
legend('Z1','Z2','Z3','Y')
