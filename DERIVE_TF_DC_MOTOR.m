% Define the sampling time and duration
load("data.mat");

%% DC motor transfer function system identification
voltage = data(:,2);
t = data(:,1);
angle = data(:,3);

% Plot voltage and angle
figure;
subplot(2,1,1);
plot(t, voltage);
xlabel('Time (s)');
ylabel('Voltage');
ylim([-2, 2]);
title('Voltage vs Time');

subplot(2,1,2);
plot(t, angle);
xlabel('Time (s)');
ylabel('Angle');
ylim([-10, 60]);
title('Angle vs Time');

sys = tfest(voltage, angle, 1, 0, 0.01); 
compare(voltage, angle, sys);

%% plant transfer function
s = tf('s');

% Given parameters
m = 0.15;
R = 0.01;
g = -9.8;
J = 9.99e-6;

% Define the symbolic expression
tf_plant = -(m*g /(J/R^2 + m))*1/(s^2);

%% Ball and beam modelling
m = 0.15;
R = 0.01;
g = -9.8;
J = 9.99e-6;

H = -m*g/(J/(R^2)+m);

A = [0 1 0 0
     0 0 H 0
     0 0 0 1
     0 0 0 0];
B = [0;0;0;1];
C = [1 0 0 0];
D = [0];

ss_plant = ss(A,B,C,D);

%% combine tf_plant with tf_motor
tf_motor = tf(sys);
tf_G = tf_motor * tf_plant;

%% state space
% Convert to state-space representation
[A, B, C, D] = tf2ss(tf_G.Numerator{1}, tf_G.Denominator{1});

%% open loop response
t = 0:0.01:5;
u = 0.25*ones(size(t));
sys_cl = ss(A,B,C,D);
[y,t,x] = lsim(sys_cl,u,t);
plot(t,y)

%% pole placement
p1 = -2+2i;
p2 = -2-2i;
p3 = -20;

K = place(A, B, [p1,p2,p3])

t = 0:0.01:5;
u = 0.25*ones(size(t));
sys_cl = ss(A-B*K,B,C,D);
[y,t,x] = lsim(sys_cl,u,t);
plot(t,y)

%% designing the controller

% Convert to transfer function
[num, den] = ss2tf(A-B*K,B,C,D);

% Display the transfer function
tf_sys = tf(num, den);

C = pidtune(tf_sys, 'pidf', 6);
Cd = c2d(C, 0.01);

