%  Solutions of <RF circuit design: Theory and Application>

%  Problem 1.5

close all;
clc;

f = 30e6:1000:300e6;
L = 10e-9;
C = 10e-12;
R = 5;

z1 = 1./(1i*2*pi*f*C+1./(1i*2*pi*f*L));
z2 = 1i*(2*pi*f*L-1./(2*pi*f*C));
z3 = 1./(1i*2*pi*f*C+1./(1i*2*pi*f*L+R));
z4 = 1i*(2*pi*f*L-1./(2*pi*f*C))+R;


subplot(2,2,1); plot(f/1e6, abs(z1)); grid on;
title('Parallel LC Circuit'); xlabel('Frequency, MHz'); ylabel('|z_1|, Ohm');

subplot(2,2,2); plot(f/1e6, abs(z2)); grid on;
title('Series LC Circuit'); xlabel('Frequency, MHz'); ylabel('|z_2|, Ohm');

subplot(2,2,3); plot(f/1e6, abs(z3)); grid on;
title('Parallel (L+R)C Circuit'); xlabel('Frequency, MHz'); ylabel('|z_3|, Ohm');

subplot(2,2,4); plot(f/1e6, abs(z4)); grid on;
title('Series (L+R)C Circuit'); xlabel('Frequency, MHz'); ylabel('|z_4|, Ohm');