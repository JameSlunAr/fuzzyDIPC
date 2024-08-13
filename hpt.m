syms a1 a2 a3 b1 b2 b3 c1 c2 c3 A B C x1 x2 x3

eq1 =  a1*x1+a2*x2+a3*x3-A;
eq2 =  b1*x1+b2*x2+b3*x3-B;
eq3 =  c1*x1+c2*x2+c3*x3-C;
[x1, x2, x3] = solve([eq1, eq2, eq3], [x1, x2, x3]);

% x1 = (A*b2*c3 - A*b3*c2 - B*a2*c3 + B*a3*c2 + C*a2*b3 - C*a3*b2)/...
%     (a1*b2*c3 - a1*b3*c2 - a2*b1*c3 + a2*b3*c1 + a3*b1*c2 - a3*b2*c1);
% 
% x2 = -(A*b1*c3 - A*b3*c1 - B*a1*c3 + B*a3*c1 + C*a1*b3 - C*a3*b1)/...
%     (a1*b2*c3 - a1*b3*c2 - a2*b1*c3 + a2*b3*c1 + a3*b1*c2 - a3*b2*c1);
% 
% 
% x3 = (A*b1*c2 - A*b2*c1 - B*a1*c2 + B*a2*c1 + C*a1*b2 - C*a2*b1) /...
%     (a1*b2*c3 - a1*b3*c2 - a2*b1*c3 + a2*b3*c1 + a3*b1*c2 - a3*b2*c1);
% 
% x4 = ((C*a1/c1-A)*(b2*a1/b1-a2)/(c2*a1/c1-a2)-(B*a1/b1-A))/...
%     ((c3*a1/c1-a3)*(b2*a1/b1-a2)/(c2*a1/c1-a2)-(b3*a1/b1-a3));
% 
% x4 = (A*b1*c2 - A*b2*c1 - B*a1*c2 + B*a2*c1 + C*a1*b2 - C*a2*b1)/...
%     (a1*b2*c3 - a1*b3*c2 - a2*b1*c3 + a2*b3*c1 + a3*b1*c2 - a3*b2*c1);