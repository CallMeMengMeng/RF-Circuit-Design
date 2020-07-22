%  Solutions of <RF circuit design: Theory and Application>

%  Example P5.14

clc;
close all;

z0 = 50;
Coc = 0.1*1e-12;
Cs = 0.05*1e-12;
l = 0.005;
vp = 1.5*1e8;

f = 10*1e6: 100*1e9/1000 :100*1e9;
zl = -1i./(2*pi*f*Coc);
beta = 2*pi*f/vp;
zin1 = z0*(zl+1i*z0.*tan(beta*l))./(z0+1i*zl.*tan(beta*l));
zin2 = 1./(1./zin1+1i*2*pi*f*Cs);
zin3 = 1./(1./zin2+1i*2*pi*f*Coc);
zin4 = z0*(zin3+1i*z0.*tan(beta*l))./(z0+1i*zin3.*tan(beta*l));

fig = figure;
plot(f/1e9, abs(zin1)); axis([0 100 0 350]); grid on; hold on;
plot(f/1e9, abs(zin4), '--'); axis([0 100 0 350]); 
title('5mm line terminaled by Coc (solid) versus total impedence (dashed)');
xlabel('frequency, MHz'); ylabel('|Zin|,\Omega'); legend('zin1','zin4');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'P5_14.png');
