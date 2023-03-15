function [D0,P0,T0] = EarthStdAtm(h)
%input h in [m]
T0 = 228.5; % [K]
P0 = 610.5; % [Pa]
D0 = 1.225; % [kg/m^3]

DT(1) = -1.9;
DT(2) = 2.2;
DT(3) = -1.4;
DT(4) = -.5;
DT(5) = -3.85;
DT = DT/1000;

H(1) = 0;
H(2) = 7.5;
H(3) = 14;
H(4) = 32;
H(5) = 49;
H    = H*1000;  % convert to m
 
g = 3.7156;
C = -.019435;
R = -g/C;

%%%%%%%%%%%%% DO NOT CHANGE BELOW THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%
Tn = @(Tp,a,hn,hp) Tp+a*(hn-hp);

Pn1 = @(Pp,Tn,Tp,C,hn,hp) Pp*(Tn/Tp)^(C/((Tn-Tp)/(hn-hp))); % Gradient
Pn2 = @(Pp,Tn,Tp,C,hn,hp) Pp*exp(C/Tn*(hn-hp)) ;            % Isothermal

Dn = @(Tn,Pn,R) Pn/(Tn*R);
Hn = @(Hmax,Hin) (Hin>=Hmax)*Hmax+(Hin<Hmax)*Hin;
 
L = 1; 

while L<=length(H) && h>=H(L)
     T1 = Tn(T0,DT(L),Hn(H(L+1),h),H(L)); 
     if DT(L) == 0
        P0 = Pn2(P0,T1,T0,C,Hn(H(L+1),h),H(L));
     else
        P0 = Pn1(P0,T1,T0,C,Hn(H(L+1),h),H(L));  
     end
     T0 = T1;
     D0 = Dn(T0,P0,R);
     L  = L+1;    
end