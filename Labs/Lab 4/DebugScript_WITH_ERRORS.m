% script written for demo to class

% clear all variables, clear command window, close all objects
clear all; clc; close all

% define Cd0
Cd0 = 0.05;

% define CL and K
CL = [0:0.1:1.5];
K = 0.4;

% calculate CD
for ii=1:length(CL)
    CD(ii) = Cd0 + K*CL(ii)^2;
end

% make plot
figure
plot(CD,CL,'s--')
grid on
ylabel('C_L')

%First issue was label being misspelled.

xlabel('C_D')
title(['C_L as f(C_D) for K = ', K])

%% Redo the same calculations without using a for loop
clear
% define Cd0
Cd0 = 0.05;

% define CL and K
CL = [0:0.1:1.5];
K = 0.4;

% calculate CD
CD = Cd0 + K*CL.^2;

%Had to add period after CL in equation so it would be actually modifying
%the elements of the vector as it is supposed to.

% make plot
figure
plot(CD,CL,'rs--')
grid on
ylabel('C_L')
xlabel('C_D')
title(['Same as previous plot, but done without a for loop, K = ', num2str(K)])
% define the angles of attack for which CL was defined
CLalpha = 10;

alpha = CL*CLalpha;

% make plot
figure
plot(alpha, CL./CD,'bs--')
grid on
ylabel('L/D')
xlabel('\alpha')
title(['L/D as f(\alpha), K = ',num2str(K)])

%% clear everything and redo L/D calculations for several K values
% clear

%Removed an unnecessary pause.

% define Cd0
Cd0 = 0.05;

% define CL and K
CL = [0:0.1:1.5];
K =  [0.4:0.1:1];


% calculate CD
figure
for jj=1:length(K)
CD = Cd0 + K(jj)*CL.^2;
hold on
plot(CD,CL','s--')
grid on
ylabel('C_L')
xlabel('C_D')
title(...
    ['Same as previous plot, but done without a for loop and K is now a variable'])
end

%Had to create a for loop and add a period after CL, plus add the hold on
%and other plot/label/title/etc. stuff into loop to get plot to function
%correctly.

% make plot


% build legend
for ii = 1:length(K)
    legendEntry{ii} = ['K = ',num2str(K(ii))];
end
legend(legendEntry)

% define the angles of attack for which CL was defined
CLalpha = 10;

alpha = CL*CLalpha;

% make plot
figure
plot(alpha, CL./CD,'s--')
grid on
ylabel('L/D')
xlabel('\alpha')
title(['L/D as f(\alpha) for various K valus'])

%Removed a final legend(legendentry) that was not only misspelled but also
%unnecessary.

%% learn how to step into a function.  What must you send into this...
% funciton to be done?
myAssignment = isover(true); % ??
