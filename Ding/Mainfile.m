clear all;
close all;

load ding2.mat;
load reference_signal.mat;

a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);

[r12,r13,r14,r15,r23,r24,r25,r34,r35,r45]=TDOA(a',b',c',d',e',ref1);

[x,y] = LIN(r12,r13,r14,r23,r24,r34);

plot(y,x,'x')
drawnow
hold on;
xlim([0,4.53]);
ylim([0,4.14]);