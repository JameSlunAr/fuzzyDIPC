% GA swing up first pend

clear all, close all, clc

% Initialization

nvars = 3;
ub = [10 10 10];
lb = [0 0 0];
Generations = 20;
PopulationSize = 20;

% GA Options

ga_opt = optimoptions(@ga, 'Display', 'diagnose', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, 'PlotFcns', ...
        @gaplotbestf);

% Object Fuction

obj_fn = @(k) GA_firstpend_cost(k);

% Pre process

open_system("swu_DIPC_6o_sim/Scope");

% GA command

[kbest] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], ga_opt);

% Post process