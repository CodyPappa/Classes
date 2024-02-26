%% Lab 3 (Inverse Kinematics) template
% MAE204
% Harry
%
% Computes inverse kinematics for each waypoints in the sequence, then
% outputs the joint angle sets as well as gripper state as waypoint_array.csv file
% waypoint_array.csv will be saved in Matlab's current directory

clc
clear
close all

%% Part 1: Establishing screw axes S and end-effector zero config M
% First, define the screw axes, in (mm)

S1 = [0, 0, 1, -300, 0, 0]';
S2 = [0, 1, 0, -240, 0, 0]';
S3 = [0, 1, 0, -240, 0, 244]';
S4 = [0, 1, 0, -240, 0, 457]';
S5 = [0, 0, -1, 169, 457, 0]';
S6 = [0, 1, 0, -155, 0, 457]';
Slist = cat(2,S1,S2,S3,S4,S5,S6);
% Next, define the M matrix (the zero-position e-e transformation matrix),
% in (mm)

M =[1, 0, 0, 457;
    0, 1, 0, 78;
    0, 0, 1, 155;
    0, 0, 0, 1];


%% Part 2: UR3e sequence planning
% You may use this space to define the waypoints for your sequence (I
% recommend using SE(3) matrices to define gripper configurations)

standby = [0, 0, 1, 323.6;-1, 0, 0, -335.6;0, -1, 0, 237;0, 0, 0, 1];
%Align Orientation
legs_grab_above = [1, 0, 0, 400; 0, 0, 1, -200;0, -1, 0, 150; 0, 0, 0, 1];
Legs_grab = [1, 0, 0, 400; 0, 0, 1, -200;0, -1, 0, 50; 0, 0, 0, 1];
Legs_grab_clear = [1, 0, 0, 400; 0, 0, 1, -200;0, -1, 0, 100; 0, 0, 0, 1];
Legs_release_above = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 155; 0, 0, 0, 1];
Legs_release= [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 55; 0, 0, 0, 1];
Legs_release_clear = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 200; 0, 0, 0, 1];
%Start orientation
Body_grab_above = [0, 0, 1, 450;-1, 0, 0, -450;0, -1, 0, 120;0, 0, 0, 1];
Body_grab = [0, 0, 1, 450;-1, 0, 0, -450;0, -1, 0, 70;0, 0, 0, 1];
Body_grab_clear = [0, 0, 1, 450;-1, 0, 0, -450;0, -1, 0, 200;0, 0, 0, 1];
%Align Orientation
Body_release_above = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 200; 0, 0, 0, 1];
Body_release = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 85; 0, 0, 0, 1];
Body_release_clear = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 200; 0, 0, 0, 1];
%Start orientation
Head_grab_above = [0, 0, 1, 450;-1, 0, 0, -300;0, -1, 0, 200;0, 0, 0, 1];
Head_grab = [0, 0, 1, 450;-1, 0, 0, -300;0, -1, 0, 130;0, 0, 0, 1];
Head_grab_clear = [0, 0, 1, 450;-1, 0, 0, -300;0, -1, 0, 200;0, 0, 0, 1];
%Align Orientation
Head_release_above = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 200; 0, 0, 0, 1];
Head_release = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 110; 0, 0, 0, 1];
Head_release_clear = [1, 0, 0, 450; 0, 0, 1, -150;0, -1, 0, 200; 0, 0, 0, 1];


%% Part 3: Inverse kinematics for each waypoint
% Compute inverse kinematics to obtain 6 joint angles for each waypoint,
% then save them in waypoint_array
%
% waypoint_array = n x 7 array where:
% n = number of waypoints
% First 6 columns in each row = joint angles 1...6, in degrees
% Last column in each row = gripper state (0 for open, 1 for close)

thetalist0 = [deg2rad(-30), deg2rad(-90), deg2rad(90),deg2rad(-90),deg2rad(-90),deg2rad(-150)]';
  eomg = 0.01;
  ev = 0.001;

