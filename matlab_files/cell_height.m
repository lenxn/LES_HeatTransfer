%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title:            cell_height.m
% Version:          1.0
% Author:           Stefan Lengauer
% Date:             16th February 2015
% Description:      File for creating and saving the plots of the data
%                   obtained from CFX-Post.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

% Definition of variables
rho = 1.1839;
U = 66.8;    % [m/s]
L = 7;
mu = 8.90e-4;    % [Pa*s]
yplus = 1;

Re = rho * U * L / mu;

Cf = 0.079 * power( Re, -0.25 );

Tau_w = 1/2 * Cf * rho * power( U, 2 );

Utau = sqrt( Tau_w / rho );
deltay = yplus * mu /( rho * Utau );