clear all

load 'refs.mat';
load '11.mat';

vx=5.50; 
vy=5.70;
ref = refb6000;
a = inputbuffer(:,1);
b = inputbuffer(:,2);
c = inputbuffer(:,3);
d = inputbuffer(:,4);

[r12,r13,r14,r23,r24,r34] =TDOA(a,b,c,d,ref);
[x,y]=linnie(r12,r14,r23,r34);

 
    plot(x,y,'x')
hold on;
drawnow

xlim([0,vx]);
ylim([0,vy]);
text(0,0,'mic2');
text(0,vy,'mic1');
text(vx,0,'mic3');
text(vx,vy,'mic4');

