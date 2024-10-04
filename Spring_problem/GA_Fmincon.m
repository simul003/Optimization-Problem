 % Initial guess for [d, D, N]
    x0 = [0.1, 1, 10];

    % Lower and upper bounds for [d, D, N]
    lb = [0.01, 0.5, 5]; % Lower bounds

    ub = [1.5, 5, 50]; % Upper bounds

    % Optimization options
    options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');

    % Solve the optimization problem using fmincon
    [x_opt, fval] = fmincon(@springWeight, x0, [], [], [], [], lb, ub, @springConstraints, options);

    % Display the optimal solution from fmincon
    disp('Optimal solution using fmincon:');
    disp(['d = ', num2str(x_opt(1)), ' in']);
    disp(['D = ', num2str(x_opt(2)), ' in']);
    disp(['N = ', num2str(x_opt(3))]);
    disp(['Minimum weight = ', num2str(fval), ' lb']);

validateSolution(x_opt)

    % Solve using genetic algorithm
    options_ga = optimoptions('ga', 'Display', 'iter');
    [x_opt_ga, fval_ga] = ga(@springWeight, 3, [], [], [], [], lb, ub, @springConstraints, options_ga);

    % Display the optimal solution from GA
    disp('Optimal solution using GA:');
    disp(['d = ', num2str(x_opt_ga(1)), ' in']);
    disp(['D = ', num2str(x_opt_ga(2)), ' in']);
    disp(['N = ', num2str(x_opt_ga(3))]);
    disp(['Minimum weight using GA = ', num2str(fval_ga), ' lb']);

validateSolution(x_opt_ga)