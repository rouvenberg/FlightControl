%% Aircraft Model Parameters

% define the interfaces
load BusObjects_LonMot.mat

% check simulation step size
CNT_StepSize=1E-3;

%% Trim Point

TrimPoint.States.debar = deg2rad(-6.8640);
TrimPoint.States.dtbar = 0.185;

TrimPoint.States.X_P = 2000;

TrimPoint.States.Thetabar = deg2rad(4);

TrimPoint.States.Altbar   = 3000;

TrimPoint.States.ubar = 120*cos(TrimPoint.States.Thetabar);
TrimPoint.States.wbar = 120*sin(TrimPoint.States.Thetabar);  

TrimPoint.States.qbar = deg2rad(0);


%% Inertia

% inertia tensor: around body-fixed y axis in "kg*m^2"
Iyy = 280550; 

%Gravitational acceleration in "m/s^2"
CNT_g = 9.81;  

% aircraft mass in "kg" 
CNT_m = 15900; 

%% Propulsion

% look-up table to compute thrust
Propulsion.LUT.LUT_dt  = [-0.8:0.1:1];                                      % in "-" (normalized)
Propulsion.LUT.LUT_Alt = [2000;8000];                                       % in "m"
Propulsion.LUT.LUT_V_A = [90;200];                                          % in "m/s"

k = 1.00;                                                                   % temporary scaling factor
Propulsion.LUT.LUT_X_P(:,:,1)=k.*[1640,-343;2816,1244];
Propulsion.LUT.LUT_X_P(:,:,2)=k.*[1640,-343;2816,1244];
Propulsion.LUT.LUT_X_P(:,:,3)=k.*[1640,-343;2816,1244];
Propulsion.LUT.LUT_X_P(:,:,4)=k.*[2077,-85;2816,1244];
Propulsion.LUT.LUT_X_P(:,:,5)=k.*[3386,1032;3475,1833];
Propulsion.LUT.LUT_X_P(:,:,6)=k.*[4607,2042;4335,2610];
Propulsion.LUT.LUT_X_P(:,:,7)=k.*[6044,3268;5061,3263];
Propulsion.LUT.LUT_X_P(:,:,8)=k.*[7511,4452;5977,4119];
Propulsion.LUT.LUT_X_P(:,:,9)=k.*[9174,5983;6870,4932];
Propulsion.LUT.LUT_X_P(:,:,10)=k.*[10744,7271;7687,5669];
Propulsion.LUT.LUT_X_P(:,:,11)=k.*[12458,8892;8518,6478];
Propulsion.LUT.LUT_X_P(:,:,12)=k.*[14574,10806;9442,7423];
Propulsion.LUT.LUT_X_P(:,:,13)=k.*[16780,12799;10179,8397];
Propulsion.LUT.LUT_X_P(:,:,14)=k.*[18736,14701;10875,9215];
Propulsion.LUT.LUT_X_P(:,:,15)=k.*[20883,16795;11509,9982];
Propulsion.LUT.LUT_X_P(:,:,16)=k.*[22384,18750;12105,10744];
Propulsion.LUT.LUT_X_P(:,:,17)=k.*[23705,20108;12712,11434];
Propulsion.LUT.LUT_X_P(:,:,18)=k.*[25050,21432;13323,12079];
Propulsion.LUT.LUT_X_P(:,:,19)=k.*[26243,22779;13933,12728];
clear k

% location of left engine wrt. cg: [x,y,z] in "m"
Propulsion.rr_P1_f = [-1.448;-3;-0.533]; 

% location of right engine wrt. cg: [x,y,z] in "m"
Propulsion.rr_P2_f = [-1.448; 3;-0.533];   

% engine inclination angle in "rad"
Propulsion.CNT_kappa = 3*pi/180;       

%% Aerodynamics

% reference area in "m^2"
Aerodynamics.S = 64;      

% mean aerodynamic chord in "m"
Aerodynamics.cbar = 3.16;   

% look-up table for air density
Aerodynamics.LUT_rho = [1.16438645958276, 1.05543269917814, 0.954457178414045, 0.861045612606227, 0.774795981693757	0.695318454434115, 0.622235311201119, 0.555180865323805, 0.493801382899880, 0.437755001012510, 0.386711644273802, 0.340352939612400];
Aerodynamics.LUT_Alt = [0:1000:11000];

% lift parameters
Aerodynamics.Ca_L0 = 0.07;  
Aerodynamics.Ca_La = 4.7;
Aerodynamics.Ca_Lq = 7.6; 
Aerodynamics.Ca_Lde = 0.365;

% drag parameters
Aerodynamics.Ca_D0 = 0.01; 
Aerodynamics.Ca_Da = 0.21;
Aerodynamics.Ca_Da2 = 0.65;

% pitching moment parameters
Aerodynamics.Ca_m0 = -0.15; 
Aerodynamics.Ca_ma = -1.2;
Aerodynamics.Ca_mq = -10;
Aerodynamics.Ca_mde = -2.05;

