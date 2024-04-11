%% Trim specification
% all trim states refer to straight and level flight, i.e., the aircraft 
% maintains altitude and attitude as well as its velocity  

% trim state 1
MyTrimState_1.u     = 130;      % m/s
MyTrimState_1.q     = 0;        % rad/s
MyTrimState_1.Alt   = 4000;     % m

% trim state 2
MyTrimState_2.q     = 0;        % rad/s
MyTrimState_2.Alt   = 4000;     % m
MyTrimState_2.Theta = 0.096;    % rad

% trim state 3
MyTrimState_3.q     = 0;        % rad/s
MyTrimState_3.Alt   = 4000;     % m
MyTrimState_3.dt    = 0.7;      % rad