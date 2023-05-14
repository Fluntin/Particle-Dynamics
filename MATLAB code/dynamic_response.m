function dynamic_response()

    M = 1000; % kg
    m = 75; % kg
    alpha = 0.3;
    delta_0 = 0.05; % m (convert cm to m)
    c = 2500; % Ns/m
    g = 9.81; % m/s^2
    f = 2; % Hz

    % Calculate omega and omega_n
    omega = 2 * pi * f;
    omega_n = sqrt(g / delta_0);

    % Calculate zeta
    zeta=c/((M+m)*2*omega_n);


    % Calculate the amplitude A and phase angle alpha
    A = ((alpha * m * g)/(m+M)) / sqrt((g/delta_0 - omega^2)^2 + (c*omega/(m+M))^2);
    %alpha = atan2(2 * zeta * omega_n * omega * A, omega_n^2 - omega^2);

    % Calculate the static response K
    K = delta_0;

    % Time range for plotting
    t = linspace(0, 10, 1000); % 0 to 10 seconds with 1000 points

    % Calculate the dynamic response
    y = K + A * sin(omega * t);

    % Plot the dynamic response
    plot(t, y)
    xlabel('Time (s)')
    ylabel('Displacement (m)')
    title('Dynamic Response of the Structure')
    hold on
    plot(t, K * ones(size(t)), 'r--')
    legend('Dynamic Response', 'Static Response')
    hold off
end

