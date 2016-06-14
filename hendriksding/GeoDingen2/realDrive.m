function realDrive(x,y,rot,xdest,ydest)
forward='M158';
DirLeft='D200';
DirRight='D100';

[turntime,orientation,lr,straighttime] = control(x,y,rot,xdest,ydest)

if rem(straighttime,1)>0.3
    turns = fix(straighttime/1);
else
    turns = (fix(straighttime/1))-1;
end

for a = 1:1:turns
    %turn and drive
    if lr == -1 %turn left
        EPOCommunications('transmit', DirLeft);
        EPOCommunications('transmit', forward);
        pause(turntime)
    elseif lr == 1 %turn right
        EPOCommunications('transmit', DirRight);
        EPOCommunications('transmit', forward);  
        pause(turntime)
    else %no turn
    end   
    EPOCommunications('transmit', 'D150');
    EPOCommunications('transmit', forward);
    pause(1)
    %drive forward
    EPOCommunications('transmit', 'M150'); 
    %check again
    %here comes the TDOA TEST
    [turntime,orientation,lr,straighttime] = control(x,y,orientation,xdest,ydest)
end
%turn and drive
if lr == -1 %turn left
    EPOCommunications('transmit', DirLeft);
    EPOCommunications('transmit', forward);
    pause(turntime)
elseif lr == 1 %turn right
    EPOCommunications('transmit', DirRight);
    EPOCommunications('transmit', forward);  
    pause(turntime)
else %no turn
end   
EPOCommunications('transmit', 'D150');
EPOCommunications('transmit', forward);
pause(straighttime)
EPOCommunications('transmit', 'M135'); 
pause(0.2)
EPOCommunications('transmit', 'M150'); 
    

