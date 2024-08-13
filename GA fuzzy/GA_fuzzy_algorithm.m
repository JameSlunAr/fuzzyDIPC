% Genetic algorithm to tune Fuzzy Logic Controller (FLC) for
% Double Inverted Pendulum on Cart (DIPC)

clear all, close all, clc

% Initialization

nvars = 364;
lb = -1*ones(1,364);
ub = ones(1,364);
Generations = 15;
PopulationSize = 15;

% GA Options

ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, 'PlotFcns', ...
        @gaplotbestf);

% Object Fuction

obj_fn = @(k) GA_fuzzy_cost(k);

% Pre process

open_system("GA_fuzzy_sim/Scope3");

% GA command

[kbest] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], ga_opt);

% Post process

GA_fuzzy_cost(kbest);
open_system("GA_fuzzy_sim/Scope3");