%  Solutions of <RF circuit design: Theory and Application>

%  Example P5.9

clc;
close all;

fH = 2*1e9;
fL = 1.9*1e9;
fc = 1.95*1e9;
g0 = 1;
g1 = 1.5963;
g2 = 1.0967;
g3 = 1.5963;
g4 = 1;

L1 = g1/(2*pi*(fH-fL));
C1 = (2*pi*(fH-fL))/(g1*4*pi^2*fc^2);
L2 = g2/(2*pi*(fH-fL));
C2 = (2*pi*(fH-fL))/(g2*4*pi^2*fc^2);
L3 = g3/(2*pi*(fH-fL));
C3 = (2*pi*(fH-fL))/(g3*4*pi^2*fc^2);

f = 0;
for i = 1:3000
    omega = 2*pi*f;
    A0 = [1 g0; 0 1];
    A1 = [1 1i*(omega*L1-1./(omega*C1)); 0 1];
    A2 = [1 0; 1i*(omega*L2-1./(omega*C2)) 1];
    A3 = [1 1i*(omega*L3-1./(omega*C3)); 0 1];
    A4 = [1 0; 1 1];
    A = A0*A1*A2*A3*A4;
    H(i) = 2./(A(1));
    freq(i) = f;
    f = f+0.001*fc;
end

fig = figure;
plot(freq/1e9, -20*log10(abs(H))); grid on; axis([1.85 2.05 -1 5]);
xlabel('Frequency, GHz'); ylabel('Attenuation, dB'); title('Third Order BPF');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'P5_10.png');