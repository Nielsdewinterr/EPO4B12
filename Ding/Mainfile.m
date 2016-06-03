clear all;
close all;

load c.mat;
load reference_signal.mat;

a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);

[r12,r13,r14,r15,r23,r24,r25,r34,r35,r45]=TDOA(a',b',c',d',e',ref3');

[x,y] = LIN(r12,r13,r14,r23,r24,r34);

plot(y,x,'x')
drawnow;
hold on;
xlim([0,4.53]);
ylim([0,4.14]);
text(0,0,'mic2');
text(0,4.14,'mic1');
text(4.53,0,'mic3');
text(4.53,4.14,'mic4');
text(2.27, 2.07,'A');
text(1.00, 2.04,'B');
text(1.45, 3.44,'C');
text(2.55,3.14,'D');
text(3.78, 0.70,'E');
text(1.81, 0.56,'F');

