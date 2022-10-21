% Author: Dr. Allison J Lopatkin %
% Last edited: October 21, 2022 %
% Simulations associated with Diaz-Tang et al., 2022, Science Advances %
% This file can be used to create heat maps that vary growth, metabolism
% and deltaMIC % 
% These heatmaps are associated with Fig 3 and in Fig. S8 % 

clear
close all

global u m Nm A b K


u = 0.6; % sets the growth rate
Nm = 1;  % sets the carrying capacity
b = 0.1; % sets the antibiotic-specific killing rate
K = 0.1; % sets the half maximal  antibiotic specific killing rate
m = .055; % sets metabolism 


Ause = linspace(0,2,100);  %% range of antibiotic values that are tested 
tspan = [0 24]; %% the time span over which the simualtion occurs

var2_use = linspace(0,2,25);  %% establishes the range of growth rates used
var1_use = linspace(0,0.5,25); %% establishes hte range of metabolism used

y0_all = [1e-4;5e-2];  %% establishes the two different initial values of bacterial density 

dMIC = zeros(length(var2_use),length(var1_use));
for i = 1:length(var2_use)
    i
    for j = 1:length(var1_use)
        u = var2_use(i);
        m = var1_use(j);
        MIC = zeros(2,1);
        for yy = 1:length(y0_all)
            density=zeros(1,length(Ause));
            for q = 1:length(Ause)
                A = Ause(q);
                [time,y] = ode45(@ddt_test1,tspan,y0_all(yy));
                if y(end) > 1e-3
                    density(1,q) = 1;
                end
            end
            
            if all(density == 0)       % then drug was too high
                MIC(yy,1) = Ause(end); % could set arbitrarily high instead of taking the last value
            elseif all(density == 1)   % then drug was too low
                MIC(yy,1) = Ause(1);
            else
                MIC(yy,1) = Ause(find(density==0,1,'first'));
            end
            
        end
        dMIC(i,j) = MIC(2) - MIC(1);
        
    end
end


figure;  %% creates a heat map

surf(var1_use,var2_use,dMIC);
xlabel('m'), ylabel('\mu'), title('\DeltaMIC')
caxis([0, 2]);
shading interp
colormap parula
view(2)