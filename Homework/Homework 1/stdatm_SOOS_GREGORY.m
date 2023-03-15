function [T, P, rho] = stdatm_SOOS_GREGORY(h)

%My name is Greg Soos, I'm in section 03 with David. This is for the first
%homework assignment. The date is 10/6/2017.

%Temperature
if h >= 0 && h < 11000
    T = 288.16 - (6.5e-3) * h ;
elseif h >= 11000 && h <= 25000
    T = 288.16 - (6.5e-3) * 11000 ;
elseif h > 25000 && h < 47000
    T = (288.16 - (6.5e-3) * 11000) + (3e-3) * (h - 25000) ;
elseif h >= 47000 && h <= 53000
    T = (288.16 - (6.5e-3) * 11000) + (3e-3) * 22000 ;
elseif h > 53000 && h < 79000
    T = ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (h - 53000) ;
elseif h >= 79000 && h <= 90000
    T = ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000) ;
elseif h > 90000 && h <= 100000
    T = (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)) + (4e-3) * (h - 90000) ;
else
    T = 'Unknown' ;
    disp('Bruh I was not asked to calculated this...')
end

%Uses "if" to subcategorize height into bands regarding whether it's
%Gradient Layer 1/Isothermal Layer 1/... Then, runs the height through the
%appropriate equation to determine temperature. Each subsequent equation in
%the "if" function builds off the previous equation, since temperature
%variation changes based on the band, and the gradient temperature relation
%equations requires a previous temperature (within that band) for accuracy.
%Hence why each subsequent line gets longer: It's building on previous
%results.

%Pressure
if h >= 0 && h < 11000
    P = (101325) * (T / 288.16)^(-9.8/(287*(-6.5e-3))) ;
elseif h >= 11000 && h <= 25000
    P = ((101325) * ((288.16 - (6.5e-3) * 11000) / 288.16)^(-9.8/(287*(-6.5e-3)))) * exp((-9.8/(287*T)) * (h - 11000)) ;
elseif h > 25000 && h < 47000
    P = (((101325) * ((288.16 - (6.5e-3) * 11000) / 288.16)^(-9.8/(287*(-6.5e-3)))) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (T / (288.16 - (6.5e-3) * 11000))^(-9.8/(287*3e-3)) ;
elseif h >= 47000 && h <= 53000
    P = ((((101325) * ((288.16 - (6.5e-3) * 11000) / 288.16)^(-9.8/(287*(-6.5e-3)))) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^(-9.8/(287*3e-3))) * exp((-9.8/(287*T))*(h-47000)) ;
elseif h > 53000 && h < 79000
    P = (((((101325) * ((288.16 - (6.5e-3) * 11000) / 288.16)^(-9.8/(287*(-6.5e-3)))) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^(-9.8/(287*3e-3))) * exp((-9.8/(287*((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000)))*(6000))) * (T / ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000))^(-9.8/(287*(-4.5e-3))) ;
elseif h >= 79000 && h <= 90000
    P = ((((((101325) * ((288.16 - (6.5e-3) * 11000) / 288.16)^(-9.8/(287*(-6.5e-3)))) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^(-9.8/(287*3e-3))) * exp((-9.8/(287*((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000)))*(6000))) * ((((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)) / ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000))^(-9.8/(287*(-4.5e-3)))) * exp((-9.8/(287 * T)) * (h - 79000)) ;
elseif h > 90000 && h <= 100000
    P = (((((((101325) * ((288.16 - (6.5e-3) * 11000) / 288.16)^(-9.8/(287*(-6.5e-3)))) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^(-9.8/(287*3e-3))) * exp((-9.8/(287*((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000)))*(6000))) * ((((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)) / ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000))^(-9.8/(287*(-4.5e-3)))) * exp((-9.8/(287 * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)))) * 11000)) * ( T / (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)))^(-9.8/(287*4e-3)) ;
else
    P = 'Unknown' ;
    disp('Like come on now. Honestly.')
end

%Uses "if" to subcategorize height into bands regarding whether it's
%Gradient Layer 1/Isothermal Layer 1/... Then, runs the height through the
%appropriate equation to determine pressure. Each subsequent equation in
%the "if" function builds off the previous equation, since pressure
%variation changes based on the band, and both pressure relation equations 
%require a previous pressure (within that band) for accuracy. Hence why 
%each subsequent line gets longer: It's building on previous results.

%Density
if h >= 0 && h < 11000
    rho = (1.225) * (T / 288.16)^((-9.8/(287*(-6.5e-3)))-1) ;
elseif h >= 11000 && h <= 25000
    rho = ((1.225) * ((288.16 - (6.5e-3) * 11000) / 288.16)^((-9.8/(287*(-6.5e-3)))-1)) * exp((-9.8/(287*T)) * (h - 11000)) ;
elseif h > 25000 && h < 47000
    rho = (((1.225) * ((288.16 - (6.5e-3) * 11000) / 288.16)^((-9.8/(287*(-6.5e-3)))-1)) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (T / (288.16 - (6.5e-3) * 11000))^((-9.8/(287*3e-3))-1) ;
elseif h >= 47000 && h <= 53000
    rho = ((((1.225) * ((288.16 - (6.5e-3) * 11000) / 288.16)^((-9.8/(287*(-6.5e-3)))-1)) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^((-9.8/(287*3e-3))-1)) * exp((-9.8/(287*T))*(h-47000)) ;
elseif h > 53000 && h < 79000
    rho = (((((1.225) * ((288.16 - (6.5e-3) * 11000) / 288.16)^((-9.8/(287*(-6.5e-3)))-1)) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^((-9.8/(287*3e-3))-1)) * exp((-9.8/(287*((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000)))*(6000))) * (T / ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000))^((-9.8/(287*(-4.5e-3)))-1) ;
elseif h >= 79000 && h <= 90000
    rho = ((((((1.225) * ((288.16 - (6.5e-3) * 11000) / 288.16)^((-9.8/(287*(-6.5e-3)))-1)) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^((-9.8/(287*3e-3))-1)) * exp((-9.8/(287*((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000)))*(6000))) * ((((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)) / ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000))^((-9.8/(287*(-4.5e-3)))-1)) * exp((-9.8/(287 * T)) * (h - 79000)) ;
elseif h > 90000 && h <= 100000
    rho = (((((((1.225) * ((288.16 - (6.5e-3) * 11000) / 288.16)^((-9.8/(287*(-6.5e-3)))-1)) * exp((-9.8/(287*(288.16 - (6.5e-3) * 11000))) * (14000))) * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) / (288.16 - (6.5e-3) * 11000))^((-9.8/(287*3e-3))-1)) * exp((-9.8/(287*((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000)))*(6000))) * ((((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)) / ((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000))^((-9.8/(287*(-4.5e-3)))-1)) * exp((-9.8/(287 * (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)))) * 11000)) * ( T / (((288.16 - (6.5e-3) * 11000) + (3e-3) * 22000) - (4.5e-3) * (26000)))^((-9.8/(287*4e-3))-1) ;
else
    rho = 'Unknown' ;
    disp('Input an altitude from 0 to 100 km. How hard is that?')
end

%Uses "if" to subcategorize height into bands regarding whether it's
%Gradient Layer 1/Isothermal Layer 1/... Then, runs the height through the
%appropriate equation to determine density. Each subsequent equation in
%the "if" function builds off the previous equation, since density
%variation changes based on the band, and both density relation equations 
%require a previous density (within that band) for accuracy. Hence why 
%each subsequent line gets longer: It's building on previous results.

end

