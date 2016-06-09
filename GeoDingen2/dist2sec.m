function [ straighttime, turntime ] = dist2sec(straight,turn,OoF,dapprox)
%astraight=0.88
%bstraight=0.51
vttheo=0.5;%origional:0.52
vtheo=1.03;%origional:1.19


x = interp1([0,0.5,1,1.5,2,2.5,3],dapprox,[0:0.01:3],'spline');
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
straighttime=straighttime/500;
straighttime=straighttime+straighttmp;

% %turn
% tmp = abs(xt-turn);
% [~, turntime]=min(tmp);
% turntime=turntime/500;

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

