clear all
load LocatieF.mat;
load reference_signal.mat;

a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);

r12 = poging3(a',b',ref')
r13 = poging3(a',c',ref')
r14 = poging3(a',d',ref')
r23 = poging3(b',c',ref')
r24 = poging3(b',d',ref')
r34 = poging3(c',d',ref')
%[afstand1,afstand2,afstand3,afstand4,afstand12]=TDOA(a',b',c',d',e',ref');
% 
[x,y] = LIN(r12,r13,r14,r23,r24,r34);

plot(y,x,'x')
drawnow
xlim([0,4.53]);
ylim([0,4.14]);
text(0,0,'mic4');
text(0,4.14,'mic3');
text(4.53,0,'mic1');
text(4.53,4.14,'mic2');

hold on;

