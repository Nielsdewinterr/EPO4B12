function [x,y,rot] = Objectontwijk(x,y,rot)
fieldx = 5.50;
fieldy = 5.70;
vardist = 2;%afstand van muur bewaken
distanceobject = 1;%afstand object
% if(x  > (fieldx - vardist) || x < vardist || y > (fieldy - vardist) || y < vardist) %sta ik  binnen een meter van de muur
%     %zo ja, dan moet ik gewoon door
% else
    [distL,distR]=EPOfunctions.status();
    distL=distL/100;
    distR=distR/100;
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
        x = x + 1.20*cosd(rot+56);
        y = y + 1.20*sind(rot+56);
        rot = rot+10;

        
    elseif(distL < distanceobject )
        Rechtsaf(); 
        xobj = x + distL*cosd(rot)+0.3*cosd(rot+90);
        yobj = y + distL*sind(rot)+0.3*sind(rot+90);
        obj = [xobj,yobj];
        punt1obj = obj + [0.2*cosd(rot+90),0.2*sind(rot+90)] 
        punt2obj = obj + [0.2*cosd(rot-90),0.2*cosd(rot-90)]
        plot([punt1obj,punt2obj])
        %links gezien? draai rechts
        %auto
        x = x + 1.20*cosd(rot-56);
        y = y + 1.20*sind(rot-56);
        rot = rot-10;
    elseif(distR < distanceobject)
        Linksaf();
        xobj = x + distR*cosd(rot)+0.3*cosd(rot-90);
        yobj = y + distR*sind(rot)+0.3*sind(rot-90);
        obj = [xobj,yobj];
        punt1obj = obj + [0.2*cosd(rot+90),0.2*sind(rot+90)] 
        punt2obj = obj + [0.2*cosd(rot-90),0.2*cosd(rot-90)]
        plot([punt1obj,punt2obj])
        % object rechtsgezien, draai links
        %auto
        x = x + 1.20*cosd(rot+56);
        y = y + 1.20*sind(rot+56);
        rot = rot+10;
    end
end
% end

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
