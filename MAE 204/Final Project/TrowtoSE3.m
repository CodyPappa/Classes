function [T] = TrowtoSE3(rowvector)
%TrowtoSE3 takes an SE3 row vector and returns the normal matrix form
%   row vector:r11,r12,r13,r21,r22,r23,r31,r32,r33, px, py, pz
% T = r11 r12 r13 px
%     r21 r22 r23 py
%     r31 r32 r33 pz
%     0   0   0   1
T= [rowvector(1),rowvector(2),rowvector(3),rowvector(10); rowvector(4),...
    rowvector(5), rowvector(6), rowvector(11);rowvector(7),rowvector(8)...
    rowvector(9), rowvector(12); 0,0,0,1;];
end