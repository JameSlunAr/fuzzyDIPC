function cost = GA_LQR_cost(k)
assignin("base", "Klqr", k);
sim ("GA_LQR_sim.slx");
% k
cost = ITSE(length(ITSE));
load("log_lqr.mat");
log = [log;log(length(log(:,1)))+1 cost [k]];
save("log_lqr.mat","log");
clc;
log
end