%Greg Soos
%Homework 3
%AERO 215-03
%10.29.2017

R = [ -6533, 1570, 42 ] ; %km
V = [ -1.59, -6.65, 6.5 ] ; %km/s

%Input S/C position and velocity vectors

[a, e, inc, RAAN, argper, truanom] = CoEs(R, V) ;

%Input above two vectors in CoEs function

disp(['Semi-Major Axis: ', num2str(a), ' km'])
disp(['Eccentricity: ', num2str(e)])
disp(['Inclination: ', num2str(inc), ' degrees'])
disp(['Right Ascension of Ascending Node: ', num2str(RAAN), ' degrees'])
disp(['Argument of Perigee: ', num2str(argper), ' degrees'])
disp(['True Anomaly: ', num2str(truanom), ' degrees'])

%Display results with appropriate units