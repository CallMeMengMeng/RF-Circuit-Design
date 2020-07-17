%  Solutions of <RF circuit design: Theory and Application>

%  Example P3.16

clc;
close all;

R1 = 8.65;
R2 = R1;
R3 = 141.8;
z0 = 50;
f = 2*1e9;
L = 0: 1e-12: 100*1e-12;

zin = R1+((R3+1i*2*pi*f*L)*(R2+z0))./(R2+R3+z0+1i*2*pi*f*L);
zout = R2+((R3+1i*2*pi*f*L)*(R1+z0))./(R1+R3+z0+1i*2*pi*f*L);

S11 = (zin-z0)./(zin+z0);
S22 = (zout-z0)./(zout+z0);
S12 = z0*(R3+1i*2*pi*f*L)./((R1+R2+z0)*(R3+1i*2*pi*f*L)+R1*(R2+z0));
% S12 = 2*((zin-R1)./(zin+z0))*(z0/(R2+z0));
S21 = S12;

fprintf('S parameters: \n');
fprintf('S11 = %g , S12 = %g ,\n', S11, S12);
fprintf('S21 = %g , S22 = %g ,\n', S21, S22);

fig = figure;
IL = -20*log(abs(S21));
% IL = -10*log(1-abs(S11).^2);
plot(L/1e-12, IL); grid on; xlabel('L, nH'); ylabel('IL, dB');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'P4_19.png');