% Genetic algorithm to tune Fuzzy Logic Controller (FLC) for
% Double Inverted Pendulum on Cart (DIPC)

clear all; close all; clc

% Initialization

rng default;
n = 1;
nvars = 6;
lb = -300*[1 1 1 1 1 1];
ub = -lb;
Generations = 500;
PopulationSize = 40;
log = [0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0];
save("log_lqr.mat","log");
warning("off","all");
format short g;

% GA Options

% initialPopulation = [3.1623    5.1024 -105.9604   -3.9792  130.4668   20.5577;
%                      186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     186.0597  10.8857  -203.2106   -25.4072 -3.3594    -5.6054;
%                     0.0092    0.0013   -0.0006    0.0075    0.0054    0.0082;
%                    -0.0005    0.0011   -0.0064   -0.0070   -0.0053   -0.0002;
%                    -0.0057    0.0079    0.0086    0.0002    0.0018   -0.0004;
%                    -0.0030    0.0030    0.0000    0.0058   -0.0035    0.0065;
%                    -0.0036   -0.0015   -0.0050    0.0016   -0.0070   -0.0038;
%                     0.0046    0.0010   -0.0032   -0.0091   -0.0018   -0.0062];
                     
% ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
%         Generations, 'PopulationSize', PopulationSize, ...
%         'initialPopulation', initialPopulation, 'PlotFcns', ...
%         {@gaplotbestf,@gaplotscorediversity,@gaplotgenealogy,@gaplotscores});

ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, 'PlotFcns', ...
        {@gaplotbestf,@gaplotscorediversity,@gaplotgenealogy,@gaplotscores},...
        'MutationFcn', @mutationadaptfeasible, 'CrossoverFraction', 0, ...
        'EliteCount', 1, 'TolFun', 1e-50, 'ConstraintTolerance', 1e-50);

% Object Fuction

obj_fn = @(k) GA_LQR_cost(k);

% Pre process

open_system("GA_LQR_sim/Scope");

% GA command

[kbest,fval,exitflag,output,population] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], 1:6, ga_opt);

for i=2:n
    load("log_lqr.mat");
    population(20)=kbest;
    ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, 'PlotFcns', ...
        {@gaplotbestf,@gaplotscorediversity,@gaplotgenealogy,@gaplotscores},...
        'initialPopulation', population, 'MutationFcn', {@mutationgaussian,1,.5});
    [kbest,fval,exitflag,output,population] = ga(obj_fn, nvars, [], [], [], [], lb, ub, [], 1:6, ga_opt);
end
% Post process

load("log_lqr.mat");
log(1:2,:)=[];
save("log_lqr.mat","log");
GA_LQR_cost(kbest);
open_system("GA_LQR_sim/Scope");

% kbest = [3.3594    5.6054 -186.0597  -10.8857  203.2106   25.4072]