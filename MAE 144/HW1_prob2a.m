%problem 2a hw 1

a = RR_poly( [1 -1 3 -3 6 -6],1);
b = RR_poly([2 -2 5 -5],1);
f = RR_poly([-1 -1 -3 -3 -6 -6],1);
[x,y]= RR_diophantine(a,b,f);
test1=trim(a*x+b*y); residual= norm(f-test1);
%Value for residual is 0, so code works



