
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: EPO-4                                                        %
% Group: B11, Out, Klein, Kruijsse, De Winter                           %
% Name File: hoofdbestand_challenges.m                                  %
% Purpose: Main-file, gets values from the field and give the start dir %
%  and rotation to the drive file. Depending on the challenge type the  %
%  object detection is activated and mid point is activated.            %
%                                                                       %
%                                                                       %
%                                                                       %
%                                                                       %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
vx=5.50; 
vy=5.70;
Connect
pause(0.5)
init;

load('THEref.mat');
% prompt='Challenge?';
% challenge = input(prompt,'s');
% challenge = str2num(challenge);
% 
% prompt='Beginloacatie, xyrot?';
% begin = input(prompt,'s');
% a=strsplit(begin,',');
% clear begin;
% for i=1:3
%     begin(i)=str2double(a(i));
% end
% 
% if(challenge>1)
%     prompt='Tussenstop locatie?, x,y?';
%     tussen = input(prompt,'s');
%     a=strsplit(tussen,',');
%     clear tussen;
%     for i=1:2
%         tussen(i)=str2double(a(i))
%     end
% end
% 
% prompt='Eindlocatie, xy?';
% eind = input(prompt,'s');
% b=strsplit(eind,',');
% clear eind;
% for i=1:2
%     eind(i)=str2double(b(i)) 
% end
Voltage = 17.6;
curve = timedistance(Voltage);
challenge =2;
begin = [1,1,-90];
tussen = [2.76,4.7];
eind = [4.5,1];
if(challenge >1)
    [x,y,rot]=testControlDrive(begin(1),begin(2),begin(3),tussen(1),tussen(2),ref1,curve,challenge);    
    input('continue?')
    testControlDrive(x,y,rot,eind(1),eind(2),ref1,curve,challenge);
else
    testControlDrive(begin(1),begin(2),begin(3),eind(1),eind(2),ref1,curve,challenge);
end
EPOCommunications('close');

