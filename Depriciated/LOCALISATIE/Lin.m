 function [x,y] = Lin (r12,r13,r14,r23,r24,r34,x,y)


x1 = [0;y];
x2 = [x;y];
x3 = [x;0];
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
% diff=sqrt((x-auto(1))^2+(y-auto(2))^2)
