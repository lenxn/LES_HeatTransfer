%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title:            dimensionless_coefficients.m
% Version:          1.0
% Author:           Stefan Lengauer
% Date:             3rd March 2015
% Description:      Script for computation for the dimensionless
%                   coefficients, necessary for the evaluation of the 
%                   results.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

c = 1.0;
t = 12/100;


R_LE = 1.1019 * power( t, 2 );  % Radius Leading edge

cp = 1007;             % Air at 25C
eta = 18.48e-6;         % Dynamic viscosity [kg m?-1 s^-1]
lambda = 26.06e-3;      % Thermal conductivity [W K^-1 m^-1]
ypsilon = 15.82e-6;     % Kinematic viscosity [m^2 s?-1]
w = 66.8;               % Fluid velocity [m s^-1]
l = R_LE * 2;           % Characteristic length scale [m]

Pr = cp * eta / lambda;
Re = w * l / ypsilon;

% For cylinder with laminar flow
Nu = 1.14 * power( Pr, 0.4 ) * power( Re, 0.5 );

Fr = Nu / power( Re, 0.5 );

alpha = Nu * lambda / 1;

%% with alpha from simulation

tw = 26 + 273.15;       % Temperature at the wing surface [K]
tf = 25 + 273.15;       % Temperature of the fluid [K]
A = 1;                  % Wing surface [m^2]
Q_dot = 1.1309e5;       % overall heat flow [W m^-2]

alpha = Q_dot / ( A * ( tw - tf ));
Nu = alpha * l / lambda;




