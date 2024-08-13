% Genetic algorithm to tune Fuzzy Logic Controller (FLC) for
% tested PID model

% clear all, close all , clc

% Initialization

nvars = 3;
lb = [0 0 0];
ub = [.5 10 .5];
Generations = 20;
PopulationSize = 25;
tsim = 10;
log = zeros(2,nvars+2);
save("log.mat","log");
a = rand(PopulationSize,nvars);

% GA Options

ga_opt = optimoptions(@ga, 'Display', 'off', 'Generations', ...
        Generations, 'PopulationSize', PopulationSize, 'initialPopulation', a, 'PlotFcns', @gaplotbestf);

% Object Fuction

obj_fn = @(k) GA_PID_cost(k);

% Pre process

open_system("GA_PID_sim/Scope");

% GA command

[kbest, fval,exitflag,output,population,scores] = ga(obj_fn, nvars, [] , [], [], [], lb, ub, [], ga_opt)

% Post process

% GA_PID_cost(kbest);
% open_system("GA_PID_sim/Scope");

% figure;
% set(gcf,'Name','A');

% load("GA_PID_history.mat");
% history_cost(1) = [];
% history_cost = reshape(history_cost, PopulationSize, []);
% for k=1:Generations
%     sortedcost(:,k) = sort(history_cost(:,k));
% end
% imagesc(log(sortedcost(:,1:Generations)))
% colorbar
% set(gcf,'PaperPositionMode','auto');

% figure;
% imagesc(log(sortedcost(:,1:Generations)))
% set(gcf,'PaperPositionMode','auto'); 