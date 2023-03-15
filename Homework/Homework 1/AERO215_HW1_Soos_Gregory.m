%My name is Greg Soos, I'm in section 03 with David. This is the first
%homework assignment. The date is 10/6/2017.

close all; clear all; clc

%Input must be in meters.

h = 11000 ;

[T, P, rho] = stdatm_SOOS_GREGORY(h) ;
disp(['Temperature: ', num2str(T), ' degrees K'])
disp(['Pressure: ', num2str(P), ' Pa'])
disp(['Density: ', num2str(rho), ' kg/m^3'])

%Runs function, outputs temperature, pressure, and density based on height
%inputted. Displays outputs in command window.

h_v = 1:100:100000 ; 
for i1=1:length(h_v) ;
[T_v(i1), P_v(i1), rho_v(i1)] = stdatm_SOOS_GREGORY(h_v(i1)) ;
end

%Creates a 1x1000 vector for height. Then use a for loop to create
%corresponding vectors for temperature, pressure, and density by running
%the height vector element-by-element through the function.

figure(1)
subplot(1,3,1)
plot(T_v, h_v, 'r', 'LineWidth', 2)
xlabel('Temperature (deg K)')
ylabel('Height (m)')
title('Altitude vs. Air Temperature')
subplot(1,3,2)
plot(P_v, h_v, 'g', 'LineWidth', 2)
xlabel('Pressure (Pa)')
ylabel('Height (m)')
title('Altitude vs. Air Pressure')
subplot(1,3,3)
plot(rho_v, h_v, 'b', 'LineWidth', 2)
xlabel('Density (kg/m^3)')
ylabel('Height (m)')
title('Altitude vs. Air Density')

%Plots each temperature/pressure/density vector on the x-axis with height
%vector on the y-axis. Uses subplots to to put all graphs on one figure.
%Changes line color, line width, adds labels and titles to each for clarity
%of plots.
