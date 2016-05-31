function [x,y,orientation] = testControlDrive(x,y,rot,xdest,ydest)
speed=1.2;
R=0.5;

[turntime,orientation,lr,straighttime] = control(x,y,rot,xdest,ydest)

if rem(straighttime,1)>0.3
    turns = fix(straighttime/1);
else
    turns = (fix(straighttime/1))-1;
end

for a = 1:1:turns
    %turn and drive
    if lr == -1 %turn left
%         EPOCommunications('transmit', 'D100');
%         EPOCommunications('transmit', 'M157');
        pause(turntime)
        x = x + R*cosd(rot+90)+R*cosd(rot-90+((turntime*speed*360)/(2*pi)));
        y = y + R*sind(rot+90)+R*sind(rot-90+((turntime*speed*360)/(2*pi)));
    elseif lr == 1 %turn right
%         EPOCommunications('transmit', 'D200');
%         EPOCommunications('transmit', 'M157');  
        pause(turntime)
        x = x + R*cosd(rot-90)+R*cosd(rot+90-((turntime*speed*360)/(2*pi)));
        y = y + R*sind(rot-90)+R*sind(rot+90-((turntime*speed*360)/(2*pi)));
    else %no turn
    end   
%     EPOCommunications('transmit', 'D150');
%     EPOCommunications('transmit', 'M157');
    pause(1)
    %drive forward
    x = x + speed*cosd(orientation);
    y = y + speed*sind(orientation);
%     EPOCommunications('transmit', 'M150'); 
    %check again
    %here comes the TDOA TEST
    input('continue?')
    [turntime,orientation,lr,straighttime] = control(x,y,orientation,xdest,ydest)
end
%turn and drive
if lr == -1 %turn left
%     EPOCommunications('transmit', 'D100');
%     EPOCommunications('transmit', 'M157');
    pause(turntime)
    x = x + R*cosd(rot+90)+R*cosd(rot-90+((turntime*speed*360)/(2*pi)));
    y = y + R*sind(rot+90)+R*sind(rot-90+((turntime*speed*360)/(2*pi)));
elseif lr == 1 %turn right
%     EPOCommunications('transmit', 'D200');
%     EPOCommunications('transmit', 'M157');  
    pause(turntime)
    x = x + R*cosd(rot-90)+R*cosd(rot+90-((turntime*speed*360)/(2*pi)));
    y = y + R*sind(rot-90)+R*sind(rot+90-((turntime*speed*360)/(2*pi)));
else %no turn
end   
% EPOCommunications('transmit', 'D150');
% EPOCommunications('transmit', 'M157');
pause(straighttime)
x = x + straighttime*speed*cosd(orientation);
y = y + straighttime*speed*sind(orientation);
% EPOCommunications('transmit', 'M150');