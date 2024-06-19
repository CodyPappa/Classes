theta = pi/100;
F = [1,sin(theta);0,cos(theta)];
E = .5*(F.'*F-eye(2));
Estar = .5*(eye(2)- inv(F)'*inv(F));
u = F-eye(2);
small= .5*(u + u.');

