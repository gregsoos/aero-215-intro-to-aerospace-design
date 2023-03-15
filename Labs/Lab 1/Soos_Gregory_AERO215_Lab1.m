 a = 5 ;
 b = 11 ;
 C = 28 ;

 %These first three lines are where 'a', 'b' and 'C' in the law of coines 
 %are defined. You enter in the two known side lengths (a & b) of the 
 %triangle in addition to the value of their included angle (C).
 
 [ c ] = lawofcosines( a , b , C ) ;
 
 %This line runs the function lawofcosines to find the value of the missing
 %third side.
 
 disp('Side a:')
 disp(a)
 
 disp('Side b:')
 disp(b)
 
 disp('Side c:')
 disp(sqrt(c))
 
 %Lines 13 to 20 make the Command Window display the three sides of the
 %triangle. 'a' and 'b' are, of course, defined from earlier. 'c' must be
 %square-rooted since the function outputs the square of the side length
 %(see: Law of Cosines equation) rather than the side length itself. Hence,
 %by square-rooting the outputted value, the actual side length is
 %retrieved.
 
 
 
