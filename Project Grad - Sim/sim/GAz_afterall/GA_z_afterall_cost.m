function cost = GA_z_afterall_cost(k)

assignin("base", "k_p_z", k(1)/100);
assignin("base", "k_i_z", k(2)/100);
assignin("base", "k_d_z", k(3)/500);
assignin("base", "k_a_z", k(4)/100);
sim ("GA_z_afterall_sim.slx");

% k
cost = ITSE_z_afterall(length(ITSE_z_afterall));

load("log_z_afterall.mat");
log_z_afterall = [log_z_afterall;log_z_afterall(length(log_z_afterall(:,1)),1)+1 k(1)/100 k(2)/100 k(3)/100 k(4)/100 cost];
save("log_z_afterall.mat","log_z_afterall");
clc;
log_z_afterall
end
