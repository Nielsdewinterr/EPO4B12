clear all
close all
load E.mat;
load Reference_signal_3.mat;


a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);

r12 = poging3(a',b',ref1', ref2');
r13 = poging3(a',c',ref1', ref2');
r14 = poging3(a',d',ref1', ref4');
r23 = poging3(b',c',ref2', ref3');
r24 = poging3(b',d',ref2', ref4');
r34 = poging3(c',d',ref3', ref4');

[x,y] = LIN(r12,r13,r14,r23,r24,r34);



plot(y,x,'x')
drawnow
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

hold on;
 
