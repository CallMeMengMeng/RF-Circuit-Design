%  Solutions of <RF circuit design: Theory and Application>

%  Problem 1.23

%  An RFC is constructed by winding four turns of AWG 38 copper wire on a 

%  2mm ceramic core diameter (mu_r = 1) of 0.1mm length. Estimate the

%  inductance, stray capacitance, resistance, and resonance frequency.

clc;
close all;

N = 4;
r = 1e-3;
l = 0.1*1e-3;
a = 0.1016*(1e-3)/2; % AWG 38
mu0 = 4*pi*1e-7;
epsilon_r = 8.85418*1e-12;
Cu = 64.516*1e6;

L = (mu0*N^2*pi*r^2)/l;
fprintf('Inductance: L = %g nH \n', L/1e-9);

Cs = 4*pi*epsilon_r*a*r*N^2/l;
fprintf('Stray capacitance: Cs = %g pF \n', Cs/1e-12);

Rs = 2*pi*r*N/(Cu*pi*a^2);
fprintf('Series resistance: Rs = %g mOhm \n', Rs/1e-3);

fr = 1/(2*pi)*sqrt(1/(L*Cs)-(Rs/L)^2);
fprintf('Resonance frequency: fr = %g GHz \n', fr/1e9);

f = 0: 1e7: 1e9;
z = (1i*2*pi*f*L+Rs)./(1-((2*pi*f).^2)*L*Cs+1i*(2*pi*f)*Rs*Cs);
plot(f/1e6, abs(z)/1e3); grid on; title('Impedance response |z| of inductor');
axis([0 1000 0 80]); xlabel('frequency, MHz'); ylabel('|z|, k\Omega');
