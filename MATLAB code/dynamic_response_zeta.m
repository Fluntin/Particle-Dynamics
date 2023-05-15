function dynamic_response_zeta()

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

    % Calculate the amplitude A
    A = ((alpha * m * g)/(m+M)) / sqrt((g/delta_0 - omega^2)^2 + (c*omega/(m+M))^2);

    % Calculate the static response K
    K = delta_0;

    % Time range for plotting
    t = linspace(0, 10, 1000); % 0 to 10 seconds with 1000 points

    % Calculate the dynamic response
    y = -K + A * sin(omega * t);

    %----------Plot for the value of k= 6.5651*1.0e+03----------
    zeta = 0.3734;

    %New A => with the zeta = 0.3734
    A_new = ((alpha * m * g * delta_0) / ((m + M) * g)) / sqrt((1 - ((omega^2 * delta_0) / g))^2 + ((4 * zeta^2 * omega^2 * delta_0) / g));

    % Calculate new dynamic response
    y_new = -delta_0 + A_new * sin(omega * t);
    %----------------------------------------------------------

    % Plot the dynamic response
    subplot(2, 1, 1);
    plot(t, y);
    hold on
    plot(t, y_new, 'g--');
    xlabel('Time (s)');
    ylabel('Displacement (m)');
    title('Dynamic Response of the Structure');
    hold on
    plot(t, -delta_0 * ones(size(t)), 'r--');
    hold on
    plot(t, -delta_0 * ones(size(t)), 'b--');
    legend('Dynamic Response for old zeta', 'Dynamic Response for new zeta');
    hold off

    % Delta range for plotting
    delta_set = linspace(0.005, 1.5, 1000);

    % New omega_n
    omega_new = sqrt(g ./delta_set);

    % New Amplitude
    A_delta = ((alpha * m * g) ./ (m + M)) ./ sqrt((g ./ delta_set - omega^2).^2 + (c * omega ./ (m + M)).^2);

    % Calculate A_delta/delta_set
    A_delta_ratio = A_delta ./ delta_set;

    % Plot A_delta/delta_set vs. omega/omega_new
    subplot(2, 1, 2);
    plot(omega ./ omega_new, A_delta_ratio);
    xlabel('\omega / \omega_{new}');
    ylabel('A_{\delta} / \delta_{set}');
    title('Amplitude Ratio vs. Frequency Ratio');




end