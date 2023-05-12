function plot_max_displacement_contour()
function plot_max_displacement_contour_corrected()

% Parameters
M = 1000; % kg
alpha = 0.3;
delta_static = 0.05; % meters
c = 2500; % Ns/m
g = 9.81; % m/s^2

% Frequency and crowd size range
f_range = linspace(0.5, 5, 100); % Hz
m_range = linspace(0, 500, 100); % kg

% Initialize the matrix to store the maximum displacement values
max_displacement = zeros(length(f_range), length(m_range));

% Calculate the maximum displacement for each combination of frequency and crowd size
for i = 1:length(f_range)
    for j = 1:length(m_range)
        f = f_range(i);
        m = m_range(j);
        
        omega = 2*pi*f;
        k_r = alpha * (M + m);
        omega_n = sqrt(k_r / (M + m));
        beta = omega / omega_n;
        
        % Assume a constant damping ratio
        zeta = c / (2 * sqrt((M + m) * k_r));
        c_new = 2 * zeta * sqrt((M + m) * k_r);
        
        M_zeta = 1 / sqrt((1 - beta^2)^2 + (2 * zeta * beta)^2);
        
        X = M_zeta * delta_static;
        max_displacement(i, j) = delta_static + X;
    end
end

% Create a contour plot
[FF, MM] = meshgrid(f_range, m_range);
figure
contourf(FF, MM, max_displacement', 20)
colorbar
xlabel('Hopping Frequency (Hz)')
ylabel('Crowd Size (kg)')
title('Maximum Displacement Contour Plot (Corrected)')
grid on