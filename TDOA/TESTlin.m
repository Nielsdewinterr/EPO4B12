prompt = 'What is the x coordinate?';
x = input(prompt);
prompt = 'What is the y coordinate?';
y = input(prompt);
prompt = '4 or 5 microphones?';
m = input(prompt); 

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

if(m==4)
    LINfor4 (r12,r13,r14,r23,r24,r34)
elseif(m==5)
    LINfor5 (r12,r13,r14,r15,r23,r24,r25,r34,r35,r45)
else
    display('choose 4 or 5')
end