close all;
clear all;
vx=5.70; 
vy=5.50;
% % % Connect
pause(0.5)
% % % init;

load('ref8.mat');
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
hold on
line([0 vx],[0 0])
line([0 vx],[vy vy])
line([0 0],[0 vy])
line([vx vx],[0 vy])
text(0,-.2,'Mic 2');
text(0,vy+.2,'Mic 1');
text(vx-.5,-.2,'Mic 3');
text(vx-.5,vy+.2,'Mic 4');

xlim([-0.5 vx+0.5]);
ylim([-0.5 vy+0.5]);
Voltage = 17.9;
curve = timedistance(Voltage);
challenge = 2; 
begin = [0,0.70,0];
tussen = [1.9,3.6];
eind = [4.6,3.95];
xlim([0 vx]);
ylim([0 vy]);
if(challenge == 2)
    [x,y,rot]=testControlDrive(begin(1),begin(2),begin(3),tussen(1),tussen(2),ref1,curve,challenge);    
    input('continue?')
    testControlDrive(x,y,rot,eind(1),eind(2),ref1,curve,challenge);
    input('eindpunt?')
else
    testControlDrive(begin(1),begin(2),begin(3),eind(1),eind(2),ref1,curve,challenge);
end

EPOCommunications('close');

