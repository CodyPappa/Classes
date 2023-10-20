%problem 2b hw 1

a = RR_poly( [1 -1 3 -3 6 -6],1);
b = RR_poly([2 -2 5 -5],1);
f = RR_poly([-1 -1 -3 -3 -6 -6],1);
[x,y]= RR_diophantine(a,b,f);
test1=trim(a*x+b*y); residual= norm(f-test1);
%Value for residual is 0, so code works
D = RR_tf(y, x);
% D has 5 zeros, 3 poles
f1 = RR_poly([-1 -1 -3 -3 -6 -6 -20 -20 -20 -20 -20 ],1);
[x1,y1]= RR_diophantine(a,b,f1);
D1 = RR_tf(y1, x1);
% D1 now has 5 zeros, 5 poles

