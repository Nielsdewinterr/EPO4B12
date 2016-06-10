function dapprox = timedistance(V)

%%metingen straight
tmeting16=[0,0.5,1,1.5,2,2.5,3,5];
dmeting16=[0,0.15,.3,.59,.90,1.24,1.63,5.35];

tmeting179=[0,.5,1,1.5,2,2.5,3,5];
dmeting179=[0,.3,.52,.91,1.39,2.03,2.66,5.35];

tmeting189=[0,.5,1,1.5,2,2.5,3,5];
dmeting189=[0,.35,.55,1.01,1.69,2.5,3.4,5.35];

% plot(t,v)
% hold on
% plot(t,vt)

%% metingen turn
ttmeting175=[0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.3];
dtmeting175=[0 10 30 52 90 125 160 205 220 245 285 315 335 360]*2*pi/360;

dtmeting18=[0 5 30 60 92 115 150 192 227 247 285 307 342 360]*2*pi/360;

for i=1:8;
    D=interp1([16,17.9,18.9],[dmeting16(i),dmeting179(i),dmeting189(i)],[16:0.05:19],'spline');
%     plot([16:0.05:19],D)
%     hold on;
    dapprox(1,i)=D(round((V-16)*20));
end

for i=1:8;
    D=interp1([17.5,18],[dtmeting175(i),dtmeting18(i)],[16:0.05:19],'spline');
%     plot([16:0.05:19],D)
%     hold on;
    dapprox(2,i)=D(round((V-16)*20));
end
% % figure(2)
% % hold on
% % % plot(t,x)
% % % hold on
% % % plot(t,xt)
% % % hold on
% % scatter(tmeting16,dmeting16,'g')
% % hold on
% % scatter(tmeting179,dmeting179,'g')
% % hold on
% % scatter(tmeting189,dmeting189,'g')
% % hold on
% % plot([0:0.01:6],interp1(tmeting16,dmeting16,[0:0.01:6],'spline'),'g')
% % hold on
% % plot([0:0.01:6],interp1(tmeting179,dmeting179,[0:0.01:6],'spline'),'g')
% % hold on
% % plot([0:0.01:6],interp1(tmeting189,dmeting189,[0:0.01:6],'spline'),'g')
% % hold on
% % plot([0:0.01:6],interp1(tmeting189,dapprox,[0:0.01:6],'spline'),'red')
