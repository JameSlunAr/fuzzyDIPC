% Genetic algorithm to tune Fuzzy Logic Controller (FLC) for
% Double Inverted Pendulum on Cart (DIPC)

clear all, close all, clc

% Initialization

nvars = 6;
lb = [-300 -300 -300 -300 -300 -300];
ub = [300 300 300 300 300 300];
Generations = 40;
PopulationSize = 50;
log = [0 0;0 0]
save("log.mat","log");
warning("off","all");

% GA Options

% initialPopulation = [65.5766  55.6466  -35.5623   4.8813  89.4512   62.1322;
%                      65.5766  54.8966  -35.5623   4.7563  89.2012   62.3822;
%                      65.5766  55.3966  -35.5623   4.7563  89.2012   62.1322;
%                      65.5766  55.7716  -35.5623   5.2563  89.4512   61.8822;
%                      66.5766  55.3966  -35.3123   5.2563  87.7012   61.6322;
%                      65.5766  54.3966  -35.5623   6.2563  87.7012   61.6322;
%                      1.0000    2.6523 -187.4464  -13.3857  201.3376   26.9228;
%                      65.5766  54.3966  -34.5623   88.4213 88.7012   62.6322;
%                      65.5766  75.1140  -35.5623   5.2563  87.7012   61.6322;
%                      65.5766  54.8966  -34.5623   3.2563  16.6131   62.6322;
%                      65.5766  55.3966  -35.5623   5.2563  88.7012   61.6322;
%                      65.5766  55.3966  -35.5623   5.2563  88.7012   61.6322;
%                      66.0766  55.3966  -34.5623   3.2563  16.6131   62.1322;
%                      66.0766  54.3966  -33.5623   3.2563  16.6131   62.1322;
%                      66.0766  54.3966  -35.5623   5.2563  16.6131   61.6322;
%                      100      100      100        100     100       100;
%                      -100     -100     -100       -100    -100      -100;
%                      50       50       50         50      50        50;
%                      -50      -50      -50        -50     -50       -50;
%                      100      100      -100       -100    -100      -100];

ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, 'PlotFcns', ...
        @gaplotbestf);

% ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
%         Generations, 'PopulationSize', PopulationSize, ...
%         'initialPopulation', initialPopulation, ...
%         'PlotFcns', @gaplotbestf);

% Object Fuction

obj_fn = @(k) GA_DIPC_cost(k);

% Pre process

open_system("GA_DIPC_sim/Scope1");

% GA command

[kbest] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], ga_opt);

% Post process

% GA_DIPC_cost(kbest);
% open_system("GA_DIPC_sim/Scope1");

% kbest = [3.3594    5.6054 -186.0597  -10.8857  203.2106   25.4072]