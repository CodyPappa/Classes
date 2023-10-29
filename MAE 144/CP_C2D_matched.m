function [Dz] = CP_C2D_matched(Ds, h, omegabar,sc)
%CP_C2D_matched 
%Converts Ds(s) to Dz(z) using Mathed poles/zeros method.  If omegabar is
%specified, gains are matched at that frequncy. Assumed a stricly proper
%TF is requested. If only a proper TF requested, set sc = 0

if nargin==2, sc=1; omegabar =0; 
elseif nargin == 3, sc =1; end

m=length(Ds.z); n=length(Ds.p);
for j=1:m; z(j)= exp(Ds.z(j)*h);  end %map Zeros to z plane
for j=1:n; p(j)= exp(Ds.p(j)*h);  end %map poles to z plane

if m ==0        % add a zero at z=-1 if there are no zeros only
    z(1)= [-1];
end
m=length(z); n=length(p);
while m+1 < n                        % add a zero at z=-1 for every zero
    z(j)= [z(j), -1];                % at inf so that the numerator is one
    m=length(z); n=length(p);        % degree less then the degree of 
end                                  % degree of the denomonator
if sc ==0
    Ds.z= [Ds.z, -1];               % if strictly causal is false, add one
end                                 % more zero at z=-1


n=length(Ds.p);
if omegabar ==0           %check if inputed omegabar is zero
    for j=1:n             % go through each pole of Ds
        if Ds.p(j) ==0    % if one is zero, throw error
            error('Error: DC gain = inf, and omegabar =0')
        end 
    end
end
gain = RR_evaluate(Ds,omegabar);  % calculate the gain at inputed omegabar

Dz1 = RR_tf(z,p,1);       %build a tf based off calulcated zeros and poles
zgain=RR_evaluate(Dz1,1); % find the gain of that tf 
k = gain/zgain;           % find gain correction factor for omegabar

Dz = RR_tf(z,p,k);

end