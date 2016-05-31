function [x,y,orientation] = testControlDrive(x,y,rot,xdest,ydest)

speedcirkel=0.74;%origional:0.52
speedrecht=0.79;%origional:1.19
R=0.9;%origional:0.925

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
        x = x + R*cosd(rot+90)+R*cosd(rot-90+((turntime*speedcirkel*360)/(2*pi)))
        y = y + R*sind(rot+90)+R*sind(rot-90+((turntime*speedcirkel*360)/(2*pi)))
    elseif lr == 1 %turn right
%         EPOCommunications('transmit', 'D200');
%         EPOCommunications('transmit', 'M157');  
        pause(turntime)
        x = x + R*cosd(rot-90)+R*cosd(rot+90-((turntime*speedcirkel*360)/(2*pi*R)))
        y = y + R*sind(rot-90)+R*sind(rot+90-((turntime*speedcirkel*360)/(2*pi*R)))
    else %no turn
    end   
%     EPOCommunications('transmit', 'D150');
%     EPOCommunications('transmit', 'M157');
    pause(1)
    %drive forward
    x = x + speedrecht*cosd(orientation);
    y = y + speedrecht*sind(orientation);
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
    x = x + R*cosd(rot+90)+R*cosd(rot-90+((turntime*speedcirkel*360)/(2*pi)));
    y = y + R*sind(rot+90)+R*sind(rot-90+((turntime*speedcirkel*360)/(2*pi)));
elseif lr == 1 %turn right
%     EPOCommunications('transmit', 'D200');
%     EPOCommunications('transmit', 'M157');  
    pause(turntime)
    x = x + R*cosd(rot-90)+R*cosd(rot+90-((turntime*speedcirkel*360)/(2*pi)));
    y = y + R*sind(rot-90)+R*sind(rot+90-((turntime*speedcirkel*360)/(2*pi)));
else %no turn
end   
% EPOCommunications('transmit', 'D150');
% EPOCommunications('transmit', 'M157');
pause(straighttime)
x = x + straighttime*speedrecht*cosd(orientation);
y = y + straighttime*speedrecht*sind(orientation);
% EPOCommunications('transmit', 'M150');