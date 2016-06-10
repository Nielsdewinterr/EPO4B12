function [LinksRechts] = Objectontwijk[x,y,rot]
fieldx = 5;
fieldy = 5;
vardist = 1%afstand van muur bewaken
distanceobject = 0.7;%afstand object
if(x  > (fieldx - vardist) || x < vardist || y > (field - vardist) || y < vardist) %sta ik  binnen een meter van de muur
    %zo ja, dan moet ik gewoon door
else
    [distL,distR]=EPOfuncties.status();
    if(distL < distanceobject && distR < distanceobject)
        %object voor je
        Linksaf();
        LinksRechts = 0;
    elseif(distL < distanceobject )
        Rechtsaf(); 
        LinksRechts = 1;
        %links gezien? draai rechts
    elseif(distR < distanceobject)
        Linksaf();
        LinksRechts = 0;
        % object rechtsgezien, draai links
    end
end
end

function Linksaf[]
EPOCommunications('transmit','D100');
EPOCommunications('transmit','M157');
Pause(1.2)
EPOCommunications('transmit','M150');
EPOCommunications('transmit','D150');
end

function Rechtsaf[]
EPOCommunications('transmit','D200');
EPOCommunications('transmit','M157');
Pause(1.2)
EPOCommunications('transmit','M150');
EPOCommunications('transmit','D150');
end

