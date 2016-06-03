function [r12,r13,r14,r23,r24,r34] =TDOA()
inputbuffer =  audio_recieve;

yest1=inputbuffer(:,1);
yest2=inputbuffer(:,2);
yest3=inputbuffer(:,3);
yest4=inputbuffer(:,4);
yest5=inputbuffer(:,5);

speedsound=340.29;
Fs=48000;
delta=500;
tresh=0.8; %treshold for reflections

yest1=[zeros(1000,1);yest1;zeros(1000,1)];
yest2=[zeros(1000,1);yest2;zeros(1000,1)];
yest3=[zeros(1000,1);yest3;zeros(1000,1)];
yest4=[zeros(1000,1);yest4;zeros(1000,1)];


yest1=yest1/max(yest1);
yest2=yest2/max(yest2);
yest3=yest3/max(yest3);
yest4=yest4/max(yest4);

zero=length(yest1)-length(ref1);
ref1=[ref1;zeros(zero,1)];


% hhat1=filter(flipud(ref1),1,yest1);
% hhat2=filter(flipud(ref1),1,yest2);
% hhat3=filter(flipud(ref1),1,yest3);
% hhat4=filter(flipud(ref1),1,yest4);


[tau1 hhat1 lag1]= gccphat(yest1,ref1);
[tau2 hhat2 lag2] = gccphat(yest2,ref1);
[tau3 hhat3 lag3] = gccphat(yest3,ref1);
[tau4 hhat4 lag4] = gccphat(yest4,ref1);

hhat1=real(hhat1);
hhat2=real(hhat2);
hhat3=real(hhat3);
hhat4=real(hhat4);

[max1 sampp]=max(hhat1);

hhat1(1:sampp-delta)=0;
hhat1(sampp+delta:end)=0;
hhat2(1:sampp-delta)=0;
hhat2(sampp+delta:end)=0;
hhat3(1:sampp-delta)=0;
hhat3(sampp+delta:end)=0;
hhat4(1:sampp-delta)=0;
hhat4(sampp+delta:end)=0;

% subplot(411)
% plot(hhat1)
% subplot(412)
% plot(hhat2)
% subplot(413)
% plot(hhat3)
% subplot(414)
% plot(hhat4)

[max1 samp1]=max(hhat1);
[max2 samp2]=max(hhat2);
[max3 samp3]=max(hhat3);
[max4 samp4]=max(hhat4);

hhat= [hhat1,hhat2,hhat3,hhat4];
maxs= [max1,max2,max3,max4] ;
samp= [samp1,samp2,samp3,samp4];


for(k=1:4)
      
    hhat(1:samp(k)-500,k)=0;
    hhat(samp(k)-100:end,k)=0;
    
    [max2(k) samp2(k)]=max(hhat(:,k));
    
   if (max2(k)>tresh*maxs(k));
    maxs(k)=max2(k);
    samp(k)=samp2(k);
    
   end
end

     
    

time12=(samp(1)-samp(2))/Fs;
time13=(samp(1)-samp(3))/Fs;
time14=(samp(1)-samp(4))/Fs;
time23=(samp(2)-samp(3))/Fs;
time24=(samp(2)-samp(4))/Fs;
time34=(samp(3)-samp(4))/Fs;


r12=speedsound*time12;
r13=speedsound*time13;
r14=speedsound*time14;
r23=speedsound*time23;
r24=speedsound*time24;
r34=speedsound*time34;


% subplot(411)
% plot(hhat1)
% subplot(412)
% plot(hhat2)
% subplot(413)
% plot(hhat3)
% subplot(414)
% plot(hhat4)


% subplot(411)
% plot(hhat1(sampp-500:sampp+500))
% subplot(412)
% plot(hhat2(sampp-500:sampp+500))
% subplot(413)
% plot(hhat3(sampp-500:sampp+500))
% subplot(414)
% plot(hhat4(sampp-500:sampp+500))

end