function [x,y] = Objectontwijk(x,y,rot)
fieldx = 5;
fieldy = 5;
vardist = 2;%afstand van muur bewaken
distanceobject = 1;%afstand object
if(x  > (fieldx - vardist) || x < vardist || y > (fieldy - vardist) || y < vardist) %sta ik  binnen een meter van de muur
    %zo ja, dan moet ik gewoon door
else
    [distL,distR]=EPOfunctions.status();
    [distL,distR]=[distL/100,distR/100]
    if((distL < distanceobject) && (distR < distanceobject))
        %object voor je
        Linksaf();
        xobj = x + ((distL+distR)/2)*cosd(rot);
        yobj = y + ((distL+distR)/2)*sind(rot);
        obj = [xobj,yobj];
        punt1obj = obj + [0.2*cosd(rot+90),0.2*sind(rot+90)] 
        punt2obj = obj + [0.2*cosd(rot-90),0.2*cosd(rot-90)]
        plot([punt1obj,punt2obj])
        %auto
%         x = x + afstand*cos(rot+)
%         rot = rot+45;
        
    elseif(distL < distanceobject )
        Rechtsaf(); 
        xobj = x + distL*cosd(rot)+0.3*cosd(rot+90);
        yobj = y + distL*sind(rot)+0.3*sind(rot+90);
        obj = [xobj,yobj];
        punt1obj = obj + [0.2*cosd(rot+90),0.2*sind(rot+90)] 
        punt2obj = obj + [0.2*cosd(rot-90),0.2*cosd(rot-90)]
        plot([punt1obj,punt2obj])
        %links gezien? draai rechts
    elseif(distR < distanceobject)
        Linksaf();
        xobj = x + distR*cosd(rot)+0.3*cosd(rot-90);
        yobj = y + distR*sind(rot)+0.3*sind(rot-90);
        obj = [xobj,yobj];
        punt1obj = obj + [0.2*cosd(rot+90),0.2*sind(rot+90)] 
        punt2obj = obj + [0.2*cosd(rot-90),0.2*cosd(rot-90)]
        plot([punt1obj,punt2obj])
        % object rechtsgezien, draai links
        
    end
end
end

function Linksaf()
EPOCommunications('transmit','D200');
EPOCommunications('transmit','M157');
pause(1.2)
EPOCommunications('transmit','M158');
EPOCommunications('transmit','D150');
pause(1.2)
EPOCommunications('transmit','M150');
EPOCommunications('transmit','D150');
end

function Rechtsaf()
EPOCommunications('transmit','D100');
EPOCommunications('transmit','M157');
pause(1.2)
EPOCommunications('transmit','M150');
EPOCommunications('transmit','D150');
pause(1.2)
EPOCommunications('transmit','M158');
EPOCommunications('transmit','D150');
end

