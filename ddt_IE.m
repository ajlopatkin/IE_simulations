% Author: Dr. Allison J Lopatkin %
% Last edited: October 21, 2022 %
% Simulations associated with Diaz-Tang et al., 2022, Science Advances %
% This file is used to run the 'heatmap_u_m.m and run_test1 files as it 
% contains the equation. 

function ddt = ddt_IE(t,y)

global u m Nm A b K 


dNdt = (u - m) * (1 - y(1) / Nm) * y(1) - y(1) * A * b ./ (K + y(1));
ddt = [dNdt];


end