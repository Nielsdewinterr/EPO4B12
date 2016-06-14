function [r12] =TDOA2(yest1,yest2,ref1,ref2)

speedsound=340.29;
Fs=48000;
delta=866;
tresh=0.8; %treshold for reflections

[~,I1]=max(abs(yest1))
[~,I2]=max(abs(yest2))
samp=I1-I2;
time=samp/Fs;
r12=time*speedsound;

% 
% yest1=[zeros(1000,1);yest1;zeros(1000,1)];
% yest2=[zeros(1000,1);yest2;zeros(1000,1)];
% 
% yest1=yest1/max(yest1);
% yest2=yest2/max(yest2);
% 
% zero=length(yest1)-length(ref1);
% ref1=[ref1;zeros(zero,1)];
% zero=length(yest2)-length(ref2);
% ref2=[ref2;zeros(zero,1)];
% 
% 
% % hhat1=filter(flipud(ref1),1,yest1);
% % hhat2=filter(flipud(ref1),1,yest2);
% % hhat3=filter(flipud(ref1),1,yest3);
% % hhat4=filter(flipud(ref1),1,yest4);
% 
% 
% [tau1 hhat1 lag1] = gccphat(yest1,yest2);
% [tau2 hhat2 lag2] = gccphat(yest2,ref2);
% %lag=lag1-lag2;
% % plot(tau1)
% % figure
% % plot(hhat1)
% % figure
% % plot(lag1)
% hhat1 = conv(hhat1,ref1);
% hhat2 = conv(hhat2,ref2);
% % hhat1=abs(hhat1);
% % hhat2=abs(hhat2);
% 
% 
% [max1 sampp]=max(hhat1);
% 
% hhat1(1:sampp-delta)=0;
% hhat1(sampp+delta:end)=0;
% hhat2(1:sampp-delta)=0;
% hhat2(sampp+delta:end)=0;
% 
% % subplot(411)
% % plot(hhat1)
% % subplot(412)
% % plot(hhat2)
% % subplot(413)
% % plot(hhat3)
% % subplot(414)
% % plot(hhat4)
% % figure
% % plot(hhat1)
% % figure
% % plot(hhat2)
% 
% 
% [max1 samp1]=max(hhat1);
% [max2 samp2]=max(hhat2);
% 
% samp1
% hhat= [hhat1,hhat2];
% maxs= [max1,max2] ;
% samp= [samp1,samp2];
% 
% 
% for(k=1:2)
%       
%     hhat(1:samp(k)-500,k)=0;
%     hhat(samp(k)-100:end,k)=0;
%     
%     [max2(k) samp2(k)]=max(hhat(:,k));
%     
%    if (max2(k)>tresh*maxs(k));
%     maxs(k)=max2(k);
%     samp(k)=samp2(k);
%     
%    end
% end
% 
%      
%     
% 
% time12=(samp(1)-samp(2))/Fs;
% 
% %time12=(lag1-lag2)/Fs;
% r12=speedsound*time12;
% 
% [tau R lag] = gccphat([yest1,yest2],ref1,Fs);
% % plot(lag,real(R(:,1)));
% % hold on
% % plot(lag,real(R(:,2)));
% 
% [~,samp1]=max(abs(R(:,1)));
% samp1
% %samp1=lag(samp1)
% [~,samp2]=(max(abs(R(:,2))));
% samp2
% %samp2=lag(samp2)
% time=(samp1-samp2)/Fs
% 
% r12=speedsound*time;
% 
% % subplot(411)
% % plot(hhat1)
% % subplot(412)
% % plot(hhat2)
% % subplot(413)
% % plot(hhat3)
% % subplot(414)
% % plot(hhat4)
% 
% 
% % subplot(411)
% % plot(hhat1(sampp-500:sampp+500))
% % subplot(412)
% % plot(hhat2(sampp-500:sampp+500))
% % subplot(413)
% % plot(hhat3(sampp-500:sampp+500))
% % subplot(414)
% % plot(hhat4(sampp-500:sampp+500))
% 
end