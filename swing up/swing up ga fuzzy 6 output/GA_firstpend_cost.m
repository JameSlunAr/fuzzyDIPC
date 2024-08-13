function cost = GA_firstpend_cost(k)
assignin("base", "KK", k);
sim ("swu_DIPC_6o_sim.slx");
k
cost = ITSEtt1(length(ITSEtt1))
end