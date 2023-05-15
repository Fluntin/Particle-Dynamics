% Define symbolic variables
syms k

% Define set variables
g = 9.82;
m = 75;
M = 1000;
A = 0.0015;
alpha = 0.3;
f = 2;
c = 2500;
omega = 2*pi*f;

% Define the equation
eqn = A == ((alpha * m * g) / (m + M)) / sqrt(((k / (alpha * m)) - omega^2)^2 + ((c * omega) / (m + M))^2);

% Solve the equation for k
k_val = double(solve(eqn, k))
