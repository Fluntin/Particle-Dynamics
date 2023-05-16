function contour_plot()

    M = 1000; % kg
    alpha = 0.3;
    %delta_0 = 0.05; % m (convert cm to m)
    c = 2500; % Ns/m
    g = 9.81; % m/s^2
    k = 210915; %N/m => Got it from the original by using k=((m+M)*g)/delta_0

    f = linspace(1, 5, 1000); % Hz, updated range from 1 to 5
    m = linspace(0, 750, 1000); % kg, updated range from 75 to 750
    delta=((m+M).*g)./k;


    % Calculate omega and omega_n
    [Frekvens, masa] = meshgrid(f, m);
    omega = 2 * pi * Frekvens; % Calculate omega using X instead of f

    Amplitude = ((alpha * masa * g) ./ (masa + M)) ./ sqrt((g ./ delta - omega.^2).^2 + ((c * omega) ./ (masa + M)).^2);
    Displacment = delta + Amplitude;

    surf(Frekvens, masa, Displacment);
    contourf(Frekvens, masa, Displacment);

end
