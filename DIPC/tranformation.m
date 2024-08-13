syms a1 a2 a3 a4 a5 a6 theta1 d_theta1 theta2 d_theta2 g u dd_x dd_theta1 dd_theta2

eq1 = a1*dd_x + a2*cos(theta1)*dd_theta1 + a3*cos(theta2)*dd_theta2 - ...
    a1*sin(theta1)*d_theta1^2 - a3*sin(theta2)*d_theta2^2 - u;

eq2 = a2*cos(theta1)*dd_x + a4*dd_theta1 + a5*cos(theta1-theta2)*dd_theta2 + ...
    a5*sin(theta1-theta2)*d_theta2^2 - a2*g*sin(theta1);

eq3 = a3*cos(theta2)*dd_x + a5*cos(theta1-theta2)*dd_theta1 + a6*dd_theta2 - ...
    a5*sin(theta1 - theta2)*d_theta1^2 - a3*g*sin(theta2);

[dd_x,dd_theta1,dd_theta2] = solve([eq1,eq2,eq3],[dd_x,dd_theta1,dd_theta2]);