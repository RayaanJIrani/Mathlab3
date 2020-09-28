% migration.m
% NAME
% DESCRIPTION

close all  % close all figures
clear all  % clear workspace (working memory)

% (#1) SET THE MIGRATION MATRIX.


% Compute and plot the populations years 2020 through 2070.

% (#2A) SET THE INITIAL POP VECTOR
x = [0; 0];  % change to pop vec year 2020


figure  % opens a new figure
plot(2020, x(1), '.b','markersize',12) % plot initial city pop
hold on  % allow multiple plots on the same figure
plot(2020, x(2), 'xr','markersize',8)  % plot initial suburb pop

% loop through the next 50 years and iteratively update
for k = 1 : 50
    
    % (#2B) UPDATE THE POP VECTOR
    x = [0; 0];  % change to equation for the pop year 2020+k
    
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



% (#3B) WRITE THE SET OF ALL FIXED POINTS BELOW %{, ABOVE %}
%{


%}

% (#4) COMPUTE THE EQUILIBRIUM POP VEC
xeq = [0; 0];  % change to equilibrium populations

% Add the equilibrium pops to the plot
plot([2018 2068], xeq(1)*[1 1], '--b')
plot([2018 2068], xeq(2)*[1 1], '--r')
legend('City','Suburbs')
hold off  % remove the hold so that nothing more can be added

