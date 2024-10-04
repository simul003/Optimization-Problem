 
function [c, ceq] = springConstraints(x)
    d = x(1); % Wire diameter
    D = x(2); % Coil diameter
    N = x(3); % Number of turns

    % Material properties
    G = 12e6; % Shear modulus in psi
    F = 1250; % Load in lb
    K = 1.05; % Shear stress correction factor
    g = 386.09; % Acceleration due to gravity in in/s^2
    rho = 0.3; % Weight density in lb/in^3

    % Spring stiffness (k)
    k = (d^4 * G) / (8 * D^3 * N);

    % Shear stress (tau)
    tau = (8 * F * D * K) / (pi * d^3);

    % Deflection (delta)
    delta = F / k;

    % Natural Frequency (f_n)
    w = rho * pi^2 * D * d^2 * N / 4; % Weight of the spring in lb
    fn = 0.5 * sqrt((k * g) / w); % Natural frequency considering g

    % Constraints (c <= 0)
    c = [delta - 0.1;
        tau - 9999.9999;          % Shear stress should be <= 10000 psi
                   % Deflection should be <= 0.1 in
         100 - fn;             % Natural frequency should be >= 100 Hz (fn > 100)
         d*3 -  D
        % -(d*12 -  D)
          ];        % Coil diameter D should be at least 3 times the wire diameter d (D >= 3d)

    % No equality constraints
    ceq = [];
end