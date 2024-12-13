clear;clc;
% Parameters
R = 100;           % Resistance in ohms
L = 10e-3;         % Inductance in henries
t = linspace(0, 5e-4, 1000); % Time vector from 0 to 0.5 ms

% Impulse response
h = (R/L) * exp(-R/L * t);

% Plot
figure;
plot(t * 1e6, h, 'LineWidth', 1.5); % Convert time to microseconds for the plot
grid on;
xlabel('Time (\mus)');
ylabel('Amplitude');
title('Computed Impulse Response of the RL Circuit');
legend('s(t) = 10,000 \cdot e^{-10,000t}');
