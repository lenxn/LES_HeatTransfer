%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title:            cell_height.m
% Version:          2.2
% Author:           Stefan Lengauer
% Date:             16th February 2015
% Description:      File for computing the necessary cell height for the
%                   cells attached to the wing surface.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

% Definition of variables
rho = 1.168;    % Density, [kg m^-3]
U = 66.8;       % Velocity, [m/s]
L = 1;          % Characteristic length scale, [m]
mu = 18.48e-6;  % Dynamic viscosity [Pa*s]
yplus = 1;      % y+, dimensionless

Re = rho * U * L / mu;
Cf = 0.079 * power( Re, -0.25 );

Tau_w = 1/2 * Cf * rho * power( U, 2 );

Utau = sqrt( Tau_w / rho );
deltay = yplus * mu /( rho * Utau );