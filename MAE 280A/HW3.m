A = [ 0 1 0; 0 0 1; 24 -26 9];
lamda= eig (A);
syms t
Q=expm(A*t);
x0= [1;0;0];
f(t)= Q*x0;


time=0:.1:6 ;
y=f(time);
y1=y{1};
y2=y{2};
y3=y{3};
%plot(time,y1, time, y2,time, y3);
%legend('y(t)','y"(t)', 'y""(t)' )

Ac=  [ 0 1 0; 0 0 1; -20 -24 -9];
lamdaC= eig (Ac);

[P,J]=jordan(Ac);

ejt= [exp(-5*t) 0 0; 0 exp(-2*t) t*exp(-2*t); 0 0 exp(-2*t)];
Qc=expm(Ac*t);

fc(t)=Qc*x0;
yc=fc(time);
yc1=yc{1};
yc2=yc{2};
yc3=yc{3};
plot(time,yc1, time, yc2,time, yc3);
legend('y(t)','y"(t)', 'y""(t)' )