function [Dz] = CP_C2D_matched(Ds, h, omegabar,p)
%CP_C2D_matched 
%Converts Ds(s) to Dz(z) using Mathed poles/zeros method.  If omegabar is
%specified, gains are matched at that frequncy. Assumed a stricly proper
%TF is requested. If only a proper TF requested, set p = 0
%   
if nargin==2, p=1; omegabar =0; 
elseif nargin == 3, p =1; end
m=Ds.num.n; n=Ds.den.n;
for j=1:m; z(j)= exp(Ds.z(j)*h);  end %map Zeros to z plane
for j=1:n; p(j)= exp(Ds.p(j)*h);  end %map poles to z plane

Dz = RR_tf(z,p,1);

end