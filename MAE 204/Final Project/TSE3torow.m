function [rowvector] = TSE3torow(T)
%TrowtoSE3 takes an SE3 T matrix and returns the row vector form
%   row vector:r11,r12,r13,r21,r22,r23,r31,r32,r33, px, py, pz
% T = r11 r12 r13 px
%     r21 r22 r23 py
%     r31 r32 r33 pz
%     0   0   0   1
rowvector = [T(1,1), T(1,2),T(1,3),T(2,1),T(2,2),T(2,3),T(3,1),T(3,2),...
    T(3,3),T(1,4),T(2,4),T(3,4)];
end