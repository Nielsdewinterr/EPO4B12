
prompt='Connect/Init Gedraaid/Vorige waarde opgeslagen? -> zo niet doe dat nu!!';
input(prompt);
clear all;
prompt='Start?';
input(prompt);

inputbuffer =  audio_recieve;

a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);

[r12,r13,r14,r23,r24,r34] = TDOA(a,b,c,d,e);

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

