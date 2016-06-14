function dapprox = timedistance(V)

%%metingen
tmeting16=[0,0.5,1,1.5,2,2.5,3,6];
dmeting16=[0,0.08,.3,.59,.90,1.24,1.63,9];

tmeting179=[0,.5,1,1.5,2,2.5,3,6];
dmeting179=[0,.2,.52,.91,1.39,2.03,2.66,12];

tmeting189=[0,.5,1,1.5,2,2.5,3,6];
dmeting189=[0,.23,.55,1.01,1.69,2.5,3.4,13];

% plot(t,v)
% hold on
% plot(t,vt)
for i=1:8;
    D=interp1([16,17.9,18.9],[dmeting16(i),dmeting179(i),dmeting189(i)],[16:0.05:19],'spline');
%     plot([16:0.05:19],D)
%     hold on;
    dapprox(i)=D(round((V-16)*20));
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
