function validateSolution(x)
    d = x(1);
    D = x(2);
    N = x(3);
    
    % Given parameters
    G = 12e6; % psi
    F = 1250; % lb
    K = 1.05;
    g = 386.09; % in/s^2
    rho = 0.3; % lb/in^3

    % Recalculate stiffness
    k = (d^4 * G) / (8 * D^3 * N);
    
    % Recalculate shear stress
    tau = (8 * F * D * K) / (pi * d^3);
    
    % Recalculate deflection
    delta = F / k;
    
    % Recalculate weight
    volume = 0.25 * pi^2 * D * N * d^2;
    weight = rho * volume;
    
    % Recalculate natural frequency
    w = rho * pi^2 * D * d^2 * N / 4;
    fn = 0.5 * sqrt((k * g) / w);
    
    % Display results
    fprintf('Validation Results:\n');
    fprintf('Shear stress (tau) = %.2f psi\n', tau);
    fprintf('Deflection (delta) = %.4f in\n', delta);
    fprintf('Natural frequency (fn) = %.2f Hz\n', fn);
    fprintf('Weight = %.4f lb\n', weight);
    
    % Individual constraint checks
    disp('--------------------------------------');
    
    % Shear stress constraint (tau <= 10000 psi)
    if tau <= 10000
        disp('Shear stress constraint is satisfied.');
    else
        disp('Shear stress constraint is NOT satisfied.');
    end
    
    % Deflection constraint (delta <= 0.1 in)
    if delta <= 0.1
        disp('Deflection constraint is satisfied.');
    else
        disp('Deflection constraint is NOT satisfied.');
    end
    
    % Natural frequency constraint (fn >= 100 Hz)
    if fn >= 100
        disp('Natural frequency constraint is satisfied.');
    else
        disp('Natural frequency constraint is NOT satisfied.');
    end
    
    % Diameter ratio constraint (D >= 3 * d)
    if D >= 3 * d
        disp('Diameter ratio constraint (D >= 3 * d) is satisfied.');
    else
        disp('Diameter ratio constraint (D >= 3 * d) is NOT satisfied.');
    end
    
    disp('--------------------------------------');
end
