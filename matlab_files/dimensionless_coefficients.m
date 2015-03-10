%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title:            dimensionless_coefficients.m
% Version:          1.2
% Author:           Stefan Lengauer
% Date:             3rd March 2015
% Description:      Script for computation for the dimensionless
%                   coefficients, necessary for the evaluation of the 
%                   results.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

% Simulation parameters

c = 1.0;                % [m] Chord length
t = 12/100;             % [m] Maximum profile height
w = 66.8;               % [m s^-1] Fluid velocity 

tw = 26 + 273.15;       % Temperature at the wing surface [K]
tf = 25 + 273.15;       % Temperature of the fluid [K]
A = 0.5967;             % Wing surface [m^2]
whf_trans = 257.0520;   % Wall heat flux at stagnation point from transient
                        % simulation [W m^-2]
whf_stat = 253.6925;    % Wall heat flux at stagnation point from
                        % stationary simulation [W m^-2]

% Material properties for air at 25C

cp = 1007;              % [J kg^-1 K^-1] Heat transfer coefficient
eta = 18.48e-6;         % [kg m?-1 s^-1] Dynamic viscosity 
lambda = 26.06e-3;      % [W K^-1 m^-1] Thermal conductivity 
ypsilon = 15.82e-6;     % [m^2 s?-1] Kinematic viscosity



R_LE = 1.1019 * power( t, 2 );  % [m] Radius Leading edge
l = R_LE * 2;           % [m] Characteristic length scale 


% Reynolds number
Re = w * l / ypsilon;

%% Theoretical values according to the fluid properties

% Prandtl number
Pr_id = cp * eta / lambda;

% Nu?elt number
Nu_id = 1.14 * power( Pr_id, 0.4 ) * power( Re, 0.5 );

% Froude number
Fr_id = Nu_id / power( Re, 0.5 );

% Heat transfer coefficient
alpha_id = Nu_id * lambda / l;


%% Values with the Heat Transfer coefficient obtained from the transient
% simulation

% Heat transfer coefficient
alpha_stat = whf_trans / ( tw - tf );

% Nu?elt number
Nu_stat = alpha_stat * l / lambda;

% Froude number
Fr_trans = Nu_stat / power( Re, 0.5 );

%% Values with the Heat Transfer coefficient obtained from the stationary
% simulation

% Heat transfer coefficient
alpha_stat = whf_stat / ( tw - tf );

% Nu?elt number
Nu_stat = alpha_stat * l / lambda;

% Froude number
Fr_stat = Nu_stat / power( Re, 0.5 );






