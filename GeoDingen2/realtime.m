%function straighttime,turntime= realtime(straighttime,turntime)

close all;
%astraight=0.88
%bstraight=0.51
vttheo=0.5;%origional:0.52
vtheo=1.03;%origional:1.19


t=[0:0.001:10];

%straight constants

a=1.03;
b=0.91;
c=log(a)/-b;

%turn constants
at=0.5;
bt=0.91;
ct=log(at)/-b;

%straight speed/distance
v=a-exp(-b*(t+c));
x=(a*t+1/b*exp(-b*(t+c)))-exp(-b*c)/b;
xtheo=t*vtheo;

%turn speed/distance
vt=at-exp(-bt*(t+ct));
xt=(at*t+1/bt*exp(-bt*(t+ct)))-exp(-bt*c)/bt;
xttheo=t*vttheo;

%integrals
Treal=((1/(-b))*exp(-b*t+c))-(1/(-b))+t;
Ttreal=((1/(-bt))*exp(-bt*(t+ct)))-(1/(-bt))+t;

%straight adjusted speed/distance
vadj=a-exp(-b*(Treal+c));
xadj=(a*t+1/b*exp(-b*(Treal+c)))-exp(-b*c)/b;


%turn adjusted speed/distance
vtadj=at-exp(-bt*(Ttreal+ct));
xtadj=(at*t+1/bt*exp(-bt*(Ttreal+ct)))-exp(-bt*c)/bt;

plot(t,v)
hold on
plot(t,vt)
hold on
plot([0 10],[vtheo vtheo])
hold on
plot([0 10],[vttheo vttheo])


figure(2)
hold on
plot(t,x)
hold on
plot(t,xt)
hold on    
plot(t,xtheo) 
hold on
plot(t,xttheo)

figure(3)
hold on
plot(t,Treal)
hold on
plot(t,Ttreal)

figure(4)
hold on
plot(t,vadj)
hold on
plot(t,vtadj)


figure(5)
hold on
plot(t,xadj)
hold on
plot(t,xtadj)
hold on    


% %  straightdist=;
%  turndist=1;
%  
%   
%  
% [mins ts]=min(abs(x-straightdist));
% straighttime=ts/1000
% 
% [mint tt]=min(abs(xt-turndist));
% turntime=tt/1000;
% 


% a=sqrt((x-xr)^2+(y+yr)^2)
% 
% y=