clear all;
close all;

c = 1.0;
t = 12/100;
x = 0:0.01:1;

a0 = 0.2969;
a1 = -0.1260;
a2 = -0.3516;
a3 = 0.2843;
a4 = -0.1015;

yt = (12/100)/0.2 * ( a0*power( x, 0.5 ) + a1*x + a2*power( x, 2 ) + ...
    a3*power( x, 3 ) + a4*power( x, 4 ));

plot( x, yt )

axis( [0, 1, 0, 1] );

%%

R_LE = 1.1019 * power( t, 2 );

cp = 1.007; % luft, 25C
eta = 18.48e-6; % dynamisch viskosit?t [kg m?-1 s^-1]
lambda = 26.06e-3; % thermal conductivity [W K^-1 m^-1]
ypsilon = 15.82e-6; % kinematic viscosity [m^2 s?-1]
w = 66.8;
l = R_LE * 2;

% Pr = cp * eta / lambda;
Pr = 0.7141
Re = w * l / ypsilon;

% For cylinder with laminar flow
Nu = 1.14 * power( Pr, 0.4 ) * power( Re, 0.5 );

Fr = Nu / power( Re, 0.5 )

