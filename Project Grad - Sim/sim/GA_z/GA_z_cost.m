function cost = GA_z_cost(k)

assignin("base", "k_p_z", k(1)/100);
assignin("base", "k_i_z", k(2)/100);
assignin("base", "k_d_z", k(3)/100);
assignin("base", "k_a_z", k(4)/100);
sim ("GA_z_sim.slx");

% k
cost = ITSE_z(length(ITSE_z));

load("log_z.mat");
log_z = [log_z;log_z(length(log_z(:,1)),1)+1 k(1)/100 k(2)/100 k(3)/100 k(4)/100 cost];
save("log_z.mat","log_z");
clc;
log_z
end

% -268    -3  -843  -100
% -2.68