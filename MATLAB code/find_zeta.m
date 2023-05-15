% Define symbolic variables
syms zeta 

% Define set variables
delta_0=0.05; %m
g = 9.82;
m = 75;
M = 1000;
alpha = 0.3;
f = 2;
omega = 2*pi*f;

% Define the amplitude formula
amp_formula = ((alpha * m * g * delta_0) / ((m + M) * g)) / sqrt((1 - ((omega^2 * delta_0) / g))^2 + ((4 * zeta^2 * omega^2 * delta_0) / g));

% Set amplitude to A = 0.0015
A = 0.0015;
eqn = A == amp_formula;

% Solve the equation for zeta
zeta_sym = solve(eqn, zeta);

% Convert the symbolic solution to a numeric value
zeta_val = double(zeta_sym)
