clear all;
close all;

STAT = csvread( '../simulation_data/wall_heat_flux_stationary.csv' );
TRANS = csvread( '../simulation_data/wall_heat_flux_transient.csv' );

x_stat = STAT( :, 1 );
y_stat = STAT( :, 4 );

x_trans = TRANS( 3:350, 1 );
y_trans = TRANS( 3:350, 4 );


c = 1.0;
t = 12/100;

a0 = 0.2969;
a1 = -0.1260;
a2 = -0.3516;
a3 = 0.2843;
a4 = -0.1015;

x_trans(1:2) = [];
x_trans(210:211) = [];
length = 0;
for i = 1:212
    i
    if i == 1
        yt_0 = 0
        x0 = 1
    else
        x0 = x_trans(i-1)
        yt_0 = (12/100)/0.2 * ( a0*power( x0, 0.5 ) + a1*x + a2*power( x0, 2 ) + ...
            a3*power( x0, 3 ) + a4*power( x0, 4 ))
    end
    
    x = x_trans(i)
    
    if x-x0 ~= 0
        yt = (12/100)/0.2 * ( a0*power( x, 0.5 ) + a1*x + a2*power( x, 2 ) + ...
            a3*power( x, 3 ) + a4*power( x, 4 ))
        length(i) = sum(length) + sqrt( power( x-x0, 2 ) + power( yt-yt_0, 2 ))
    end
end

x = 1:0.1:100;
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
Pr = 0.7141;
Re = w * l / ypsilon;

% For cylinder with laminar flow
Nu = 1.14 * power( Pr, 0.4 ) * power( Re, 0.5 );

Fr = Nu / power( Re, 0.5 );

