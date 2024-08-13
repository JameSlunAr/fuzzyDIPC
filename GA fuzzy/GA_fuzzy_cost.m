function cost = GA_fuzzy_cost(k)

fis = readfis('GAfis.fis');
for i=1:364
    fis.outputs(1).membershipfunctions(i)=fismf('constant',k(i));
    fis.outputs(1).membershipfunctions(730-i)=fismf('constant',-k(i));
end
writefis(fis, 'GAfis.fis');
sim ("GA_fuzzy_sim.slx");
% k
cost = ITSE(length(ITSE))
end