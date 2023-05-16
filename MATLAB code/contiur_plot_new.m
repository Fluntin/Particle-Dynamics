function contour_plot_new()

    M = 1000; % kg
    alpha = 0.3;
    %delta_0 = 0.05; % m (convert cm to m)
    c = 2500; % Ns/m
    g = 9.81; % m/s^2
    k = 210915; %N/m => Got it from the original by using k=((m+M)*g)/delta_0

    f = linspace(1, 5, 100); % Hz, updated range from 1 to 5
    m = linspace(0, 750, 100); % kg, updated range from 75 to 750
    delta=((m+M).*g)./k;


    % Calculate omega and omega_n
    [X, Y] = meshgrid(f, m);
    omega = 2 * pi * X; % Calculate omega using X instead of f

    Z = delta + ((alpha * Y * g) ./ (Y + M)) ./ sqrt((g ./ delta - omega.^2).^2 + ((c * omega) ./ (Y + M)).^2);
    
    surf(X, Y, Z);
    contourf(X, Y, Z);

end
