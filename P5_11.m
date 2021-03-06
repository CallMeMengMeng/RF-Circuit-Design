%  Solutions of <RF circuit design: Theory and Application>

%  Example P5.9

clc;
close all;

fH = 3.6*1e9;
fL = 2.5*1e9;
fc = sqrt(fH*fL);
f = fH;
fprintf('fc = %f GHz \n', fc/1e9);

epsilon = f/fc-fc/f;
omega = (fH-fL)/(epsilon*fc);
fprintf('omega(fc) = %f \n', omega);

g0 = 1;
g1 = 3.4389;
g2 = 0.7483;
g3 = 4.3471;
g4 = 0.5920;
g5 = 5.8095;

sqr_w = 4*pi^2*fc^2;
BW = 2*pi*(fH-fL);

L1 = BW*g1/sqr_w;
C1 = 1/(BW*g1);
C2 = BW*g2/sqr_w;
L2 = 1/(BW*g2);
L3 = BW*g3/sqr_w;
C3 = 1/(BW*g3);
C4 = BW*g2/sqr_w;
L4 = 1/(BW*g4);

f = 0;
for i = 1:2000
    omega = 2*pi*f;
    A0 = [1 g0; 0 1];
    A1 = [1 1i./(omega*C1-1./(omega*L1)); 0 1];
    A2 = [1 0; 1i./(omega*L2-1./(omega*C2)) 1];
    A3 = [1 1i./(omega*C3-1./(omega*L3)); 0 1];
    A4 = [1 0; 1i./(omega*L4-1./(omega*C4)) 1];
    A5 = [1 0; 1/g5 1];
    A = A0*A1*A2*A3*A4*A5;
    H(i) = 1/(1+g0/g5)./A(1);
    freq(i) = f;
    f = f+0.001*fc;
end

fig = figure;
plot(freq/1e9, -20*log10(abs(H))); grid on; axis([0 6 -1 70]);
xlabel('Frequency, GHz'); ylabel('Attenuation, dB'); title('Fourth Order BSF');
frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'P5_11.png');


