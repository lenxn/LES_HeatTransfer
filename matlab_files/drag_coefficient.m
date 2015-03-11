%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title:            drag_coefficient.m
% Version:          1.3
% Author:           Stefan Lengauer
% Date:             13th February 2015
% Required Files:   force_x_18450.csv
%                   force_x_18460.csv
%                   force_x_18470.csv
%                   force_x_18480.csv
%                   force_x_18490.csv
%                   force_x_18500.csv
%                   force_x_18510.csv
%                   force_x_18520.csv
%                   force_x_18530.csv
%                   force_x_18540.csv
%                   force_x_18550.csv
% Description:      Script for computing the drag coefficient of the 
%                   airfoil for the last 100 timesteps.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rho = 1.1839;           % density of air at 25 degrees, [kg m^-3]
u = 66.8;               % inlet speed, [m s^-1]
max_thickness = 0.12;   % max thickness of the profile, [m]
width = 0.3;            % profile width, [m]


% initialization of the coefficient vector
CD = zeros( 1, 11 );

for i = 450:10:550
    file = strcat( '../simulation_data/force_x_18', int2str( i ), '.csv' );
    A = csvread( file );
    force_x = A(:,4);
    
    % computation of the drag coefficient
    index = ( i - 450 )/10 + 1;
    CD(index) = sum( force_x ) / ...
        ( 1/2 * rho * power( u, 2 ) * width * max_thickness );
end