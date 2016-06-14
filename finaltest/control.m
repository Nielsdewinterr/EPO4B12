function [turntime,turntimetheo,orientation,lr,straighttime,straighttimetheo,OoF]=control(x,y,rot,xdest,ydest,curve)
%this function assembles the car coordinates (x,y), the destination
%coordinates(xdest,ydest) and the rotation of the car(rot - in degrees).
%Its output is either 0, which means the car must sally straight on, or a
%vector containing the time the car must turn (turntime), the orientation
%the car has after the turn (orientation), whether the car must turn left
%or right(lr) and how long the car should travel straight on. Furthermore,
%it calculates if the path is out of field(OoF)
%The variables used frequently inside this function are:

%R: radius circle
%C: center of car
%Mx,My: center of circle
%D: destination point
%T: Target point on circle
fieldx=5.70;
fieldy=5.50;
speedcirkel=0.74;%origional:0.52
speedrecht=0.79;%origional:1.19
speedback=0.79;
R=0.85;%origional:0.925
D=[xdest,ydest];
C=[x,y];

%to get Middle point of circle, first determine whether it is to the left
%or to the right of the car. lr is forwarded to the main function, -1
%meaning left, 1 meaning right. if lr is 0, the car must drive straight(forward);
% C(2)
% D(2)
if (sind(rot)==0) && (round(C(2)-D(2),1)==0)
    place=0;
else
    if (sind(rot)<0)
        place = round(-(((D(2)-C(2))/tand(rot))+(C(1)-D(1))),1);
    else
        place = round(((D(2)-C(2))/tand(rot))+(C(1)-D(1)),1);
    end
end
% place
% D(2)>C(2)
% sind(rot)<=0
if (place == 0 || isnan(place)) && (xor(D(2)>C(2),sind(rot)<0))          %straight ahead
    lr = 0;
    orientation=rot;
    turntime=0;
    OoF=0;
    straightdist = abs((sqrt((C(1)-D(1))^2+(C(2)-D(2))^2)));
    [straighttime,~]=dist2sec(straightdist,0,0,curve);
    turntimetheo = 0;
    straighttimetheo = straightdist/speedrecht;
    %plot all
    scatter(C(1),C(2))
    text(C(1)+0.15,C(2),'Car');
    hold on;
    scatter(D(1),D(2))
    text(D(1)+0.15,D(2),'Destination');
    
    xlim([-0.5 fieldx+0.5]);
    ylim([-0.5 fieldy+0.5]);
