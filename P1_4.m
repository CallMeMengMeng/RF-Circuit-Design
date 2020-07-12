%  Solutions of <RF circuit design: Theory and Application>

%  Problem 1.4

f = 5e9;
c = 3e8;
epsilon_r = 4;
t1 = 3e-6;
t2 = 7e-6;
E_0x = 1e6;

fprintf('+====Problem 1.4====+ \n');

H_0y = E_0x*sqrt(epsilon_r)/377;
fprintf('(1) H_{0y} = %4.2e lambda/m \n', H_0y);

vp = c/sqrt(epsilon_r);
lambda = vp/f;
fprintf('(2) v_p = %4.2e m/s , lambda = %4.2e m \n', vp, lambda);

k = 2*pi*f/vp;
z1 = 2*pi*f*t1/k;
z2 = 2*pi*f*t2/k;
fprintf('(3) z1 = %4.2e m , z2 = %4.2e m , delta_z = %4.2e m \n', z1, z2, (z2-z1));