% Author: Dr. Allison J Lopatkin %
% Last edited: October 21, 2022 %
% Simulations associated with Diaz-Tang et al., 2022, Science Advances %
% This file can be used to produce the plots of cell density (y) vs
% antibiotic (x) in figures 3, 4, and 5 in the manuscript 

clear all
close all

global u m Nm A b K


u = 0.6;  % sets the growth rate (mu in the equation)
Nm = 1;   % sets the carrying capacity
b = 0.1;  % sets the antibiotic-specific death rate
K = .1;   % sets the half manximal antibiotic-specific death rate 
m = .055; % sets the value of metabolism (epsilon in the equation)

Ause = linspace(0,1,100); % sets the range of antibiotics
tspan = [0 24];           % sets the total time of simulation

figure; hold on
subplot(1,2,1), hold on


MIC=zeros(1,length(Ause));
y0 = 1e-4;                % sets the low initial density for the left subpanel
for q = 1:length(Ause)
    A = Ause(q);
    [time,y] = ode45(@ddt_IE,tspan,y0);
    if y(end) > 1e-3
    MIC(q) = 1;
    end
end
plot(Ause,MIC,'color','#ED7D31','linewidth',6.0), set(gca,'fontsize',25,'linewidth',6.0)

MIC=zeros(1,length(Ause));
y0 = 5e-2;                % sets the high initial density for the left subpanel
for q = 1:length(Ause)
    A = Ause(q);
    [time,y] = ode45(@ddt_IE,tspan,y0);
    if y(end) > 1e-3
    MIC(q) = 1;
    end
end
plot(Ause,MIC,'color','#4472C4','linewidth',6.0), set(gca,'fontsize',25,'linewidth',6.0)

% if you wish to redefine values for the right hand plot, change here 
% only uncomment those you wish to change from lines 13-17

% u = xx;  % sets the growth rate (mu in the equation)
% Nm = xx;   % sets the carrying capacity
% b = xx;  % sets the antibiotic-specific death rate
% K = xx;   % sets the half manximal antibiotic-specific death rate 
% m = xx; % sets the value of metabolism (epsilon in the equation)

subplot(1,2,2), hold on 
MIC=zeros(1,length(Ause));
y0 = 1e-4;              % sets the low initial density for the right subpanel
for q = 1:length(Ause)
    A = Ause(q);
    [time,y] = ode45(@ddt_IE,tspan,y0);
    if y(end) > 1e-3
    MIC(q) = 1;
    end
end
plot(Ause,MIC,'color','#ED7D31','linewidth',6.0), set(gca,'fontsize',25,'linewidth',6.0)
MIC=zeros(1,length(Ause));

y0 = 5e-2;              % sets the high initial density for the right subpanel
for q = 1:length(Ause)
    A = Ause(q);
    [time,y] = ode45(@ddt_IE,tspan,y0);
    if y(end) > 1e-3
    MIC(q) = 1;
    end
end
plot(Ause,MIC,'color','#4472C4','linewidth',6.0), set(gca,'fontsize',25,'linewidth',6.0)