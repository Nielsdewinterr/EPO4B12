clear all;
close all;
prompt='Connect gedraaid? -> zo niet nu doen!';
input(prompt);
init;

prompt='Start meting audio -> verander zo de waarde van ref1 naar ref .. en naar b';
input(prompt);
inputbuffer =  audio_recieve;
a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);
ref1 = a; %deze moet naar de volgende voor de nieuwe meting
