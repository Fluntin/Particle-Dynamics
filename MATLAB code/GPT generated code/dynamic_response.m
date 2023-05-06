
%Define the given parameters:

M = 1000; % Mass of the structure in kg
m = 75; % Mass of the person in kg
alpha = 0.3; % Proportionality constant
delta = 0.05; % Static displacement in meters
c = 2500; % Damping coefficient in Ns/m
g = 9.81; % Acceleration due to gravity in m/s^2
f = 2; % Frequency of the football chant in Hz

% Calculate the natural frequency, angular frequency, and damping ratio:

% Calculate the stiffness using static displacement
k = (M + m) * g / delta;

% Calculate the natural frequency
wn = sqrt(k / M);

% Calculate the angular frequency
w = 2 * pi * f;

% Calculate the damping ratio
zeta = c / (2 * sqrt(M * k));

%Create a time vector and calculate the dynamic response:
t = linspace(0, 10, 1000); % Time vector from 0 to 10 seconds with 1000 points
X = amplitude(m, alpha, g, k, w, M); % Calculate the amplitude

% Calculate the phase angle
phi = atan((2 * zeta * wn * w) / (wn^2 - w^2));

% Calculate the steady-state response
x_ss = X * sin(w * t - phi);

%Plot the dynamic response:
figure;
plot(t, x_ss);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Dynamic Response of the Structure');

%Define a function that calculates the amplitude of the steady-state response:
function X = amplitude(m, alpha, g, k, w, M)
    X = (m * alpha * g) / (k - (w^2 * M));
end

