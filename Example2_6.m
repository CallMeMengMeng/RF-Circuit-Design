%  Solutions of <RF circuit design: Theory and Application>

%  Example 2.6

clc;
close all;

l = 0.1;
L = 209.4*1e-9;
C = 119.5*1e-12;
f = 1e9: 5*1e6: 4*1e9;

vp = 1/sqrt(L*C);
z0 = sqrt(L/C);
zin_s = 1i*z0*tan(2*pi*f*l/vp);
zin_c = -1i*z0./tan(2*pi*f*l/vp);

fig = figure;
subplot(2,1,1);
plot(f/1e9, abs(zin_s)); axis([1 4 0 500]); xlabel('frequency, GHz'); ylabel('|z_{in}|');
title('The relationship between |z_{in}| and frequency of a 10cm short-transmite line');
subplot(2,1,2);
plot(f/1e9, abs(zin_c)); axis([1 4 0 500]); xlabel('frequency, GHz'); ylabel('|z_{in}|');
title('The relationship between |z_{in}| and frequency of a 10cm cut-transmite line');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'E2_6.png');