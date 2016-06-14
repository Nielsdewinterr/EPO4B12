% 
% prompt='Connect/Init Gedraaid/Vorige waarde opgeslagen? -> zo niet doe dat nu!!';
% input(prompt);
% result = EPOCommunications('open','//./COM62');
% EPOCommunications('transmit', 'A1');
% init;
% prompt='Start?';
% input(prompt);
% 
% while(1)
% inputbuffer =  audio_recieve;
clear all;
close all;


load('Reference_signal_3.mat');
% load('C.mat')
a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);

%[r12,r13,r14,r23,r24,r34] =TDOA(a,b,c,d,ref)
% 
r12 = TDOA3(a',b',ref1',ref2');
r13 = TDOA3(a',c',ref1',ref3');
r14 = TDOA3(a',d',ref1',ref4');
r23 = TDOA3(b',c',ref2',ref3');
r24 = TDOA3(b',d',ref2',ref4');
r34 = TDOA3(c',d',ref3',ref4');
pause(1)
[x,y] = LIN(r12,r13,r14,r23,r24,r34);


plot(y,x,'x')
hold on;
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
%end
% EPOCommunications('transmit', 'A0');
% EPOCommunications('close');

