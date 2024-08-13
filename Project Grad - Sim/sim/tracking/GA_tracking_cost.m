function cost = GA_tracking_cost(k)

assignin("base", "k_p_x", k(1)/100);
assignin("base", "k_i_x", k(2)/100);
assignin("base", "k_d_x", k(3)/500);
assignin("base", "k_a_x", k(4)/100);
assignin("base", "k_p_y", k(5)/100);
assignin("base", "k_i_y", k(6)/100);
assignin("base", "k_d_y", k(7)/500);
assignin("base", "k_a_y", k(8)/100);

sim ("Copy_2_of_GA_tracking_sim.slx");

% k
cost = ITSE_xy(length(ITSE_xy));

load("log_tracking.mat");
log_tracking = [log_tracking;log_tracking(length(log_tracking(:,1)),1)+1 k(1)/100 k(2)/100 k(3)/500 k(4)/100 k(5)/100 k(6)/100 k(7)/500 k(8)/100 cost];
save("log_tracking.mat","log_tracking");
clc;
log_tracking
end

% -367  -804  -436   456   599   280   622  -794