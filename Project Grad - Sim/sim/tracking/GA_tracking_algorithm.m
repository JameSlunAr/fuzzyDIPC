% Genetic algorithm to tune PID Controller for UAV

clear all, close all, clc

% Initialization

rng default;
nvars = 8;
lb = -1000*ones(1,nvars);
ub = -lb;
Generations = 50;
PopulationSize = 25;
log_tracking = zeros(2,nvars+2);
save("log_tracking.mat","log_tracking");
warning("off","all");
format short g;
% load('iniPop_after1st.mat');  
% initialPopulation = 100*iniPop_after1st;
      
% GA Options

ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, ...
        'MutationFcn', @mutationadaptfeasible, ...
        'CrossoverFraction', 0.2, 'EliteCount', 2, 'TolFun', 1e-50, ...
        'ConstraintTolerance', 1e-50);

% Object Fuction

obj_fn = @(k) GA_tracking_cost(k);

% Pre process

% open_system("GA_DIPC_sim/Scope1");

% GA command

% [kbest] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], ga_opt);

tic
[kbest] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], 1:nvars, ga_opt)
toc

% Post process

% GA_DIPC_cost(kbest);
% open_system("GA_DIPC_sim/Scope1");