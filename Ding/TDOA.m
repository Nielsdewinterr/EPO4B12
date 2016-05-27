function [distance12,distance13,distance14,distance15,distance23,distance24,distance25,distance34,distance35,distance45]=TDOA(yest1,yest2,yest3,yest4,yest5,ref1)
speedsound=340;
Fs_RX=48000;
zerosaddenlinks = 1000;
zerosaddenrechts = 1000;
samplelinks = 800;
samplerechts = 800;

hhat1=ch3(ref1,yest1);
hhat2=ch3(ref1,yest2);
hhat3=ch3(ref1,yest3);
hhat4=ch3(ref1,yest4);
hhat5=ch3(ref1,yest5);

hhat1 = [zeros(1,zerosaddenlinks) hhat1 zeros(1,zerosaddenrechts)];
hhat2 = [zeros(1,zerosaddenlinks) hhat2 zeros(1,zerosaddenrechts)];
hhat3 = [zeros(1,zerosaddenlinks) hhat3 zeros(1,zerosaddenrechts)];
hhat4 = [zeros(1,zerosaddenlinks) hhat4 zeros(1,zerosaddenrechts)];
hhat5 = [zeros(1,zerosaddenlinks) hhat5 zeros(1,zerosaddenrechts)];



[max1, samp1]=max(hhat1);
hhat1 = hhat1(samp1-samplelinks:samp1+samplerechts);
hhat2 = hhat2(samp1-samplelinks:samp1+samplerechts);
hhat3 = hhat3(samp1-samplelinks:samp1+samplerechts);
hhat4 = hhat4(samp1-samplelinks:samp1+samplerechts);
hhat5 = hhat5(samp1-samplelinks:samp1+samplerechts);

[max1, samp1]=max(abs(hhat1));
[max2, samp2]=max(abs(hhat2));
[max3, samp3]=max(abs(hhat3));
[max4, samp4]=max(abs(hhat4));
[max5, samp5]=max(abs(hhat5));
% plot(hhat1)
% hold on;
% plot(hhat2)
% hold on;
% plot(hhat3)
% hold on;
% plot(hhat4)
% hold on;

sampdelta12=samp1-samp2;   %12
sampdelta13=samp1-samp3;   %13
sampdelta14=samp1-samp4;   %14
sampdelta15=samp1-samp5;   %15
sampdelta23=samp2-samp3;   %23
sampdelta24=samp2-samp4;   %24
sampdelta25=samp2-samp5;   %25
sampdelta34=samp3-samp4;   %34
sampdelta35=samp3-samp5;   %35
sampdelta45=samp4-samp5;   %45


time12=sampdelta12/Fs_RX;
time13=sampdelta13/Fs_RX;
time14=sampdelta14/Fs_RX;
time15=sampdelta15/Fs_RX;
time23=sampdelta23/Fs_RX;
time24=sampdelta24/Fs_RX;
time25=sampdelta25/Fs_RX;
time34=sampdelta34/Fs_RX;
time35=sampdelta35/Fs_RX;
time45=sampdelta45/Fs_RX;

distance12=speedsound*time12;
distance13=speedsound*time13;
distance14=speedsound*time14;
distance15=speedsound*time15;
distance23=speedsound*time23;
distance24=speedsound*time24;
distance25=speedsound*time25;
distance34=speedsound*time34;
distance35=speedsound*time35;
distance45=speedsound*time45;
end

