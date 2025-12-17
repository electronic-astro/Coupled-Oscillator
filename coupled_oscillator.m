%% Coupled Oscillators Simulation in MATLAB ( main code)


clear; clc; close all;

%% Parameters
% Masses
m1 = 1.0;
m2 = 1.5;

% Spring constants
k1 = 2.0;
k2 = 3.0;
k12 = 0.5;   % coupling spring constant

% Damping coefficients
c1 = 0.05;
c2 = 0.1;

%% Initial conditions
% [x1, v1, x2, v2]
x1_0 = 2.0;     % oscillator 1 initial position
v1_0 = 0.0;     % oscillator 1 initial velocity
x2_0 = 0.0;     % oscillator 2 initial position
v2_0 = 0.0;     % oscillator 2 initial velocity

X0 = [x1_0; v1_0; x2_0; v2_0];

%% Simulation parameters
tspan = [0 75];   % time range

%% Solve ODE system
[t, X] = ode45(@(t,X) coupled_osc(t, X, m1, m2, k1, k2, k12, c1, c2), tspan, X0);

%% Extract results
x1 = X(:,1);
v1 = X(:,2);
x2 = X(:,3);
v2 = X(:,4);

%% Compute coupling force
f_coupling = k12 * (x1 - x2);

%% Plot results
figure('Position', [100, 100, 800, 600]); %size


subplot(2,1,1)
plot(t, x1, 'Color', [0.85, 0.33, 0.10], 'LineWidth', 2);
hold on
plot(t, x2, 'Color', [0.30, 0.75, 0.93], 'LineWidth', 2);
xlabel('time [s]', 'FontSize', 12);
ylabel('Displacement', 'FontSize', 12);
title('Coupled Oscillators', 'FontSize', 14, 'FontWeight', 'bold');
legend('x_1(t) - Oscillator 1', 'x_2(t) - Oscillator 2', 'Location', 'northeast');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.2);


subplot(2,1,2)
plot(t, f_coupling, 'Color', [0.85, 0.33, 0.10], 'LineWidth', 2); 
xlabel('time [s]', 'FontSize', 12);
ylabel('f_e(t) - Coupling', 'FontSize', 12);
title('', 'FontSize', 14);
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.2);


sgtitle('Coupled Mass-Spring System with Damping', 'FontSize', 16, 'FontWeight', 'bold');
