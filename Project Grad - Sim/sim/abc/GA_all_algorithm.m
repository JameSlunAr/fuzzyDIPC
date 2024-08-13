% Genetic algorithm to tune PID Controller for UAV

clear all, close all, clc

% Initialization

rng default;
nvars = 6;
lb = -1000*[1 1 1 1 1 1 1 1 1 1 1 1];
ub = -lb;
Generations = 70;
PopulationSize = 30;
log_all = [0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0];
save("log_all.mat","log_all");
warning("off","all");
format short g;
% load('iniPop_after1st.mat');
% initialPopulation = 100*iniPop_after1st;
      
% GA Options

ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, 'PlotFcns', ...
        @gaplotbestf, 'MutationFcn', @mutationadaptfeasible, ...
        'CrossoverFraction', 0.2, 'EliteCount', 2, 'TolFun', 1e-50, ...
        'ConstraintTolerance', 1e-50);

% Object Fuction

obj_fn = @(k) GA_all_cost(k);

% Pre process

% open_system("GA_DIPC_sim/Scope1");

% GA command

% [kbest] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], ga_opt);

tic
[kbest,fval,exitflag,output,population] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], 1:6, ga_opt)
toc

% Post process

% GA_DIPC_cost(kbest);
% open_system("GA_DIPC_sim/Scope1");

[100 500 100 500 100 500].*[5.84 0.836 2.33 0.756 1 0.302]