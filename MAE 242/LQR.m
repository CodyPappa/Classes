A = [-38.2,-176.4;0,1];
B = [4;0];
Q = [1,0;0,0];
R = 1;
K = lqr(A,B,Q,R)