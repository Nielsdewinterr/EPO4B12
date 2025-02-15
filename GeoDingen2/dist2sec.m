function [ straighttime, turntime ] = dist2sec(straight,turn,OoF,dapprox)

x = interp1([0,0.5,1,1.5,2,2.5,3,6],dapprox,[0:0.01:6],'spline');
t = interp1([0,0.6,1.2,1.8,2.4,2.9,3.5,6],dapprox*0.75,[0:0.01:6],'spline');

% plot([0:0.01:3],x)
% hold on
% plot([0:0.01:3],t)
singledistance = x(150);

%% calculate time
%straight
if OoF==1
    straighttmp=0;
    times=0;
else
    times=fix(straight/singledistance);
    straighttmp = times*1.5;
end
tmp = abs(x-(straight-times*singledistance));
[~, straighttime]=min(tmp);
straighttime=straighttime/300;
straighttime=straighttime+straighttmp;

%turn
tmp = abs(t-turn);
[~, turntime]=min(tmp);
turntime=turntime/300;

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

