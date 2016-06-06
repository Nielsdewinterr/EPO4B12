
function [x1,y1]=linnie(r12,r14,r23,r34)
tic
xlim1=4.53
ylim1=4.14
a=r12
b=r34
c=r23
d=r14

x=[0:0.01:xlim1];
y=[0:0.01:ylim1];

%wolfram alpha
y12=-sign(a)*1/2*sqrt((a^4-4*a^2*x.^2-ylim1^2*a^2)/(a^2-ylim1^2))+ylim1/2;
y34=sign(b)*1/2*sqrt((b^4-4*b^2*(-x+xlim1).^2-ylim1^2*b^2)/(b^2-ylim1^2))+ylim1/2;
x23=sign(c)*1/2*sqrt((c^4-4*c^2*y.^2-xlim1^2*c^2)/(c^2-xlim1^2))+xlim1/2;
x14=sign(d)*1/2*sqrt((d^4-4*d^2*(-y+ylim1).^2-xlim1^2*d^2)/(d^2-xlim1^2))+xlim1/2;


cut1=abs(y12-y34);
 
[mini sampy]=min(cut1);
y1=y12(sampy)

cut2=abs(x23-x14);
[mini sampx]=min(cut2);
x1=x23(sampx)

hold on
plot(x,y12)
plot(x,y34)
plot(x23,y)
plot(x14,y)
xlim([0 4.53]);
ylim([0 4.14]);
hold off

toc

end