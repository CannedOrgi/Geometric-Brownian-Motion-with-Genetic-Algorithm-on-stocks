%% Problem settings
[nProcess, sharpes] = Data_Sharpes;
lb = zeros(1, nProcess);  % Lower bound
ub = ones(1, nProcess);   % Upper bound
Aeq = ones(1, nProcess);  % All weights should sum to one
beq = 1;                  % Sum of weights = 1

%% Algorithm parameters
Np = 50;                  % Increased Population Size
T = 100;                  % Number of iterations

% Adjusting options
options = optimoptions('ga', 'PopulationSize', Np, 'MaxGenerations', T, 'Display', 'iter', 'PlotFcn', @gaplotbestf, 'FunctionTolerance', 1e-6);

% Defining the objective function
objFun = @(weights) objectiveFunction(weights, sharpes);

% Running the GA
[bestWeights, bestFval] = ga(objFun, nProcess, [], [], Aeq, beq, lb, ub, [], options);
