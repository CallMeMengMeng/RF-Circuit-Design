%  Solutions of <RF circuit design: Theory and Application>

%  Problem 1.6

clc;
close all;

R = 0:1:200;
L = 10e-9;
C = 1e-12;

f =( 1/(2*pi))*sqrt(1/(L*C)-(R.^2)/(L^2));

subplot(1,2,1); plot(R, f/1e6); 
% semilogx(R, f/1e6);
grid on; title('Resonance frequency versus resistance');
xlabel('Resonance, Ohm'); ylabel('f, MHz');

% Problem 1.7

R1 = 0.1:0.01:10;
f1 = ( 1/(2*pi))*sqrt(1/(L*C)-1./((R1.^2)*(L^2)));

subplot(1,2,2); % plot(R1, f1/1e6); 
semilogx(R1, f1/1e6);
grid on; title('Resonance frequency versus resistance');
xlabel('Resonance, Ohm'); ylabel('f, MHz');