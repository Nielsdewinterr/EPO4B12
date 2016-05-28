function [turntime,orientation,lr,straighttime]=control(x,y,rot,xdest,ydest)
%this function assembles the car coordinates (x,y), the destination
%coordinates(xdest,ydest) and the rotation of the car(rot - in degrees).
%Its output is either 0, which means the car must sally straight on, or a
%vector containing the time the car must turn (turntime), the orientation
%the car has after the turn (orientation), whether the car must turn left
%or right(lr) and how long the car should travel straight on.
%The variables used inside this function are:

%R: radius circle
%C: center of car
%Mx,My: center of circle
%D: destination point
%T: Target point on circle
close all;
tic;
speed=1.2;
R=0.5;
D=[xdest,ydest];
C=[x,y];
%to get Middle point of circle, first determine whether it is to the left
%or to the right of the car. lr is forwarded to the main function, -1
%meaning left, 1 meaning right. if lr is 0, the car must drive straight(forward);
place = ((D(2)-C(2))/tand(rot))+(C(1)-D(1));
if place > 0        %turn left
    lr=-1;
    Mx=x+R*cosd(90+rot);
    My=y+R*sind(90+rot);
    M=[Mx,My];
elseif place <0     %turn right
    lr=1;
    Mx=x-R*cosd(90+rot);
    My=y-R*sind(90+rot);
    M=[Mx,My];
else                %straight ahead
    lr = 0;
    orientation=rot;
    turntime=0;
    straighttime = abs((pdist([C(1),C(2);D(1),D(2)],'euclidean'))/speed);

    %plot all
    scatter(C(1),C(2))
    text(C(1)+0.15,C(2),'Car');
    hold on;
    scatter(D(1),D(2))
    text(D(1)+0.15,D(2),'Destination');
    xlim([-1 5]);
    ylim([-1 5]);
    return;         
    %currently this stops the function, but returns 0 instead of the
    %required variables. Looks like another function must handle this zero
    %and calculate straighttime on its own.
end
%calculate length Dest-Target
lengthDM= pdist([Mx,My;xdest,ydest],'euclidean');
%calculate rotation D
rotMDX= asind(R/lengthDM);
%calculate length DT
distDT= sqrt(lengthDM^2-R^2);
%this distance DT will also be needed to calculate how long the car has to 
%travel straight.
straighttime=distDT/speed;
%calculate DX
angleMD=atan2d((D(1)-M(1)),(D(2)-M(2)));
DX1=[-distDT*sind(-rotMDX+angleMD),-distDT*cosd(-rotMDX+angleMD)];
DX2=[-distDT*sind(rotMDX+angleMD),-distDT*cosd(rotMDX+angleMD)];
T1 = D + DX1;
T2 = D + DX2;

%Now we have the points on the circle, but instead of two points we need to
%choose the one closest to the front of the car. A bonus development may be riding
%backward if the second value is close behind the car.

%To calculate the angles on the circle we use the dot-product rules
VectorMC=[(M(1)-C(1)),(M(2)-C(2))];
LengthMC=norm(VectorMC,2);
if lr==1
    VectorMT2=[(M(1)-T2(1)),(M(2)-T2(2))];
    LengthMT2=norm(VectorMT2,2);
    AngleCT2 = -acosd(dot(VectorMC,VectorMT2)/(LengthMC*LengthMT2));
    turntime = abs((2*pi*AngleCT2/180)*R/speed);
    orientation = rot+AngleCT2;
else
    VectorMT1=[(M(1)-T1(1)),(M(2)-T1(2))];
    LengthMT1=norm(VectorMT1,2);
    AngleCT1 = acosd(dot(VectorMC,VectorMT1)/(LengthMC*LengthMT1));
    turntime = abs((2*pi*AngleCT1/180)*R/speed);
    orientation = rot+AngleCT1;
end


toc;
%plot circle
ang=0:0.01:2*pi; 
xc=R*cos(ang);
yc=R*sin(ang);
plot(M(1)+xc,M(2)+yc,'--');
hold on;
%plot current heading
time=-1:1:5;
ya=(tand(rot))*(time-C(1))+C(2);
plot(time,ya,':');
hold on;
%plot all
scatter(C(1),C(2))
text(C(1)+0.15,C(2),'Car');
hold on;
if lr==-1
    scatter(T1(1),T1(2))
    text(T1(1)+0.15,T1(2),'Target1');
    hold on;
else
    scatter(T2(1),T2(2))
    text(T2(1)+0.15,T2(2),'Target2');
    hold on;
end
scatter(M(1),M(2))
text(M(1)+0.15,M(2),'Circle');
hold on;
scatter(D(1),D(2))
text(D(1)+0.15,D(2),'Destination');
xlim([-1 5]);
ylim([-1 5]);
