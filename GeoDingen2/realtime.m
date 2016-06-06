function [straighttime,turntime]= realtime(straighttime,turntime)

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
vf=@(t) a-exp(-b*(t+c));
v=a-exp(-b*(t+c));
x=(a*t+1/b*exp(-b*(t+c)))-exp(-b*c)/b;

%turn speed/distance
vt=at-exp(-bt*(t+ct));
xt=(at*t+1/bt*exp(-bt*(t+ct)))-exp(-bt*ct)/bt;
xttheo=t*vttheo;

%% straight
TimeToAdd = (straighttime*vtheo)-integral(vf,0,straighttime)
newStraighttime= straighttime + TimeToAdd
%check
integral(vf,0,newStraighttime)
straighttime*vtheo

% %% turn
% TimeToAdd = (straighttime*vtheo)-integral(vf,0,straighttime)
% newStraighttime= straighttime + TimeToAdd;
% %check
% (a*newStraighttime+1/b*exp(-b*(newStraighttime+c)))-exp(-b*c)/b
% straighttime*vtheo

plot(t,v)
hold on
% plot(t,vt)
% hold on
plot([0 10],[vtheo vtheo])
% hold on
% plot([0 10],[vttheo vttheo])


figure(2)
hold on
plot(t,x)
% hold on
% plot(t,xt)
hold on    
plot(t,vtheo*t) 
% hold on
% plot(t,vttheo*t)