else
    if place>0
        lr=-1;
    else
        lr=1;    
    end
    if place>0          %turn right
        Mx=x+R*cosd(90+rot);
        My=y+R*sind(90+rot);
        M=[Mx,My];
    else                %turn left
        Mx=x-R*cosd(90+rot);
        My=y-R*sind(90+rot);
        M=[Mx,My];
    end
    
    %calculate length Dest-Target
    lengthDM= (sqrt((M(1)-D(1))^2+(M(2)-D(2))^2));
    %calculate rotation D
    rotMDX= asind(R/lengthDM);
    %calculate length DT
    distDT= sqrt(lengthDM^2-R^2);
    %this distance DT will also be needed to calculate how long the car has to 
    %travel straight.
    [straighttime,~]=dist2sec(distDT,0,0,curve);
    straighttimetheo = distDT/speedrecht;
    %calculate DX
    angleMD=atan2d((D(1)-M(1)),(D(2)-M(2)));
    %detect going out of field
        VectorMC=[(M(1)-C(1)),(M(2)-C(2))];
        LengthMC=norm(VectorMC,2);
        if lr==1 %turn right
            DX=[-distDT*sind(rotMDX+angleMD),-distDT*cosd(rotMDX+angleMD)];
            T = D + DX;
        else %turn left
            DX=[-distDT*sind(-rotMDX+angleMD),-distDT*cosd(-rotMDX+angleMD)];
            T = D + DX;
        end
    back=[0 0 0 0];
    stat1=(M(1)<(0+R))&&cosd(rot)<0;
    stat2=(M(1)>(fieldx-R))&&cosd(rot)>0;
    stat3=(M(2)<(0+R))&&sind(rot)<0;
    stat4=(M(2)>(fieldy-R))&&sind(rot)>0;
    if (stat1||stat2||stat3||stat4)
        if stat1==1     %circle crosses field line on the left
            back(1)=-(R-M(1))/cosd(rot);
        end
        if stat2==1     %circle crosses field line on the right
            back(2)=-(R-(fieldx-M(1)))/cosd(rot);
        end
        if stat3==1     %circle crosses bottom field line
            back(3)=-(R-M(2))/sind(rot);
        end
        if stat4==1     %circle crosses top field line
            back(4)=(R-(fieldy-M(2)))/sind(rot);
        end
        turntime=0;
        orientation=rot;
        lr=0;
        OoF=1;
        straightdist=(max(back));
        [straighttime,~]=dist2sec(straightdist,0,1,curve);
        straighttimetheo = straightdist/speedback;
        turntimetheo=0;

        %plot all
        scatter(C(1),C(2))
        text(C(1)+0.15,C(2),'Car');
        hold on;
        scatter(D(1),D(2))
        text(D(1)+0.15,D(2),'Destination');   
        
        xlim([-0.5 fieldx+0.5]);
        ylim([-0.5 fieldy+0.5]);
    else
        OoF=0;
        %Now we nearly have the points on the circle, but instead of two points we need to
        %choose the one closest to the front of the car. A bonus development may be riding
        %backward if the second value is close behind the car.
        
       
        %To calculate the angles on the circle we use the dot-product rules
        VectorMC=[(M(1)-C(1)),(M(2)-C(2))];
        LengthMC=norm(VectorMC,2);
        if lr==1 %turn right
            DX2=[-distDT*sind(rotMDX+angleMD),-distDT*cosd(rotMDX+angleMD)];
            T2 = D + DX2;
            if T2(2)>M(2)
                orientation = real(atand((D(2)-T2(2))/(D(1)-T2(1))));
            else
                orientation = real(atand((D(2)-T2(2))/(D(1)-T2(1)))+180);
            end
            AngleT2=wrapTo360(rot-orientation);
            turndist = (2*pi*AngleT2/360)*R;
            [~,turntime]=dist2sec(0,turndist,0,curve);
            turntimetheo = turndist/speedcirkel;
        else %turn left
            DX1=[-distDT*sind(-rotMDX+angleMD),-distDT*cosd(-rotMDX+angleMD)];
            T1 = D + DX1;            
            if T1(2)<M(2)
                orientation = real(atand((D(2)-T1(2))/(D(1)-T1(1))));
            else
                orientation = real(atand((D(2)-T1(2))/(D(1)-T1(1)))+180);
            end
            AngleT1=wrapTo360(360-(rot-orientation));
            turndist = (2*pi*AngleT1/360)*R;
            [~,turntime]=dist2sec(0,turndist,0,curve);
            turntimetheo = turndist/speedcirkel;
            
            xlim([-0.5 fieldx+0.5]);
            ylim([-0.5 fieldy+0.5]);
        end

        %plot circle
        ang=0:0.01:2*pi; 
        xc=R*cos(ang);
        yc=R*sin(ang);
        plot(M(1)+xc,M(2)+yc,'--');
        hold on;
        %plot current heading
        timea=-1:1:5;
        ya=(tand(rot))*(timea-C(1))+C(2);
        plot(timea,ya,':');
        hold on;
        %plot all
        scatter(C(1),C(2))
        text(C(1)+0.15,C(2),'Car');
        hold on;
        if lr==1
            scatter(T2(1),T2(2))
            text(T2(1)+0.15,T2(2),'Target2');
            hold on;
            %plot next heading
            timen=-1:1:5;
            yn=(tand(orientation))*(timen-T2(1))+T2(2);
            plot(timen,yn,':');
            hold on;
        else
            scatter(T1(1),T1(2))
            text(T1(1)+0.15,T1(2),'Target1');
            hold on;
            %plot next heading
            timen=-1:1:5;
            yn=(tand(orientation))*(timen-T1(1))+T1(2);
            plot(timen,yn,':');
            hold on;
        end
        scatter(M(1),M(2))
        text(M(1)+0.15,M(2),'Circle');
        hold on;
        scatter(D(1),D(2))
        text(D(1)+0.15,D(2),'Destination');
            
        xlim([-0.5 fieldx+0.5]);
        ylim([-0.5 fieldy+0.5]);
    end
end
