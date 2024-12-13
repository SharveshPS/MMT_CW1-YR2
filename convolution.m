clear;clc;
% Parameters
R = 100; % Resistance in ohms
L = 10e-3; % Inductance in henries
alpha = R / L; % Time constant
t = linspace(0, 5e-3, 1000); % Time vector

% Define S2(t)
S2 = zeros(size(t)); % Default to 0
S2(t >= 0 & t < 1e-3) = 0.5; % First interval (0 < t < 1e-3)
S2(t >= 1e-3 & t < 2e-3) = 1; % Second interval (1e-3 < t < 2e-3)
S2(t >= 2e-3) = 0; % Third interval (t > 2e-3)

% Define the impulse response h(t)
h = (R / L) * exp(-alpha * t);

% Perform convolution to find Vo(t)
dt = t(2) - t(1); % Time step
V_o = conv(S2, h) * dt; % Convolution
V_o = V_o(1:length(t)); % Adjust length to match t

% Plot the results
figure;
plot(t, V_o, 'b', 'LineWidth', 2); hold on;
plot(t, S2, 'r--', 'LineWidth', 1.5); % Plot input for reference
xlabel('Time (s)');
ylabel('Output Voltage V_o(t) (V)');
title('Time-Domain Waveform of V_o(t)');
grid on;
legend('Output V_o(t)', 'Input S_2(t)');
