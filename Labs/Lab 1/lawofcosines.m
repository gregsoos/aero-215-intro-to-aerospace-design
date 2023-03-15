function [ c ] = lawofcosines( a, b, C )
%This function represents the mathematical law of cosines
%   By inputting two side lengths (a, b) and the value of the two sides'
%   included angle, the function calculates and outputs the square of the
%   value of this third side (due to the nature of the law of cosines,
%   which--similar to the Pythagorean Theorem--squares the values of two
%   sides in order to square the value of the third side.

d = a^2 ;
e = b^2 ;

%In order to make the equation a bit more succinct and drawn out rather
%than all calculated in one step, Lines 9 and 10 define two new variables
%'d' and 'e' to represent the squares of the two known side lengths--the
%input variables 'a' and 'b' respectively.

f = 2*a*b*cosd(C) ;

%Line 17 also exists to make the actual law of cosines calculation more
%succinct. This takes a third part of the equation (2abcosC) and calculates
%into a new variable 'f', using all three input variables 'a', 'b', and
%'c'.

c = d+e-f ;

%Finally, Line 24 is the actual law of cosines calculation. It takes the
%variables 'd', 'e', and 'f' found from the parts of the actual expanded
%equation (explained above) to output into the square of the third side
%length, known as 'c'.

end
