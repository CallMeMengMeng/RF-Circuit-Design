%  Solutions of <RF circuit design: Theory and Application>

%  Example P3.16

clc;
close all;

z0 = 50;
zl = 73;
fc = 2*1e9;
f = fc/3: fc/30: 3*fc;
vp = 3*1e8;
beta = 2*pi*f/vp;

z_1 = sqrt(zl*z0);
fprintf('Characteristic impedance of 1/4 wavelength line: z = %f Ohm \n', z_1);
l = vp/(4*fc);
fprintf('Length of 1/4 wavelength line: l = %f cm \n', l*100);

zin = z_1*(zl+1i*z_1*tan(beta*l))./(z_1+1i*zl*tan(beta*l));
gamma = (zin-z0)./(zin+z0);
ASWR = (1+abs(gamma))./(1-abs(gamma));

fig = figure;
plot(f/1e9, ASWR, 'LineWidth', 2.0); grid on; axis([0.5 6 1 1.5]);
title('The relationship between frequency and ASWR'); xlabel(' frequency, GHz'); ylabel('ASWR');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'P3_16.png');