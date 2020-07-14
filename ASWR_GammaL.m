% The relationship between ASWR and |Gamma_l|

clc;
close all;

Gamma = 0: 0.1: 1;
ASWR = (1+Gamma)./(1-Gamma);

fig = figure;
plot(Gamma, ASWR); title('The relationship between |\Gamma_l| and ASWR');
xlabel('|\Gamma_l|'); ylabel('ASWR');

frame = getframe(fig);
img = frame2im(frame);
imwrite(img, 'The_relationship_between_ASWR_and_Gamma_l.png');