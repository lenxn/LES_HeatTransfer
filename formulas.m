
%% y+

Re = 21400;
rho = 1000;
U = 0.535;
eta = 0.891E-3;
yplus = 1;

Cf = 0.079 * power(Re, -0.25); % Skin Friction Coefficient
Tw = 1/2 * Cf * rho * power( U, 2 ); % Wall Shear Stress
UT = sqrt( Tw/rho ); % Friction Velocity
delta_y = yplus * eta / ( rho * UT );

