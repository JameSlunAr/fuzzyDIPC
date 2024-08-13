function cost = GA_DIPC_cost(k)
assignin("base", "K", k);
sim ("GA_DIPC_sim.slx");
% k
cost = ITSE(length(ITSE));
load("log.mat");
log = [log;log(length(log),1)+1 cost];
save("log.mat","log");
clc;
log
end