%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title:            wall_heat_flux_plot.m
% Version:          1.0
% Author:           Stefan Lengauer
% Date:             15 Februar 2015
% Required Files:   wall_heat_flux_stationary.csv
%                   wall_heat_flux_transient.csv
% Description:      File for creating and saving the plots of the data
%                   obtained from CFX-Post.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

%% Data Import
STAT = csvread( '../simulation_data/wall_heat_flux_stationary.csv' );
TRANS = csvread( '../simulation_data/wall_heat_flux_transient.csv' );

x_stat = STAT( :, 1 );
y_stat = STAT( :, 4 );

x_trans = TRANS( 3:350, 1 );
y_trans = TRANS( 3:350, 4 );


%% Plot
hold on;
grid;

plot( x_stat, y_stat, 'linewidth', 2, 'color', 'blue' )
plot( x_trans, y_trans, 'linewidth', 2, 'color', 'red' )

axis( [0, 1, 0, 500] );
title( 'Wall Heat Flux on NACA 0012 Airfoil' )
legend( 'RANS', 'Large Eddy Simulation' )
xlabel( 'X [m]' )
ylabel( 'Wall Heat Flux [W m^-2]' )

%% Save Plot
saveas( figure(1), '../images/Wall_Heat_Flux_Plot.png', 'png' )

