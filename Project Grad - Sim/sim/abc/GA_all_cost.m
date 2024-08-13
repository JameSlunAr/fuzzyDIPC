function cost = GA_all_cost(k)

assignin("base", "k_p_psi", k(1)/100);
assignin("base", "k_d_psi", k(2)/500);
assignin("base", "k_p_phi", k(3)/100);
assignin("base", "k_d_phi", k(4)/500);
assignin("base", "k_p_tt", k(5)/100);
assignin("base", "k_d_tt", k(6)/500);

sim ("GA_all_sim.slx");

% k
cost = ITSE_all(length(ITSE_all));

load("log_all.mat");
log_all = [log_all;log_all(length(log_all(:,1)),1)+1 k(1)/100 k(2)/500 k(3)/100 k(4)/500 k(5)/100 k(6)/500 cost];
save("log_all.mat","log_all");
clc;
log_all
end