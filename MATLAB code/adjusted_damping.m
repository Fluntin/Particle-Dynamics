function adjusted_damping()
    % Define the given parameters
    M = 1000; % Mass of the structure in kg
    m = 75; % Mass of the person in kg
    alpha = 0.3; % Proportionality constant
    delta = 0.05; % Static displacement in meters
    c = 2500; % Damping coefficient in Ns/m
    g = 9.81; % Acceleration due to gravity in m/s^2
    f = 2; % Frequency of the football chant in Hz

    % Calculate the stiffness, natural frequency, and angular frequency
    k = (M + m) * g / delta;
    wn = sqrt(k / M);
    w = 2 * pi * f;

    % Calculate the new damping ratio
    X_max = 1.5e-3; % Maximum allowed amplitude in meters
    zeta_min = (1 / (2 * wn * w)) * sqrt(((m * alpha * g)^2 / (X_max^2)) - (k - 4 * pi^2 * f^2 * M)^2);

    % Calculate the new damping coefficient
    c_new = 2 * zeta_min * sqrt(M * k);

    % Calculate the new amplitude
    X_new_zeta = amplitude(m, alpha, g, k, w, M);

    % Calculate the new phase angle
    phi_new_zeta = atan((2 * zeta_min * wn * w) / (wn^2 - w^2));

    % Calculate the new steady-state response
    t = linspace(0, 10, 1000);
    x_ss_new_zeta = X_new_zeta * sin(w * t - phi_new_zeta);

    % Plot the dynamic response of the adjusted structure
    figure;
    plot(t, x_ss_new_zeta);
    xlabel('Time (s)');
    ylabel('Displacement (m)');
    title('Dynamic Response with Adjusted Damping Factor');
end

function X = amplitude(m, alpha, g, k, w, M)
    X = (m * alpha * g) / (k - (w^2 * M));
end
