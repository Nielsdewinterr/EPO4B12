function [x,y] = LINfor5 (r12,r13,r14,r15,r23,r24,r25,r34,r35,r45)

x1 = [0;5];
x2 = [5;5];
x3 = [5;0];
x4 = [0;0];
x5 = [2.5;0];

b=[ (r12)^2-norm(x1)^2+norm(x2)^2;
    (r13)^2-norm(x1)^2+norm(x3)^2;
    (r14)^2-norm(x1)^2+norm(x4)^2;
    (r15)^2-norm(x1)^2+norm(x5)^2;
    (r23)^2-norm(x2)^2+norm(x3)^2;
    (r24)^2-norm(x2)^2+norm(x4)^2;
    (r25)^2-norm(x2)^2+norm(x5)^2;
    (r34)^2-norm(x3)^2+norm(x4)^2;
    (r35)^2-norm(x3)^2+norm(x5)^2;
    (r45)^2-norm(x4)^2+norm(x5)^2;];
A=[(2*transpose(x2-x1)) (-2*r12)    0       0       0;
    2*transpose(x3-x1)      0   (-2*r13)    0       0;
    2*transpose(x4-x1)      0       0   (-2*r14)    0;
    2*transpose(x5-x1)      0       0       0    (-2*r15);
    2*transpose(x3-x2)      0   (-2*r23)    0       0;
    2*transpose(x4-x2)      0       0   (-2*r24)    0;
    2*transpose(x5-x2)      0       0       0    (-2*r25);
    2*transpose(x4-x3)      0       0   (-2*r34)    0;
    2*transpose(x5-x3)      0       0       0    (-2*r35);
    2*transpose(x5-x4)      0       0       0    (-2*r45);];
Y=pinv(A)*b
x=Y(2);
y=Y(1);