[waypoint_array(1,:)]= IKinSpace(Slist, M, standby, thetalist0, eomg, ev);
[waypoint_array(2,:)]= IKinSpace(Slist, M, legs_grab_above, waypoint_array(1,:)', eomg, ev);
[waypoint_array(3,:)]= IKinSpace(Slist, M, Legs_grab, waypoint_array(2,:)', eomg, ev);
[waypoint_array(4,:)]= IKinSpace(Slist, M, Legs_grab_clear, waypoint_array(3,:)', eomg, ev);
[waypoint_array(5,:)]= IKinSpace(Slist, M, Legs_release_above, waypoint_array(4,:)', eomg, ev);
[waypoint_array(6,:)]= IKinSpace(Slist, M, Legs_release, waypoint_array(5,:)', eomg, ev);
[waypoint_array(7,:)]= IKinSpace(Slist, M, Legs_release_clear, waypoint_array(6,:)', eomg, ev);
[waypoint_array(8,:)]= IKinSpace(Slist, M, Body_grab_above, waypoint_array(7,:)', eomg, ev);
[waypoint_array(9,:)]= IKinSpace(Slist, M, Body_grab, waypoint_array(8,:)', eomg, ev);
[waypoint_array(10,:)]= IKinSpace(Slist, M, Body_grab_clear, waypoint_array(9,:)', eomg, ev);
[waypoint_array(11,:)]= IKinSpace(Slist, M, Body_release_above, waypoint_array(10,:)', eomg, ev);
[waypoint_array(12,:)]= IKinSpace(Slist, M, Body_release, waypoint_array(11,:)', eomg, ev);
[waypoint_array(13,:)]= IKinSpace(Slist, M, Body_release_clear, waypoint_array(12,:)', eomg, ev);
[waypoint_array(14,:)]= IKinSpace(Slist, M, Head_grab_above, waypoint_array(13,:)', eomg, ev);
[waypoint_array(15,:)]= IKinSpace(Slist, M, Head_grab, waypoint_array(14,:)', eomg, ev);
[waypoint_array(16,:)]= IKinSpace(Slist, M, Head_grab_clear, waypoint_array(15,:)', eomg, ev);
[waypoint_array(17,:)]= IKinSpace(Slist, M, Head_release_above, waypoint_array(16,:)', eomg, ev);
[waypoint_array(18,:)]= IKinSpace(Slist, M, Head_release, waypoint_array(17,:)', eomg, ev);
[waypoint_array(19,:)]= IKinSpace(Slist, M, Head_release_clear, waypoint_array(18,:)', eomg, ev);
[waypoint_array(20,:)]= IKinSpace(Slist, M, standby, waypoint_array(1,:)', eomg, ev);



gripperPos = [0,0,1,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,0,0,]';
waypoint_array = cat(2,waypoint_array,gripperPos);



% Your code should end here

%% Some basic sanity checks (DO NOT EDIT THIS PART)
% size of waypoint_array check
if length(waypoint_array(1,:)) ~= 7
    error('waypoint_array should have 7 columns')
end

for i = 1:length(waypoint_array(:,1))
    for j = 1:5
        % Joint limit check (error if out of joint limit bounds)
        if waypoint_array(i,j) > 360 || waypoint_array(i,j) < -360
            error(['Error: joint ',num2str(j),' in waypoint number ',num2str(i),' is out of joint limit bounds']);
        end
        % Gripper state check (error if not 0 or 1)
        if waypoint_array(i,7) ~= 0 && waypoint_array(i,7) ~= 1
            error(['Error: gripper state in waypoint number ',num2str(i),' is invalid. It should be 0 or 1']);
        end
    end
end

%% Output array to waypoint_array.csv
% waypoint_array.csv will be located in Matlab's current directory
writematrix(waypoint_array,'waypoint_array.csv')