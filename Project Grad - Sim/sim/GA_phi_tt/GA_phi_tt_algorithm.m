% Genetic algorithm to tune PID_phi Controller for UAV

clear all, close all, clc

% Initialization

rng default;
nvars = 4;
lb = [-300 -100 -100 -100];
ub = [300 100 100 100];
Generations = 50;
PopulationSize = 25;
log_phi = [0 0 0 0 0 0;0 0 0 0 0 0];
save("log_phi.mat","log_phi");
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

obj_fn = @(k) GA_phi_tt_cost(k);

% Pre process

% open_system("GA_DIPC_sim/Scope1");

% GA command

% [kbest] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], ga_opt);

tic
[kbest,fval,exitflag,output,population] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], 1:4, ga_opt)
toc

% Post process

% GA_DIPC_cost(kbest);
% open_system("GA_DIPC_sim/Scope1");