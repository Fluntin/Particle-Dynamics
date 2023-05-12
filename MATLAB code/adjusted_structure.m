function adjusted_structure()
    % Define the given parameters
    M = 1000; % Mass of the structure in kg
    m = 75; % Mass of the person in kg
    alpha = 0.3; % Proportionality constant
    delta = 0.05; % Static displacement in meters
    c = 2500; % Damping coefficient in Ns/m
    g = 9.81; % Acceleration due to gravity in m/s^2
    f = 2; % Frequency of the football chant in Hz

    % Calculate the stiffness
    k = (M + m) * g / delta;
    
    % Calculate the angular frequency
    w = 2 * pi * f;

    % Calculate the new stiffness
    X_max = 1.5e-3; % Maximum allowed amplitude in meters
    k_new = m * alpha * g / X_max + 4 * pi^2 * f^2 * M;

    % Calculate the new natural frequency
    wn_new = sqrt(k_new / M);

    % Calculate the new damping ratio
    zeta_new = c / (2 * sqrt(M * k_new));

    % Calculate the new amplitude
    X_new = amplitude(m, alpha, g, k_new, w, M);

    % Calculate the new phase angle
    phi_new = atan((2 * zeta_new * wn_new * w) / (wn_new^2 - w^2));

    % Calculate the new steady-state response
    t = linspace(0, 10, 1000);
    x_ss_new = X_new * sin(w * t - phi_new);

    % Plot the dynamic response of the adjusted structure
    figure;
    plot(t, x_ss_new);
    xlabel('Time (s)');
    ylabel('Displacement (m)');
    title('Dynamic Response of the Adjusted Structure');
end

function X = amplitude(m, alpha, g, k, w, M)
    X = (m * alpha * g) / (k - (w^2 * M));
end

