function [Ve, newXeSum,Xerr] = FeedbackControl(X, Xd, Xdn, Kp, Ki, dt, XeSum)
%  FEEDBACKCONTROL Calculates the task-space feedforward plus feedback control law.
% 
% Inputs:
%   X: Actual current E-E config of the robot is space frame,a aka
% Tse. Expressed as row in the order r11,r12,r13,r21,r22,r23,r31,r32,r33,
% px, py, pz 
%   Xd: Desired current E-E config of the robot is space frame.
% aka Tse,d. Expressed  in the same order 
%   Xdn: Reference E-E configuration
% at the next timestep. aka Tse,d,next. Expressed in the same order
%   Kp, Ki:PI gain matrices 
%   dt:   timestep delta T between reference trajectory configs
%   XeSum: Sum of previous Xe errors, passed in from previous interation, 
% initilzed at 0
% 
% Outputs:
% Ve: commanded E-E twist expressed in E-E frame
% newXeSum: Sum of previous and current Xe errors, passed on to the next 
%           iteration
% Xerr: The T matrix that drives X to Xd
%% Feedforward term  [AdX−1Xd ]Vd(t)
Vd = se3ToVec(MatrixLog6(TransInv(Xd)*Xdn)/dt);
%% Preportional term  KpXe(t)
Xerr =se3ToVec(MatrixLog6(TransInv(X)*Xd));
%%  Integral Term  Ki Sum(Xe(t))
newXeSum = Xerr*dt +XeSum;
%% Total law
Ve = Adjoint(TransInv(X)*Xd) * Vd + Kp*Xerr + Ki*newXeSum;
end