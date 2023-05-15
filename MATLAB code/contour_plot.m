
function contour_plot()

    M = 1000; % kg
    alpha = 0.3;
    delta_0 = 0.05; % m (convert cm to m)
    c = 2500; % Ns/m
    g = 9.81; % m/s^2

    f = linspace(1, 5, 100); % Hz, updated range from 1 to 5
    m = linspace(0, 750, 100); % kg, updated range from 75 to 750

    % Calculate omega and omega_n
    [X, Y] = meshgrid(f, m);
    omega = 2 * pi * X; % Calculate omega using X instead of f

    Z = delta_0 + ((alpha * Y * g) ./ (Y + M)) ./ sqrt((g / delta_0 - omega.^2).^2 + ((c * omega) ./ (Y + M)).^2);
    
    surf(X, Y, Z);
    contourf(X, Y, Z);

end

