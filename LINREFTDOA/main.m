close all;
clear all;
vx=5.40; 
vy=5.70;
Connect;
pause(1);
init;
load('THEref.mat');

% prompt='Eindlocatie?';
% eind = input(prompt,'s');

while(1)
    EPOCommunications('transmit','A1');
    
    s = audio_recieve;
    EPOCommunications('transmit','A0');
    if (max(s)==0)
        break;
    end
    [r12,r13,r14,r23,r24,r34] =TDOA(s(:,1),s(:,2),s(:,3),s(:,4),ref1)
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
% text(2.27, 2.07,'A');
% text(1.00, 2.04,'B');
% text(1.45, 3.44,'C');
% text(2.55,3.14,'D');
% text(3.78, 0.70,'E');
% text(1.81, 0.56,'F');
hold on;

%save('metingen2_7-6-16', 's');

prompt='continue?  (y/n)';
con = input(prompt,'s');
if (con == 'n')
    break;
else
    EPOCommunications('transmit', 'M157');
pause(2)
EPOCommunications('transmit', 'M150');
pause(0.5)
    continue;
end
end

EPOCommunications('close');

