function [x,y,orientation] = testControlDrive(x,y,rot,xdest,ydest,ref)
clf;
speedcirkel=0.74;%origional:0.52
speedrecht=0.79;%origional:1.19
timetheorecht=0.7/speedrecht;
speedback=0.79;
R=0.9;%origional:0.925

[turntime,turntimetheo,orientation,lr,straighttime,straighttimetheo,OoF] = control(x,y,rot,xdest,ydest);
    tdoatest(x,y,ref);

if OoF==1
            EPOCommunications('transmit', 'D150');
            EPOCommunications('transmit', 'M143');
    pause(straighttime)
    x = x - straighttimetheo*speedback*cosd(orientation);
    y = y - straighttimetheo*speedback*sind(orientation);
            EPOCommunications('transmit', 'M157');
            pause(0.3)
            EPOCommunications('transmit', 'M150');
    [x,y]=tdoatest(x,y,ref)
    input('continue?')
    [turntime,turntimetheo,orientation,lr,straighttime,straighttimetheo,OoF] = control(x,y,rot,xdest,ydest);
end

if rem(straighttime,1.5)>0.3
    turns = fix(straighttime/1.5);
else
    turns = (fix(straighttime/1.5))-1.5;
end

    for a = 1:1:turns
        %turn and drive
        if lr == -1 %turn left
            EPOCommunications('transmit', 'D200');
            EPOCommunications('transmit', 'M157');
            pause(turntime)
            x = x + R*cosd(rot+90)+R*cosd(rot-90+((turntimetheo*speedcirkel*360)/(2*pi*R)));
            y = y + R*sind(rot+90)+R*sind(rot-90+((turntimetheo*speedcirkel*360)/(2*pi*R)));
        elseif lr == 1 %turn right
            EPOCommunications('transmit', 'D100');
            EPOCommunications('transmit', 'M157');  
            pause(turntime)
            x = x + R*cosd(rot-90)+R*cosd(rot+90-((turntimetheo*speedcirkel*360)/(2*pi*R)));
            y = y + R*sind(rot-90)+R*sind(rot+90-((turntimetheo*speedcirkel*360)/(2*pi*R)));
        else %no turn
        end  
            EPOCommunications('transmit', 'M143');
            pause(0.3)
            EPOCommunications('transmit', 'M150');
        [x,y]=tdoatest(x,y,ref);
        xrota=x;
        yrota=y;

        EPOCommunications('transmit', 'D150');
        EPOCommunications('transmit', 'M157');
        pause(1.5)
        %drive forward
        x = x + timetheorecht*speedrecht*cosd(orientation)
        y = y + timetheorecht*speedrecht*sind(orientation)     
            EPOCommunications('transmit', 'M143');
            pause(0.3)
            EPOCommunications('transmit', 'M150');
        [x,y,orientation]=tdoatest2(x,y,orientation,xrota,yrota,ref);

        rot=orientation;
        [turntime,turntimetheo,orientation,lr,straighttime,straighttimetheo,OoF] = control(x,y,rot,xdest,ydest);
    end

%turn and drive
if lr == -1 %turn left
        EPOCommunications('transmit', 'D200');
        EPOCommunications('transmit', 'M157');
    pause(turntime)
    x = x + R*cosd(rot+90)+R*cosd(rot-90+((turntimetheo*speedcirkel*360)/(2*pi*R)));
    y = y + R*sind(rot+90)+R*sind(rot-90+((turntimetheo*speedcirkel*360)/(2*pi*R)));
elseif lr == 1 %turn right
        EPOCommunications('transmit', 'D100');
        EPOCommunications('transmit', 'M157');  
    pause(turntime)
    x = x + R*cosd(rot-90)+R*cosd(rot-90-((turntimetheo*speedcirkel*360)/(2*pi*R)));
    y = y + R*sind(rot-90)+R*sind(rot-90-((turntimetheo*speedcirkel*360)/(2*pi*R)));
else %no turn
end
            EPOCommunications('transmit', 'M143');
            pause(0.3)
            EPOCommunications('transmit', 'M150');
        [x,y]=tdoatest(x,y,ref)
        EPOCommunications('transmit', 'D150');
        EPOCommunications('transmit', 'M157');
pause(straighttime)
x = x + straighttimetheo*speedrecht*cosd(orientation);
y = y + straighttimetheo*speedrecht*sind(orientation);
        EPOCommunications('transmit', 'M143');
        pause(0.3)
        EPOCommunications('transmit', 'M150');
        [x,y,orientation]=tdoatest2(x,y,orientation,xrota,yrota,ref);

function [x,y]=tdoatest(x,y,ref)
%     xtdoa = x%+((rand-0.5)/4);
%     ytdoa = y%+((rand-0.5)/4);
          EPOCommunications('transmit','A1');
          inputbuffer=audio_recieve();
          EPOCommunications('transmit','A0');
        [r12,r13,r14,r23,r24,r34] = TDOA(inputbuffer(:,1),inputbuffer(:,2),inputbuffer(:,3),inputbuffer(:,4),ref);
        [xtdoa,ytdoa] = linnie(r12,r14,r23,r34);
    if not(isnan(xtdoa)||isnan(ytdoa))
        plot(x,y,'c*')
        plot(xtdoa,ytdoa,'x')
        if sqrt((x-xtdoa)^2+(y-ytdoa)^2)<0.7
            x=xtdoa;
            y=ytdoa;
        end
    end
    
function [x,y,orientation]=tdoatest2(x,y,orientation, xrota,yrota,ref)
%     xtdoa = x%+((rand-0.5)/4);
%     ytdoa = y%+((rand-0.5)/4);
          EPOCommunications('transmit','A1');
          inputbuffer=audio_recieve();
          EPOCommunications('transmit','A0')
        [r12,r13,r14,r23,r24,r34] = TDOA(inputbuffer(:,1),inputbuffer(:,2),inputbuffer(:,3),inputbuffer(:,4),ref);
        [xtdoa,ytdoa] = linnie(r12,r14,r23,r34)
        
    if not(isnan(xtdoa)||isnan(ytdoa))
        plot(x,y,'c*')
        plot(xtdoa,ytdoa,'x')
        if sqrt((x-xtdoa)^2+(y-ytdoa)^2)<0.7
            x=xtdoa;
            y=ytdoa;
        end
        xrotb=x;
        yrotb=y;
        if sqrt((xrota-xrotb)^2+(yrota-yrotb)^2)>0.3
            if xrota<xrotb
            orientation = real(atand((yrota-yrotb)/(xrota-xrotb)))
            else
            orientation = real(atand((yrota-yrotb)/(xrota-xrotb))+180)
            end
        end
    end

