
% Objective Function: Minimize the Weight of the Spring
function weight = springWeight(x)
    d = x(1); % Wire diameter
    D = x(2); % Coil diameter
    N = x(3); % Number of turns

    % Material properties
    rho = 0.3; % Weight density in lb/in^3

    % Volume of the spring
    volume = pi^2 * D * d^2 * N / 4;

    % Weight of the spring
    weight = rho * volume;
end