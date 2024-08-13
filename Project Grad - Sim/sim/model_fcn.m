function [dx,dy,dz,du,dv,dw,dphi,dtt,dpsi,dp,dq,dr]=model_fcn(phi,tt,psi,u,v,w,p,q,r,fx,fy,fz,tau_phi,tau_tt,tau_psi)

% Eqs. 16-19

M = 0.75;
m = .05;
g = 9.81;
R = .03;
l = .22;

Jx = .4*M*R*R+2*l*l*m;
Jy = .4*M*R*R+2*l*l*m;
Jz = .4*M*R*R+4*l*l*m;

dx = cos(tt)*cos(psi)*u+(sin(phi)*sin(tt)*cos(psi)-cos(phi)*sin(psi))*v+(cos(phi)*sin(tt)*cos(psi)+sin(phi)*sin(psi))*w;
dy = cos(tt)*sin(psi)*u+(sin(phi)*sin(tt)*sin(psi)+cos(phi)*cos(psi))*v+(cos(phi)*sin(tt)*sin(psi)-sin(phi)*cos(psi))*w;
dz = sin(tt)*u-sin(phi)*cos(tt)*v-cos(phi)*cos(tt)*w;

du = (r*v-q*w)-g*sin(tt);
dv = (p*w-r*u)+g*cos(tt)*sin(phi);
dw = (q*u-p*v)+g*cos(tt)*cos(phi)-fz/m;

dphi = p+sin(phi)*tan(phi)*q+cos(phi)*tan(tt)*r;
dtt  = cos(phi)*q-sin(phi)*r;
dpsi = sin(phi)*q/cos(tt)+cos(phi)*r/cos(tt);

dp = ((Jy-Jz)*q*r+tau_phi)/Jx;
dq = ((Jz-Jx)*p*r+tau_tt)/Jy;
dr = ((Jx-Jy)*q*p+tau_psi)/Jz;

% z
% k_p_z = -9.64;
% k_i_z = -5.55;
% k_d_z = -7.46;
% k_a_z = 1.37;

%psi
% k_p_psi = 6.91;
% k_i_psi = 8.79;
% k_d_psi = 3.95;
% k_a_psi = -3.71;