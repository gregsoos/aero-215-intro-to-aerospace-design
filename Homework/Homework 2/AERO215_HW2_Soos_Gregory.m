%%Aero 215 HW2
% Gregory Soos
% 10/13/2017
% Drag & Power Absorbed

close all; clear all; clc
format short

h = 0 ;
[T, P, rho] = stdatm_SOOS_GREGORY(h) ; 
clear P

%Retriveing air density from the altitude using a function created for HW1.
%Also clearing pressure variable since P is later used for power.

airplane.WS = 70 ;
airplane.AR = 8 ;
airplane.Cdo = .02 ;
airplane.e = .8 ;
airplane.Cl = 1.2 ;
airplane.S = 200 ;

v_max = 300 * 1.68781 ;

%Establishing airplane structure, max velocity, all for use with function.
%Max velocity is also given in knots, so converting it to British units.

%Sea Level, Clean
[V_sl, D_sl, P_sl] = HW2_Drag_Power_SOOS_GREGORY(v_max, airplane, rho) ;

%Plugging baseline characteristics into function.

%Cruising Altitude of 10k ft, Clean
h = 3048 ;
[T, P, rho] = stdatm_SOOS_GREGORY(h) ; 
clear P
[V_ca, D_ca, P_ca] = HW2_Drag_Power_SOOS_GREGORY(v_max, airplane, rho) ;

%New altitude means different density but everything else is the same.
%Thus, use function from HW1 to calculate new air density and use in
%function.

%Sea Level, Dirty
h = 0 ;
[T, P, rho] = stdatm_SOOS_GREGORY(h) ; 
clear P
airplane.Cdo = .03 ;
airplane.Cl = 2 ;
[V_sd, D_sd, P_sd] = HW2_Drag_Power_SOOS_GREGORY(v_max, airplane, rho) ;

%Landing config at sea level means need to reset air density back from
%where it was previously. Also need to change Cdo and Cl_max, which is done
%and then used in function.

%Sea Level, Varied Wing Loading
airplane.Cdo = .02 ;
airplane.Cl = 1.2 ; 
airplane.WS = 75 ;
[V_sh, D_sh, P_sh] = HW2_Drag_Power_SOOS_GREGORY(v_max, airplane, rho) ;

%Varied wing loading but not landing config which means need to reset Cdo
%and Cl_max to baseline values, and then change W/S. Then input values into
%function.

%Plotting
figure(1)
subplot(1,2,1)
plot(V_sl, D_sl, 'r', 'LineWidth', 2)
hold on
plot(V_ca, D_ca, 'g', 'LineWidth', 2)
plot(V_sd, D_sd, 'b', 'LineWidth', 2)
plot(V_sh, D_sh, 'c', 'LineWidth', 2)
title('Drag vs. Velocity')
xlabel('Velocity (ft/s)')
ylabel('Drag (lbf)')
legend('Sea Level, Clean', '10k ft, Clean', 'Sea Level, Dirty', 'Sea Level, Varied Wing Loading')
subplot(1,2,2)
plot(V_sl, P_sl, 'r', 'LineWidth', 2)
hold on
plot(V_ca, P_ca, 'g', 'LineWidth', 2)
plot(V_sd, P_sd, 'b', 'LineWidth', 2)
plot(V_sh, P_sh, 'c', 'LineWidth', 2)
title('Required Power vs. Velocity')
xlabel('Velocity (ft/s)')
ylabel('Power Required (W)')
legend('Sea Level, Clean', '10k ft, Clean', 'Sea Level, Dirty', 'Sea Level, Varied Wing Loading')

%Putting four plots each on two subplots, then changing color and linewidth
%as well as adding a legend for ease of access. Also add axis labels and
%title.

%Energy Height
h = 3048 ;
[T, P, rho] = stdatm_SOOS_GREGORY(h) ;
a_ca = sqrt(1.4*287*T) ;
Ze = (.5 * (((.5*a_ca)^2)/9.81)) + h ; 
V_final = sqrt(2 * Ze * 9.81) ;
h = 0 ;
[T, P, rho] = stdatm_SOOS_GREGORY(h) ;
a_sl = sqrt(1.4*287*T) ; 
mach = V_final/a_sl ;
disp(['Energy Height: ', num2str(Ze), ' m'])
disp(['Velocity at Sea Level: Mach ', num2str(mach)])
disp(['Speed of Sound at 10k Feet: ', num2str(a_ca), ' m/s'])
disp(['Speed of Sound at Sea Level: ', num2str(a_sl), ' m/s'])

%Need to find temp at 10k feet to use in equation for speed of sound. Then
%use this to find velocity, which then use to find energy height. Then use
%energy height and work backwards to find corresponding velocity at sea
%level. Then need to find speed of sound at sea level, and then use this
%and the velocity to put it in terms of mach. Then display appropriate
%items/values.

