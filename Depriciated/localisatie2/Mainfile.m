clear all;
close all;
prompt='Start';
input(prompt);
EPOCommunications('close');
result = EPOCommunications('open','\\.\COM3');
EPOCommunications('transmit','D180');
init;

prompt='Next';
input(prompt);
inputbuffer =  audio_recieve;
a=inputbuffer(:,1);
b=inputbuffer(:,2);
c=inputbuffer(:,3);
d=inputbuffer(:,4);
e=inputbuffer(:,5);
ref1 = a; %deze moet naar de volgende voor de nieuwe meting
