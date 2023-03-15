%Greg Soos
%AERO 215-03
%Midterm 1

%The density I am getting from the function is different to the one
%suggested in the problem. If that isn't the way it is supposed to be, then
%I am not sure why this is. I used the value I received from this code for
%the final results of Part B though, not the suggested .000659 kg/m^3.

h = 16000 ;
[D0, P0, T0] = EarthStdAtm(h) ;
disp(['Density: ', num2str(D0), ' kg/m^3'])
disp(['Pressure: ', num2str(P0), ' Pa'])
disp(['Temperature: ', num2str(T0), ' degrees K'])

%Height in meters, displays results from EarthStdAtm function given
%whatever height you plug in.

%Constants
CL = .8 ; 
CD = .012 ;
V  = 18 ;  %m/s
S  = 202 ; %m^2

%Drag and Lift Equations
D  = .5 * CD * D0 * V^2 * S ;
L  = .5 * CL * D0 * V^2 * S ;
LD = L/D ;

disp('-----')
disp(['Drag: ', num2str(D), ' N'])
disp(['Lift: ', num2str(L), ' N'])
disp(['Lift to Drag: ', num2str(LD)])

%Answers displayed appropriately.