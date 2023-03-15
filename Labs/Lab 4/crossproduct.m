function [ crossprod ] = crossproduct( H , N )

crossprod = [ H(1,2)*N(1,3)-H(1,3)*N(1,2) , H(1,3)*N(1,1)-H(1,1)*N(1,3) , H(1,1)*N(1,2)-H(1,2)*N(1,1) ] ;

%Takes two 1x3 vectors and multiplies the elements/subtracts the products
%according to how cross products are calculated. Calculates new 1x3 vector
%that is the cross product of the first two vectors.


end

