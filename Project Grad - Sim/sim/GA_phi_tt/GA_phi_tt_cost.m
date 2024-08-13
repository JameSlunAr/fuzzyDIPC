function cost = GA_phi_tt_cost(k)

assignin("base", "k_p_phi", k(1)/100);
assignin("base", "k_i_phi", k(2)/100);
assignin("base", "k_d_phi", k(3)/100);
assignin("base", "k_a_phi", k(4)/100);
sim ("GA_phi_tt_sim.slx");

% k
cost = ITSE_phi(length(ITSE_phi));

load("log_phi.mat");
log_phi = [log_phi;log_phi(length(log_phi(:,1)),1)+1 k(1)/100 k(2)/100 k(3)/100 k(4)/100 cost];
save("log_phi.mat","log_phi");
clc;
log_phi
end