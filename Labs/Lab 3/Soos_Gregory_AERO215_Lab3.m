for row = 1:3
    for col = 1:4
        array_loop(row, col) = rand ;
    end
end
[M,I] = min(array_loop, [], 2) ;
disp(['Row 1 Minimum: ', num2str(M(1)), ', from Column ', num2str(I(1))])
disp(['Row 2 Minimum: ', num2str(M(2)), ', from Column ', num2str(I(2))])
disp(['Row 3 Minimum: ', num2str(M(3)), ', from Column ', num2str(I(3))])
disp('-----')

%The above code generates a random 3x4 matrix via a pair of for loops. Line
%6 acts to find the the smallest element of each row while also recording
%each's index. Then the displays act to convert the numbers to strings for
%each minimum value, and output them into a simple line detailing the
%minimum value of each row and its corresponding column.

car.color = 'white ' ;
car.year = '1998 ' ; 
car.make = 'Honda ' ;
car.model = 'Civic' ;
car.class = 'LX class ' ;
car.cylinders = '4 cylinders' ;

structureprint(car)

disp('-----')

%The above code attaches a string to different elements of the structure
%"car". Then, the function "structureprint" runs to call the elements and
%form the full first sentence from the question.

auto{1} = 'white ' ;
auto{2} = '1998 ' ; 
auto{3} = 'Honda ' ;
auto{4} = 'Civic' ;
auto{5} = 'LX class ' ;
auto{6} = '4 cylinders' ;

cellprint(auto)

%The above code attaches a string to different elements of the cell "auto".
%Then, the function "cellprint" runs to call the elements and form the full
%first sentence from the question.

t = 0:0.02:0.6 ; 
y = 3*sin(2*pi*10*t) ; 
plot(t,y)

%The problem with the above code is the step size on "t". Since "t" only
%has a step size of 0.02, and is generated from 0 to 0.6, it only generates
%30 data points. Since the graph connects each data point linearly, it
%still makes the sine wave look very rigid and not at all smooth as it
%should.

t = 0:0.001:100 ;
y = 3*sin(2*pi*10*t) ;
plot(t,y)

%The problem with the above code is the domain is simply far too large. The
%frequency of this sine wave is only 10 Hz, so of course when the equation
%is graphed from 0 to 100, the sine wave will go through so many periods
%that the graph will just look like one blob of instead of a sine wave. The
%display size of the graph on the screen is small, so when you force it to
%display that many periods of the sine wave, it just becomes a completely 
%blue screen.

t = 0:0.001:0.6 ;
y = 3*sin(2*pi*10*t) ;
plot(t, y, 'LineWidth', 4)
grid on
xlabel('Time (s)')
ylabel('Amplitude (m)')
title('Sine Wave with Frequency of 10 Hz, Amplitude of 3 m')

%This code actually works to graph the function because it doesn't fall
%victim to either of the problems the above two segments of code fall to. 
%It has a small step size to make the graph actually look smooth, but also 
%has a small enough domain that the sinusoid can be seen clearly (but not 
%to the point that it is so small that it looks more like you're looking at
%a line than a sinusoid). The rest of the coded adds labels, a title, a
%grid, and changes the line width.