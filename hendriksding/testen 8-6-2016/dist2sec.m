function [ straighttime, turntime ] = dist2sec(straight,turn,OoF)
%astraight=0.88
%bstraight=0.51
vttheo=0.5;%origional:0.52
vtheo=1.03;%origional:1.19

t=[0:0.002:10];

%straight constants
a=1.03;
b=0.91;
c=log(a)/-b;
% a=1.38;
% b=0.82;
% c=log(a)/-b;

%turn constants
at=0.5;
bt=0.91;
ct=log(at)/-b;

%straight speed/distance
v=a-exp(-b*(t+c));
x=(a*t+1/b*exp(-b*(t+c)))-exp(-b*c)/b;

%turn speed/distance
vt=at-exp(-bt*(t+ct));
xt=(at*t+1/bt*exp(-bt*(t+ct)))-exp(-bt*ct)/bt;

%% calculate time
%straight
if OoF==1
    straighttmp=0;
    times=0;
else
    times=fix(straight/0.7);
    straighttmp = times*1.5;
end
tmp = abs(x-(straight-times*0.7));
[~, straighttime]=min(tmp);
straighttime=straighttime/500;
straighttime=straighttime+straighttmp;

%turn
tmp = abs(xt-turn);
[~, turntime]=min(tmp);
turntime=turntime/1000;

%% plot
% plot(t,v)
% hold on
% plot(t,vt)
% hold on
% plot([0 10],[vtheo vtheo])
% hold on
% plot([0 10],[vttheo vttheo])
% 
% 
% figure(2)
% hold on
% plot(t,x)
% hold on
% plot(t,xt)
% hold on    
% plot(t,vtheo*t) 
% hold on
% plot(t,vttheo*t)

end

