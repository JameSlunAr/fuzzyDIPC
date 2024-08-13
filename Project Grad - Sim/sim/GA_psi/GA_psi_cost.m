function cost = GA_psi_cost(k)

assignin("base", "k_p_psi", k(1)/100);
assignin("base", "k_i_psi", k(2)/100);
assignin("base", "k_d_psi", k(3)/100);
assignin("base", "k_a_psi", k(4)/100);
sim ("GA_psi_sim.slx");

% k
cost = ITSE_psi(length(ITSE_psi));

load("log_psi.mat");
log_psi = [log_psi;log_psi(length(log_psi(:,1)),1)+1 k(1)/100 k(2)/100 k(3)/100 k(4)/100 cost];
save("log_psi.mat","log_psi");
clc;
log_psi
end

% -268    -3  -843  -100
% -2.68