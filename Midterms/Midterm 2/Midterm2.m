%Greg Soos
%AERO 215-03
%Midterm 2
%11.9.2017

close all, clear all, clc

diff = pi/2 ; %radians
r = 10000 ; %km
mu = 398600 ; %km^3/s^2
n = 1:10 ; %number of orbits

T_base = 2*pi*sqrt(r^3/mu) ;
t_lead = (diff/(2*pi))*T_base ;
n1 = n.^-1 ;
P_ph = T_base + (t_lead*n1) ;
n2 = P_ph/(2*pi) ;
qut = mu*(n2.^2) ;
a_ph = nthroot(qut, 3) ;
%Calculating semi-major axis of phasing orbit

%Transfer
Emech1 = -mu/(2*r) ;
n3 = 2*a_ph ;
n4 = n3.^-1 ;
Emecht = -mu*n4 ;
v1 = sqrt(2*(mu/r + Emech1)) ;
vt = sqrt(2*(mu/r + Emecht)) ;
DeltaV1 = abs(sqrt(mu*(2/r - a_ph.^-1)) - ((2*pi*r)/T_base)) ;
DeltaVtot = 2*DeltaV1 ;
%Calculating Delta V

plot(n, DeltaVtot)
title('Total Delta V vs. Number of Transfer Orbits')
xlabel('Number of Periods in Transfer Orbit')
ylabel('Total Delta V (km/s)')
%Plotting