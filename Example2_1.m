%  Solutions of <RF circuit design: Theory and Application>

%  Example 2.1

clc;
close all;

r1 = 0: 1e-3: 5*1e-3;
r2 = 5*1e-3: 1e-3: 50*1e-3;

I = 5;
a = 5*1e-3;

fig = figure;

H1 = I.*r1/(2*pi*a^2);
plot(r1/1e-3, abs(H1)); grid on; hold on;
    
H2 = I./(2*pi*r2);

plot(r2/1e-3, abs(H2)); hold on; grid on;

plot([5,5],[0,160],'m--'); 

title('半径为5mm，电流5A的无限长导线内部和外部的磁场分布');
xlabel('r, mm'); ylabel('H, A/m');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'E2_1.png');