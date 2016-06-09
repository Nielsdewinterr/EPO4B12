t=[0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.3]
a=[0 10 30 52 90 125 160 180+25 220 245 180+105 180+135 335 360]

xq = 0:0.02:360
vq2 = interp1(t,a,xq,'spline');
plot(t,a,'o',xq,vq2,':.');
xlim([0 2*pi]);
title('Spline Interpolation');