H = [1, 2, 3] ;
N = [7, 8, 9] ;
[ C ] = crossproduct(H, N) ;
D = cross(H, N) ;

disp(['Solution via my function:' , num2str(C)])
disp(['Solution via MATLAB:' , num2str(D)])

%Establishes two vectors (H and N), runs them through the cross product
%function that I made. Then also runs them through the built in MATLAB
%cross product function. Displays both results for comparison.

V = [1, 2, 3, 4, 5] ;
t = [0.2, 0.4, 0.6, 0.9, 1.1] ;
Vsquared = V.^2 ;
Vcubed = V.^3 ;
figure(1)
hold on
plot(t, V, 'r')
plot(t, Vsquared, 'g')
plot(t, Vcubed, 'b')
xlabel('Time (s)')
ylabel('Velocity (ft/s)')
title('Velocity vs. Time')
legend('V vs. t' , 'V^2 vs. t', 'V^3 vs. t')

%Establishes two vectors (V and t). Squares and cubes the elements of V to
%get two new vectors. Plots all three powers of V vs. t, on the same graph.
%Each curve is different color (red, green, blue in order). Axis labels and
%title for graph, plus a legend to differentiate curves.