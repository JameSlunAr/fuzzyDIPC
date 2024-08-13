function cost = GA_PID_cost(k)

assignin("base", "Ktest", k);
sim ("GA_PID_sim.slx");

% k
cost = ITSE(length(ITSE))

load("log.mat");
log = [log;log(length(log(:,1)),1)+1 k(1) k(2) k(3) cost];
save("log.mat","log");
clc;
log
end