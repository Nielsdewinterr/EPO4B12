
%TDOA



clear all;
close all;

speed_o_sound=340.29;


Fs_RX=68000;
Fs_TX=Fs_RX;

nchan=2;
Nbits=32;
Timer0=2;
Timer1=1;
Timer3=6;
code='f2340f0faaaa4800';
xref=refsignal(Nbits,Timer0,Timer1,Timer3,code,Fs_TX);
xref=[xref;xref;xref];

tic
xObj = audioplayer(xref,Fs_TX);
recObj=audiorecorder(Fs_RX,16,2,1);
play(xObj);
recordblocking(recObj,0.5);
y = getaudiodata(recObj);


%splitting the dual channel recording
yest1=y(:,1);
yest2=y(:,2);
% yest3=y(:,3);
% yest4=y(:,4);
% yest5=y(:,5);


yest1=yest1';
yest2=yest2';
% yest3=yest3';
% yest4=yest4';
% yest5=yest5';


xref=xref';


%choose clean signal
cleansig=xref
%cleansig=refsig;

%yest2 is used as a clean reference signal
hhat1=ch3(cleansig,yest1);
hhat2=ch3(cleansig,yest2);
% hhat3=ch3(cleansig,yest3);
% hhat4=ch3(cleansig,yest4);
% hhat5=ch3(cleansig,yest5);

%distance calculation
[max1 samp1]=max(hhat1);
[max2 samp2]=max(hhat2);
% [max3 samp3]=max(hhat3);
% [max4 samp4]=max(hhat4);
% [max5 samp5]=max(hhat5);

sampdelta12=samp1-samp2;   %12
% sampdelta13=samp1-samp3;   %13
% sampdelta14=samp1-samp4;   %14
% sampdelta15=samp1-samp5;   %15
% sampdelta23=samp2-samp3;   %23
% sampdelta24=samp2-samp4;   %24
% sampdelta25=samp2-samp5;   %25
% sampdelta34=samp3-samp4;   %34
% sampdelta35=samp3-samp5;   %35
% sampdelta45=samp4-samp5;   %45


time12=sampdelta12/Fs_RX;
% time13=sampdelta13/Fs_RX;
% time14=sampdelta14/Fs_RX;
% time15=sampdelta15/Fs_RX;
% time23=sampdelta23/Fs_RX;
% time24=sampdelta24/Fs_RX;
% time25=sampdelta25/Fs_RX;
% time34=sampdelta34/Fs_RX;
% time35=sampdelta35/Fs_RX;
% time45=sampdelta45/Fs_RX;



distance12=((speed_o_sound*time12)*100)+(2*sign(sampdelta12))
% distance13=((speed_o_sound*time13)*100)+(2*sign(sampdelta13))
% distance14=((speed_o_sound*time14)*100)+(2*sign(sampdelta14))
% distance15=((speed_o_sound*time15)*100)+(2*sign(sampdelta15))
% distance23=((speed_o_sound*time23)*100)+(2*sign(sampdelta23))
% distance24=((speed_o_sound*time24)*100)+(2*sign(sampdelta24))
% distance25=((speed_o_sound*time25)*100)+(2*sign(sampdelta25))
% distance34=((speed_o_sound*time34)*100)+(2*sign(sampdelta34))
% distance35=((speed_o_sound*time35)*100)+(2*sign(sampdelta35))
% distance45=((speed_o_sound*time45)*100)+(2*sign(sampdelta45))
toc

%plots
%L=length(yest1);
%Lh=length(hhat1);
%t=[0:1/Fs_RX:(L-1)/Fs_RX];
%th=[0:1/Fs_RX:(Lh-1)/Fs_RX];

% subplot(411)
% plot(t,yest2)
% title('Microphone 1 Reference signal (distance=1cm)')
% xlabel('time[s]')
% 
% subplot(412)
% plot(t,yest1)
% title('Microphone 2 recording (distance=variable)')
% xlabel('time[s]')
% 
% 
% subplot(211)
% plot(th,hhat2)
%title('Estimated channel response of the reference signal')
%xlabel('time[s]')
% 
% 
 %subplot(212)
%plot(th,hhat1)
 %title('Estimated channel response of the variable distance microphone')
% xlabel('time[s]')
 %only zoom horizontally
 %h = zoom;
 %set(h,'Motion','horizontal','Enable','on');
