function [ V, D, P ] = HW2_Drag_Power_SOOS_GREGORY( v_max, airplane, rho )

W = airplane.WS * airplane.S ;
rho_imperial = rho * .00194032 ;

%Calculate weight from W/S and wing reference area. Rho from HW1 function
%is given in metric units, so also convert to British units.

%VELOCITY VECTOR
V_stall = sqrt((2 * W) / (rho_imperial * airplane.Cl * airplane.S)) ;
V = V_stall:1:v_max ;

%Calculate stall velocity, then create a vector from stall velocity to
%given max velocity with step size of 1.

%DRAG VECTOR
induced_1 = W.^2 ;
induced_2 = .5 * rho_imperial * V.^2 * airplane.S * pi * airplane.e * airplane.AR ;
induced_D = induced_1./induced_2 ;
D = (.5 * airplane.Cdo * rho_imperial * V.^2 * airplane.S) + induced_D ;

%Break induced drag into two different vectors so division can be done
%easily (easier to make matrices the same size this way). Then add this to 
%parasitic drag for calculation of total drag.

%POWER VECTOR
induced_3 = .5 * rho_imperial * V * airplane.S * pi * airplane.e * airplane.AR ;
induced_P = induced_1./induced_3 ;
P_imperial = (.5 * airplane.Cdo * rho_imperial * V.^3 * airplane.S) + induced_P ;
P = P_imperial * 1.35581795 ;

%Break power from induced into two different vectors for division like
%above. Then add to to power from parasitic for total power required, and
%then convert from imperial units to metric as requested.

end

