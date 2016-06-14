function afstand = poging2(s1, s2, s3, s4, s5, ref)

speedsound=340;
Fs=48000;
zerosaddenlinks = 900;
zerosaddenrechts = 900;
samplelinks = 900;
samplerechts = 900;

hhatref = ch3(ref,ref);
hhat1 = ch3(ref,s1);
hhat2 = ch3(ref,s2);
hhat3 = ch3(ref,s3);
hhat4 = ch3(ref,s4);
hhat5 = ch3(ref,s5);

hhatref = [zeros(1,zerosaddenlinks) hhatref zeros(1,zerosaddenrechts)];
hhat1 = [zeros(1,zerosaddenlinks) hhat1 zeros(1,zerosaddenrechts)];
hhat2 = [zeros(1,zerosaddenlinks) hhat2 zeros(1,zerosaddenrechts)];
hhat3 = [zeros(1,zerosaddenlinks) hhat3 zeros(1,zerosaddenrechts)];
hhat4 = [zeros(1,zerosaddenlinks) hhat4 zeros(1,zerosaddenrechts)];
hhat5 = [zeros(1,zerosaddenlinks) hhat5 zeros(1,zerosaddenrechts)];

[max1, sampref]=max(abs(hhatref));
hhatref = hhatref(sampref-samplelinks:sampref+samplerechts);
hhat1 = hhat1(sampref-samplelinks:sampref+samplerechts);
hhat2 = hhat2(sampref-samplelinks:sampref+samplerechts);
hhat3 = hhat3(sampref-samplelinks:sampref+samplerechts);
hhat4 = hhat4(sampref-samplelinks:sampref+samplerechts);
hhat5 = hhat5(sampref-samplelinks:sampref+samplerechts);

ref = [zeros(1,zerosaddenlinks) ref zeros(1,zerosaddenrechts)];
s1 = [zeros(1,zerosaddenlinks) s1 zeros(1,zerosaddenrechts)];
s2 = [zeros(1,zerosaddenlinks) s2 zeros(1,zerosaddenrechts)];
s3 = [zeros(1,zerosaddenlinks) s3 zeros(1,zerosaddenrechts)];
s4 = [zeros(1,zerosaddenlinks) s4 zeros(1,zerosaddenrechts)];
s5 = [zeros(1,zerosaddenlinks) s5 zeros(1,zerosaddenrechts)];

[max1, sampref]=max(abs(ref));
ref = ref(sampref-samplelinks:sampref+samplerechts);
s1 = s1(sampref-samplelinks:sampref+samplerechts);
s2 = s2(sampref-samplelinks:sampref+samplerechts);
s3 = s3(sampref-samplelinks:sampref+samplerechts);
s4 = s4(sampref-samplelinks:sampref+samplerechts);
s5 = s5(sampref-samplelinks:sampref+samplerechts);

[rAr1, laggr1]=xcorr(hhatref,hhat1);
[rAr2, laggr2]=xcorr(hhatref,hhat2);
[rA11, lagg11]=xcorr(hhat1,hhat1);
[rA12, lagg12]=xcorr(hhat1,hhat2);
[rA21, lagg21]=xcorr(hhat2,hhat1);
[rA22, lagg22]=xcorr(hhat2,hhat2);

[rAr1, laggr1]=xcorr(ref,s1);
[rAr2, laggr2]=xcorr(ref,s2);
[rA11, lagg11]=xcorr(s1,s1);
[rA12, lagg12]=xcorr(s1,s2);
[rA21, lagg21]=xcorr(s2,s1);
[rA22, lagg22]=xcorr(s2,s2);

[~,Ir1] = max(abs(rAr1));
[~,Ir2] = max(abs(rAr2));
[~,I11] = max(abs(rA11));
[~,I12] = max(abs(rA12));
[~,I21] = max(abs(rA21));
[~,I22] = max(abs(rA22));

lagDiffr1 = laggr1(Ir1);
lagDiffr2 = laggr2(Ir2);
lagDiffr11 = lagg11(I11);
lagDiffr12 = lagg12(I12);
lagDiffr21 = lagg21(I21);
lagDiffr22 = lagg22(I22);

timeDiffr1 = lagDiffr1/Fs;
timeDiffr2 = lagDiffr2/Fs;
timeDiff11 = lagDiffr11/Fs;
timeDiff12 = lagDiffr12/Fs;
timeDiff21 = lagDiffr21/Fs;
timeDiff22 = lagDiffr22/Fs;

%afstandref = timeDiff*speedsound
afstandr1 = timeDiffr1*speedsound
afstandr2 = timeDiffr2*speedsound
afstand11 = timeDiff11*speedsound
afstand12 = timeDiff12*speedsound
afstand21 = timeDiff21*speedsound
afstand22 = timeDiff22*speedsound

afstand=1;
end

