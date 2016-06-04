prompt = 'What is the x coordinate?';
x = input(prompt);
prompt = 'What is the y coordinate?';
y = input(prompt);

r1=sqrt((4.14-y)^2+(x)^2);
r2=sqrt((y)^2+(x)^2);
r3=sqrt((y)^2+(4.53-x)^2);
r4=sqrt((4.14-y)^2+(4.53-x)^2);
r5=sqrt(y^2+(2.27-x)^2);

r12 = (r1-r2);
r13 = (r1-r3);
r14 = (r1-r4);
r15 = (r1-r5);
r23 = (r2-r3);
r24 = (r2-r4);
r25 = (r2-r5);
r34 = (r3-r4);
r35 = (r3-r5);
r45 = (r4-r5);

LIN (r12,r13,r14,r23,r24,r34)
