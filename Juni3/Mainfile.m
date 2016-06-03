
prompt='Connect/Init Gedraaid/Vorige waarde opgeslagen? -> zo niet doe dat nu!!';
input(prompt);
clear all;
prompt='Start?';
input(prompt);



[r12,r13,r14,r23,r24,r34] = TDOA();

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

