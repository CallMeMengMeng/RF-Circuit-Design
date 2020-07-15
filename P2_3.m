%  Solutions of <RF circuit design: Theory and Application>

%  Example P2.3

clc;
close all;

I = 5;
a = 5*1e-3;
D = 10*a;
d = D/2;

r = -10*a: a/100: 10*a;

H1_inside = I*(r+d)/(2*pi*a^2);
H1_outside = I./(2*pi*(r+d));
H1 = H1_inside.*((r+d)>-a & (r+d)<a)+H1_outside.*((r+d)<=-a | (r+d)>=a);

H2_inside = I*(r-d)/(2*pi*a^2);
H2_outside = I./(2*pi*(r-d));
H2 = H2_inside.*((r-d)>-a & (r-d)<a)+H2_outside.*((r-d)<=-a | (r-d)>=a);

fig = figure;
plot(r/1e-3, H1, 'r:', r/1e-3, H2, 'b--', r/1e-3, H1+H2, 'k');
title('Magnetic field produced by two parallel conductors');
xlabel('Distance r, mm'); ylabel('Magnetic field H(r), A/m');
legend('Left conductor', 'Right conductor', 'Combined field');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'P2_3.png');