function [afstand1,afstand2,afstand3,afstand4,afstand12] =TDOA(yest1,yest2,yest3,yest4,yest5,ref1)

speedsound=340;
Fs=48000;
zerosaddenlinks = 900;
zerosaddenrechts = 900;
samplelinks = 900;
samplerechts = 900;

hhatref = ch3(ref1, ref1);
hhat1=ch3(yest1,yest1);
hhat2=ch3(yest1,yest2);
hhat3=ch3(yest1,yest3);
hhat4=ch3(yest1,yest4);
hhat5=ch3(yest1,yest5);

hhatref = [zeros(1,zerosaddenlinks) hhatref zeros(1,zerosaddenrechts)];
hhat1 = [zeros(1,zerosaddenlinks) hhat1 zeros(1,zerosaddenrechts)];
hhat2 = [zeros(1,zerosaddenlinks) hhat2 zeros(1,zerosaddenrechts)];
hhat3 = [zeros(1,zerosaddenlinks) hhat3 zeros(1,zerosaddenrechts)];
hhat4 = [zeros(1,zerosaddenlinks) hhat4 zeros(1,zerosaddenrechts)];
hhat5 = [zeros(1,zerosaddenlinks) hhat5 zeros(1,zerosaddenrechts)];

% [max1, sampref]=max(abs(hhatref));
% hhatref = hhatref(sampref-samplelinks:sampref+samplerechts);
% hhat1 = hhat1(sampref-samplelinks:sampref+samplerechts);
% hhat2 = hhat2(sampref-samplelinks:sampref+samplerechts);
% hhat3 = hhat3(sampref-samplelinks:sampref+samplerechts);
% hhat4 = hhat4(sampref-samplelinks:sampref+samplerechts);
% hhat5 = hhat5(sampref-samplelinks:sampref+samplerechts);

% ref = [zeros(1,zerosaddenlinks) ref1 zeros(1,zerosaddenrechts)];
% a1 = [zeros(1,zerosaddenlinks) yest1 zeros(1,zerosaddenrechts)];
% a2 = [zeros(1,zerosaddenlinks) yest2 zeros(1,zerosaddenrechts)];
% a3 = [zeros(1,zerosaddenlinks) yest3 zeros(1,zerosaddenrechts)];
% a4 = [zeros(1,zerosaddenlinks) yest4 zeros(1,zerosaddenrechts)];
% a5 = [zeros(1,zerosaddenlinks) yest5 zeros(1,zerosaddenrechts)];


% [max1, sampref]=max(abs(ref));
% ref = ref(sampref-samplelinks:sampref+samplerechts);
% a1 = a1(sampref-samplelinks:sampref+samplerechts);
% a2 = a2(sampref-samplelinks:sampref+samplerechts);
% a3 = a3(sampref-samplelinks:sampref+samplerechts);
% a4 = a4(sampref-samplelinks:sampref+samplerechts);
% a5 = a5(sampref-samplelinks:sampref+samplerechts);

[rA1, lagg1]=xcorr(hhatref,hhat1);
[rA2, lagg2]=xcorr(hhatref,hhat2);
[rA3, lagg3]=xcorr(hhatref,hhat3);
[rA4, lagg4]=xcorr(hhatref,hhat4);
[rA12, lagg12]=xcorr(hhat1,hhat2);

[~,I1] = max(abs(rA1));
[~,I2] = max(abs(rA2));
[~,I3] = max(abs(rA3));
[~,I4] = max(abs(rA4));
[~,I12] = max(abs(rA12));

lagDiff1 = lagg1(I1);
lagDiff2 = lagg2(I2);
lagDiff3 = lagg3(I3);
lagDiff4 = lagg4(I4);
lagDiff12 = lagg12(I12);

timeDiff1 = lagDiff1/Fs;
timeDiff2 = lagDiff2/Fs;
timeDiff3 = lagDiff3/Fs;
timeDiff4 = lagDiff4/Fs;
timeDiff12 = lagDiff12/Fs;

%afstandref = timeDiff*speedsound
afstand1 = timeDiff1*speedsound;
afstand2 = timeDiff2*speedsound;
afstand3 = timeDiff3*speedsound;
afstand4 = timeDiff4*speedsound;
afstand12 = timeDiff12*speedsound






%distanceref1 = speedsound*timeref1;
% distance12=speedsound*time12;
% distance13=speedsound*time13;
% distance14=speedsound*time14;
% distance15=speedsound*time15;
% distance23=speedsound*time23;
% distance24=speedsound*time24;
% distance25=speedsound*time25;
% distance34=speedsound*time34;
% distance35=speedsound*time35;
% distance45=speedsound*time45;





end