function [ a, e, inc, RAAN, argper, truanom ] = CoEs( R, V )

%Greg Soos
%Homework 3
%AERO 215-03
%10.29.2017

mu = 398600 ; %km^3/s^2

%Semi-Major Axis
specmechE = ((norm(V)^2)/2) - (mu/norm(R)) ;
a = -mu / (2*specmechE) ;

%Eccentricity
evec = (1/mu)*(((norm(V)^2 - (mu/norm(R)))*R) - (dot(R, V)*V)) ;
e = norm(evec) ;

%Inclination
h = cross(R, V) ;
irad = acos(h(3)/norm(h)) ;
inc = rad2deg(irad) ;

%Right Ascension of Ascending Node (RAAN)
K = [0, 0, 1] ;
n = cross(K, h) ;
RAANrad = acos(n(1)/norm(n)) ;
RAAN = rad2deg(RAANrad) ;
if n(2) >= 0
    RAAN = RAAN ;
else
    RAAN = -RAAN + 360 ;
end

%If function required since acos only outputs from 0 to 180 degrees; RAAN
%can be up to 360 degrees depending on the sign of the y-component of the n
%vector.

%Argument of Perigee
argperrad = acos(dot(n, evec)/(norm(n)*e)) ;
argper = rad2deg(argperrad) ;
if evec(3) >= 0
    argper = argper ;
else
    argper = -argper + 360 ;
end

%Argument of Perigee goes up to 360 degrees depending on the sign of the
%z-component of the eccentricity vector.

%True Anomaly
truanomrad = acos(dot(evec, R)/(e*norm(R))) ;
truanom = rad2deg(truanomrad) ;
if dot(R, V) >= 0
    truanom = truanom ;
else
    truanom = -truanom + 360 ;
end

%True Anomaly goes up to 360 degrees depending on the sign of phi, which
%has the same sign as the dot product of the S/C position and velocity
%vectors.

end

