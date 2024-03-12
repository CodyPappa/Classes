function [outputConfigs] = TrajectoryGenerator(TseI,TscI, TscF, TceGrasp, TceStandoff, k)
%TrajectoryGenerator
%Summary of this function goes here
%   Detailed explanation goes here


%% create Tse positions for all 8 trajectoryies
Startpos = TseI;
Traj{1} = TscI*TceStandoff;
Traj{2}= TscI*TceGrasp;
Traj{3}= Traj{2}; %same postion, just close the gripper and wait
Traj{4}= Traj{1}; %back up to Pickup Standoff position, just with gripper closed
Traj{5}= TscF*TceStandoff;
Traj{6}= TscF*TceGrasp;
Traj{7}= Traj{6}; %same position just open gripper and wait
Traj{8}= Traj{5}; %back up to Final Standoff Position, with the gripper open
%% add the state of the gripper for each trajectory
Gripperstate = [0, 0, 0, 1, 1, 1, 1, 0, 0];



%% simmulate Trajectorys between all 8 Tse positions

%% Output array to config_array.csv
% config_array.csv will be located in Matlab's current directory
outputConfigs(1,:) = [Startpos(1,1),Startpos(1,2),Startpos(1,3),Startpos(2,1),Startpos(2,2),Startpos(2,3),Startpos(3,1),...
    Startpos(3,2),Startpos(3,3),Startpos(1,4),Startpos(2,4),Startpos(3,4),Gripperstate(1)];
for n=1:8
    outputConfigs(n+1,:) = [Traj{n}(1,1),Traj{n}(1,2),Traj{n}(1,3),Traj{n}(2,1),Traj{n}(2,2),Traj{n}(2,3),Traj{n}(3,1),...
    Traj{n}(3,2),Traj{n}(3,3),Traj{n}(1,4),Traj{n}(2,4),Traj{n}(3,4),Gripperstate(n+1)];
end
    
    %outputConfigs(3,:) = [Traj2(1,1),Traj2(1,2),Traj2(1,3),Traj2(2,1),Traj2(2,2),Traj2(2,3),Traj2(3,1),...
   % Traj2(3,2),Traj2(3,3),Traj2(1,4),Traj2(2,4),Traj2(3,4),Gripperstate(3)];
writematrix(outputConfigs,'config_array.csv')
end