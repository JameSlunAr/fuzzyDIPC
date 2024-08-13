% Ground setpoint to body
function [x_b,y_b,z_b] = convert_setpoint(xsp,ysp,zsp,x,y,z,phi,theta,psi)
xyz_sp_g = [xsp ysp zsp 1];

R_body_to_ground = [cos(psi)*cos(theta) cos(psi)*sin(theta)*sin(phi)-sin(psi)*cos(phi) cos(psi)*sin(theta)*cos(phi)+sin(psi)*sin(phi);
                    sin(psi)*cos(theta) sin(psi)*sin(theta)*sin(phi)+cos(psi)*cos(phi) sin(psi)*sin(theta)*cos(phi)-cos(psi)*sin(phi);
                    -sin(theta) cos(theta)*sin(phi) cos(theta)*cos(phi)];
P_body_to_ground = [x y z]';
% T_body_to_ground = [R_body_to_ground P_body_to_ground; 0 0 0 1];

P_ground_to_body = [-P_body_to_ground'*R_body_to_ground(:,1);
                    -P_body_to_ground'*R_body_to_ground(:,2);
                    -P_body_to_ground'*R_body_to_ground(:,3)];
T_ground_to_body = [R_body_to_ground' P_ground_to_body; 0 0 0 1];

xyz_sp_b = T_ground_to_body*xyz_sp_g';

x_b = xyz_sp_b(1);
y_b = xyz_sp_b(2);
z_b = xyz_sp_b(3);