clear 
A = [-38.2,-176.4;0,1];
B = [4;0];
C = [0,0,0,1];
Q = [1,0;0,0];
R = 1;

T = 15;
%P = zeros(4,4,T+1);
%K = zeros(T+1,4);
idx = 0;
for p = 1:-.1:.1
    idx = idx +1;
    P(:,:,1)=p*Q;
    SR =2;
    i=0;
    while SR>=1
        i = i+1;
        K(i+1, :) = -1* (R + B' * P(:,:,i) *B)^-1 * (B' * P(:,:,i)*A);
        P(:,:,i+1) = p*Q + K(i+1, :)'*R*K(i+1, :) + (A+B*K(i+1, :))'*P(:,:,i)*(A+B*K(i+1, :));
        ABK = A + B*K(i+1,:);
        SR = max(abs(eig(ABK)));
        St(idx) = i;
    end
    
end

plot(1:-.1:.1,St)

% for idx = 1:15
%     x(idx) = idx;
%     ABK = A + B*K(idx+1,:);
%     y(idx) = max(abs(eig(ABK)));
%     y2(idx)=1;
% end
%plot(x,y, x,y2)
