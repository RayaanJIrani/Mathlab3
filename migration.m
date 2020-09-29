% migration.m
% Rayaan Irani
% A program which projects the next 50 years of urbanization in Dallas and
% determines the equilibrium population and proportion of Dallas (ceteris paribus) 

close all  % close all figures
clear all  % clear workspace (working memory)

% (#1) SET THE MIGRATION MATRIX.
M = [.94 , .04; .06, .96];

% Compute and plot the populations years 2020 through 2070.

% (#2A) SET THE INITIAL POP VECTOR
x = [10 * 10^6; 800*10^3];  % change to pop vec year 2020


figure  % opens a new figure
plot(2020, x(1), '.b','markersize',12) % plot initial city pop
hold on  % allow multiple plots on the same figure
plot(2020, x(2), 'xr','markersize',8)  % plot initial suburb pop

% loop through the next 50 years and iteratively update
for k = 1 : 50
    
    % (#2B) UPDATE THE POP VECTOR
    x = M * x;  % change to equation for the pop year 2020+k
    
    % Plot the populations year k
    plot(2020+k, x(1), '.b','markersize',12)
    plot(2020+k, x(2), 'xr','markersize',8)

end

% Annotate the figure
axis tight  % set x and y limits to remove extra white space
title('Population Migration')  
xlabel('Year')
ylabel('Population')
legend('City','Suburbs')
set(gca,'fontsize',20)  % set all text to fontsize 20
grid on  % show gridlines

% Compute the equilibrium population

% (#3A) CONSTRUCT THE COEFF MATRIX A OF THE HOMOG. EQN, DISPLAY
A = [-.06, .04; .06, -.04]


% (#3B) WRITE THE SET OF ALL FIXED POINTS BELOW %{, ABOVE %}
%{
    The uniquilibrium population vector is any 2 x 1 vector [c * 2/3; c *
    1] for any scalar c. Where c is the population of the suburbs. 
    This set
    of values leads to an equilibrium because the net rate of change of
    both the population of the city and the suburbs is equal to 0. The
    ratio between the population of a city and the population of the suburb
    can be calculated by making the quantity of city dwellers going to the
    suburbs and the number of suburbanities moving to the city are made
    equivalent. By algebracily solving for the rate of movement amongst
    these two categories (4% and 6%) leads to the ratio of 2/3 city to 1
    suburb. 
%}

% (#4) COMPUTE THE EQUILIBRIUM POP VEC
xeq = [4320000; 6480000];  % change to equilibrium populations

%{
    Condition(2) states (axiomatically) that x*(1) + x*(2) = x0(1) + x0(2).
    Therfore by taking the sum of the inital population of the city and
    suburbs of dallas one can generate the population at equilibrium. By
    then adding the values 10 million and 800 thousand we can deduce that
    the equilibrium population of Dallas will be 10 million 800 thousand.
    As was proven by my answer in #3B the ratio between the population of
    the city and suburbs at equilibrium must be 2/3 to one (respectivly).
    Using this ratio, one can algerically identify the value of the scalar
    c by multipling the population of Dallas (10800000) by the inverse of
    the sum of the ratios (3/5). With this value for c (6,480,000) one can
    multiply the scalar by the value of the ratios to find the values of
    the vector for urbanization distribution of Dallas at equilibrium.
%}

% Add the equilibrium pops to the plot
plot([2018 2068], xeq(1)*[1 1], '--b')
plot([2018 2068], xeq(2)*[1 1], '--r')
legend('City','Suburbs')
hold off  % remove the hold so that nothing more can be added

