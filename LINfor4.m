% function [x,y] = LIN (r12,r13,r14,r23,r24,r34)
% test gedeelte
% auto=[autox;autoy];
x=auto(1);
y=auto(2);

r1=sqrt(y^2+(5-x)^2);
r2=sqrt((5-y)^2+(5-x)^2);
r3=sqrt((5-y)^2+(x)^2);
r4=sqrt(y^2+(x)^2);

r12 = (r1-r2)
r13 = (r1-r3)
r14 = (r1-r4)
r23 = (r2-r3)
r24 = (r2-r4)
r34 = (r3-r4)

x1 = [0;5];
x2 = [5;5];
x3 = [5;0];
x4 = [0;0];

b=[(r12)^2-norm(x1)^2+norm(x2)^2;
    (r13)^2-norm(x1)^2+norm(x3)^2;
    (r14)^2-norm(x1)^2+norm(x4)^2;
    (r23)^2-norm(x2)^2+norm(x3)^2;
    (r24)^2-norm(x2)^2+norm(x4)^2;
    (r34)^2-norm(x3)^2+norm(x4)^2;];
A=[(2*transpose(x2-x1)) (-2*r12) 0 0;
    2*transpose(x3-x1) 0 -2*r13 0;
    2*transpose(x4-x1) 0 0 -2*r14;
    2*transpose(x3-x2) 0 -2*r23 0;
    2*transpose(x4-x2) 0 0 -2*r24;
    2*transpose(x4-x3) 0 0 -2*r34;];
Y=pinv(A)*b
x=Y(2)
y=Y(1)