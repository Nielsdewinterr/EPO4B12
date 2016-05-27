function [turntime,orientation,lr,straighttime]=control(x,y,rot,xdest,ydest)
Mx=x+r*cos(180-rot);
My=y+r*sin(180-rot);

%(x^2)-2x*G+G^2+(A*x-A*c+D-H)^2-r^2=0
%(-2*a^2*c+2*a*D-2*a*H-2*G)^2=4*(a^2+1)*(-2*a*c*D+a^2*c^2+2*a*c*H+D^2-2*H*D+H^2+G^2) solve for a

