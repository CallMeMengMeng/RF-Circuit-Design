%  Solutions of <RF circuit design: Theory and Application>

%  Problem 1.8

clc;
close all;

R = 50;
L = 10e-9;
C = 1e-12;
f = 1e6: 1e6: 5*1e9;

Out = (1i*L*2*pi*f)./((R-R*L*C*4*(pi^2)*(f.^2))+1i*2*pi*f*L);

plot(f/1e6, abs(Out)); grid on; 
title('Transfer response |V_o/V_i|'); xlabel('frequency, GHz'); ylabel('|V_o/V_i|');