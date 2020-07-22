%  Solutions of <RF circuit design: Theory and Application>

%  Example P5.12

clc;
close all;

C = 0.1*1e-12;
z0 = 50;
l = 0.01;
vp = 1.5*1e8;

f = 10*1e6: 100*1e9/1000 :100*1e9;
zl = -1i./(2*pi*f*C);
beta = 2*pi*f/vp;
zin1 = z0*(zl+1i*z0.*tan(beta*l))./(z0+1i*zl.*tan(beta*l));
zin2 = -1i*z0./tan(beta*l);
zin3 = 1i*z0*tan(beta*l);

fig = figure;
subplot(3,1,1); plot(f/1e9, abs(zin1)); axis([0 100 0 350]); title('Capacity terminal line'); 
xlabel('frequency, MHz'); ylabel('|Zin|, \Omega'); grid on;
subplot(3,1,2); plot(f/1e9, abs(zin2)); axis([0 100 0 350]); title('Open circuit line');
xlabel('frequency, MHz'); ylabel('|Zin^{oc}|, \Omega'); grid on;
subplot(3,1,3); plot(f/1e9, abs(zin3)); axis([0 100 0 350]); title('Short circuit line'); 
xlabel('frequency, MHz'); ylabel('|Zin^{sc}|, \Omega'); grid on;

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'P5_12.png');
