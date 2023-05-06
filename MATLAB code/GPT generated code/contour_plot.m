function contour_plot()
    % Define the given parameters
    M = 1000; % Mass of the structure in kg
    alpha = 0.3; % Proportionality constant
    delta = 0.05; % Static displacement in meters
    c = 2500; % Damping coefficient in Ns/m
    g = 9.81; % Acceleration due to gravity in m/s^2

    % Define the range of hopping frequencies and crowd sizes
    f_range = linspace(0.5, 5, 100); % Hopping frequencies from 0.5 to 5 Hz
    m_range = linspace(1, 500, 100) * 75; % Crowd sizes from 1 to 500 persons, each with mass 75 kg

    % Create a grid for the hopping frequencies and crowd sizes
    [F, M_crowd] = meshgrid(f_range, m_range);

    % Calculate the stiffness, natural frequency, and angular frequency
    k = (M + M_crowd) * g / delta;
    wn = sqrt(k ./ M);
    w = 2 * pi * F;

    % Calculate the damping ratio
    zeta = c ./ (2 .* sqrt(M .* k));

    % Calculate the amplitude X
    X = amplitude(M_crowd, alpha, g, k, w, M, wn, zeta);

    % Calculate the maximum displacement (delta + X)
    max_disp = delta + X;

    % Create the contour plot
    figure;
    contourf(F, M_crowd/75, max_disp, 20); % Contour plot with 20 levels
    xlabel('Hopping Frequency (Hz)');
    ylabel('Crowd Size (persons)');
    title('Maximum Displacement (m) as a Function of Hopping Frequency and Crowd Size');
    colorbar;
end

function X = amplitude(m, alpha, g, k, w, M, wn, zeta)
    X = (m .* alpha .* g) ./ sqrt((k - (w.^2 .* M)).^2 + (2 .* zeta .* wn .* w).^2);
end
