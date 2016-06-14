t=[0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.3];
a=[0 10 30 52 90 125 160 205 220 245 285 315 335 360];

xq = 0:0.02:360;
vq2 = interp1(t,a,xq,'spline');
plot(t,a,'o',xq,vq2,':.');
xlim([0 2*pi]);
title('Spline Interpolation');