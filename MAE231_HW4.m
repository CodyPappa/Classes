clear
dU = [3,3,2;0,0,0;0,6,0];
F = eye(3) +dU;
C = F'*F;
u = sqrtm(C);
B = F* F';
v = sqrtm(B);
Rr = round(F*inv(u),2);
Rl = round( inv(v)*F, 2);

infint = .5*(dU +dU');
lagr = .5*(F'*F -eye(3));
Eurl = round(.5*(eye(3) - inv(F)' * inv(F)),2);

[eigenvectors,eigenvalues]= eig(Eurl); eigenvectors= round(eigenvectors,2); eigenvalues= round(eigenvalues,2);
peig = sqrt(eigenvalues);

%% problem 2
%
syms ex exy ey
r45 = [cos(deg2rad(45)), -sin(deg2rad(45));sin(deg2rad(45)), cos(deg2rad(45))];
enew = r45*[ex,exy;exy,ey]*r45';

%% problem 3
sig = [90,25,0;25,20,0;0,0,0];
n = [1,1,1]/sqrt(3);
trac = n*sig;
[eigenvectors,eigenvalues]= eig(sig); eigenvectors= round(eigenvectors,2); eigenvalues= round(eigenvalues,2);