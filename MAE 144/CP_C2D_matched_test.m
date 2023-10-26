%CP_C2D_matched.m
%syms z1 p1 
syms s
z1=1;
p1=10;
Ds = RR_tf([-z1],[0 , -p1],1);
h = .01; 
%[Dz] = CP_C2D_matched(Ds, h);

%if nargin==2, p=1; omegabar =0; 
%elseif nargin == 3, p =1; end
m=Ds.num.n; n=Ds.den.n;
for j=1:m; z(j)= exp(Ds.z(j)*h);  end %map Zeros to z plane
for j=1:n; p(j)= exp(Ds.p(j)*h);  end %map poles to z plane


Dz = RR_tf(z,p,1);