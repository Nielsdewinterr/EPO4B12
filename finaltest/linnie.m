
function [x1,y1]=linnie(r12,r14,r23,r34)
%--------------------------------
xlim1=5.7;
ylim1=5.5;
%---------------------------------

a=r12;
b=r34;
c=r23;
d=r14;

x=[0:0.01:xlim1];
y=[0:0.01:ylim1];

%hyperbolic curves
y12=  -sign(a)*1/2*sqrt((a^4-4*a^2*x.^2-ylim1^2*a^2)/(a^2-ylim1^2))+ylim1/2;
y34=  sign(b)*1/2*sqrt((b^4-4*b^2*(-x+xlim1).^2-ylim1^2*b^2)/(b^2-ylim1^2))+ylim1/2;
x23=  sign(c)*1/2*sqrt((c^4-4*c^2*y.^2-xlim1^2*c^2)/(c^2-xlim1^2))+xlim1/2;
x14=  sign(d)*1/2*sqrt((d^4-4*d^2*(-y+ylim1).^2-xlim1^2*d^2)/(d^2-xlim1^2))+xlim1/2;


cut1=abs(y12-y34); 
[mini sampy]=min(cut1);
y1=(y12(sampy)+y34(sampy))/2;


cut2=abs(x23-x14);
[mini sampx]=min(cut2);
x1=(x23(sampx)+x14(sampx))/2;

% close all
% hold on
% line([0 xlim1],[0 0])
% line([0 xlim1],[ylim1 ylim1])
% line([0 0],[0 ylim1])
% line([xlim1 xlim1],[0 ylim1])
% 
% plot(x,y12,'red')
% plot(x,y34,'blue')
% plot(x23,y,'yellow')
% plot(x14,y,'black')
% plot(x1,y1,'o')
% text(x1,y1,'B');
% text(0,0,'Mic 2');
% text(0,ylim1,'Mic 1');
% text(xlim1,0,'Mic 3');
% text(xlim1,ylim1,'Mic 4');
% 
% xlim([-0.5 xlim1+0.5]);
% ylim([-0.5 ylim1+0.5]);
end
