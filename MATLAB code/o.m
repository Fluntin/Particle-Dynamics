% Define symbolic variables
syms A alpha m g M k f c

% Define the equation
eqn = A == ((alpha * m * g) / (m + M)) / sqrt(((k / (alpha * m)) - (2*pi*f)^2)^2 + ((c * 2*pi*f) / (m + M))^2);

% Solve the equation for k, returning conditions
[solution, conditions] = solve(eqn, k, 'ReturnConditions', true);

% Define specific values for the variables
values = {A, alpha, m, g, M, c, f};
specific_values = {0.0015, 0.3, 75, 9.81, 1000, 2500, 2};

% Substitute the specific values into the solution for k
k_value = subs(solution, values, specific_values);

% Substitute the specific values into the conditions
conditions_value = subs(conditions, values, specific_values);
