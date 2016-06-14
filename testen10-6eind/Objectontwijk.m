function [x,y,rot] = Objectontwijk(x,y,rot)
distanceobject = 1;%distance object
toclose=.4;%min distance after which the car should drive back a few decimeters
    [distL,distR]=EPOfunctions.status();
    distL=distL/100;
    distR=distR/100;
%     plot(x,y,'o')
    if((distL < distanceobject) && (distR < distanceobject))
        xobj = x + ((distL+distR)/2)*cosd(rot);
        yobj = y + ((distL+distR)/2)*sind(rot);
        if ((distL+distR)/2)<toclose
           backoff(); 
           x = x + .5*cosd(rot+180);
           y = y + .5*sind(rot+180);
           hold on
           plot(x,y,'p')
        end
        Linksaf();
        hold on
        plot(xobj,yobj,'^')
%         plot([xobj,x],[yobj,y],'-.')
        punt1obj = [xobj+0.2*cosd(rot+90),yobj+0.2*sind(rot+90)] 
        punt2obj = [xobj+0.2*cosd(rot-90),yobj+0.2*sind(rot-90)]
        hold on
        plot([punt1obj(1),punt2obj(1)],[punt1obj(2),punt2obj(2)],'--')
        %car
        x = x + 1.20*cosd(rot+33);
        y = y + 1.20*sind(rot+33);
        rot = rot+45;        
    elseif(distL < distanceobject)
        xobj = x + distL*cosd(rot)+0.2*cosd(rot+90);
        yobj = y + distL*sind(rot)+0.2*sind(rot+90);
        if distL<toclose
           backoff(); 
           x = x + .5*cosd(rot+180);
           y = y + .5*sind(rot+180);
           hold on
           plot(x,y,'p')
        end
        Rechtsaf(); 
        hold on
        plot(xobj,yobj,'^')
%         plot([xobj,x],[yobj,y],'-.')
        punt1obj = [xobj+0.2*cosd(rot+90),yobj+0.2*sind(rot+90)] 
        punt2obj = [xobj+0.2*cosd(rot-90),yobj+0.2*sind(rot-90)]
        hold on
        plot([punt1obj(1),punt2obj(1)],[punt1obj(2),punt2obj(2)],'--')
        %car
        x = x + 1.20*cosd(rot-33);
        y = y + 1.20*sind(rot-33);
        rot = rot-45;
    elseif(distR < distanceobject)
        xobj = x + distR*cosd(rot)+0.2*cosd(rot-90);
        yobj = y + distR*sind(rot)+0.2*sind(rot-90);
        if distR<toclose
           backoff(); 
           x = x + .5*cosd(rot+180);
           y = y + .5*sind(rot+180);
           hold on
           plot(x,y,'p')
        end
        Linksaf();
        hold on
        plot(xobj,yobj,'^')
%         plot([xobj,x],[yobj,y],'-.')
        punt1obj = [xobj+0.2*cosd(rot+90),yobj+0.2*sind(rot+90)] 
        punt2obj = [xobj+0.2*cosd(rot-90),yobj+0.2*sind(rot-90)]
        hold on
        plot([punt1obj(1),punt2obj(1)],[punt1obj(2),punt2obj(2)],'--')
        %car
        x = x + 1.20*cosd(rot+33);
        y = y + 1.20*sind(rot+33);
        rot = rot+45;
    end
    hold on
    plot(x,y,'*c')
end

function backoff()
EPOCommunications('transmit','D150');
EPOCommunications('transmit','M143');
pause(1.2)
EPOCommunications('transmit','M158');
pause(.2)
EPOCommunications('transmit','M150');
end

function Linksaf()
EPOCommunications('transmit','D200');
EPOCommunications('transmit','M157');
pause(1.2)
EPOCommunications('transmit','M158');
EPOCommunications('transmit','D150');
pause(.6)
EPOCommunications('transmit','M143');
pause(.2)
EPOCommunications('transmit','M150');
end

function Rechtsaf()
EPOCommunications('transmit','D100');
EPOCommunications('transmit','M157');
pause(1.2)
EPOCommunications('transmit','M158');
EPOCommunications('transmit','D150');
pause(.6)
EPOCommunications('transmit','M143');
pause(.2)
EPOCommunications('transmit','M150');
end