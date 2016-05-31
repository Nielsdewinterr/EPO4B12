function afstand=afstand(punt1, punt2, ref)
speedsound=340;
Fs=48000;
zerosaddenlinks = 900;
zerosaddenrechts = 900;
samplelinks = 900;
samplerechts = 900;

hhatref = ch3(ref,ref);
hhatref1 = ch3(ref, punt1);
hhatref2 = ch3(ref, punt2);
hhat11 = ch3(punt1, punt1);
hhat12 = ch3(punt1, punt2);
hhat21 = ch3(punt2, punt1);
hhat22 = ch3(punt2, punt2);

hhatref = [zeros(1,zerosaddenlinks) hhatref zeros(1,zerosaddenrechts)];
hhatref1 = [zeros(1,zerosaddenlinks) hhatref1 zeros(1,zerosaddenrechts)];
hhatref2 = [zeros(1,zerosaddenlinks) hhatref2 zeros(1,zerosaddenrechts)];
hhat11 = [zeros(1,zerosaddenlinks) hhat11 zeros(1,zerosaddenrechts)];
hhat12 = [zeros(1,zerosaddenlinks) hhat12 zeros(1,zerosaddenrechts)];
hhat21 = [zeros(1,zerosaddenlinks) hhat21 zeros(1,zerosaddenrechts)];
hhat22 = [zeros(1,zerosaddenlinks) hhat22 zeros(1,zerosaddenrechts)];


[max1, sampref]=max(abs(hhatref));
hhatref = hhatref(sampref-samplelinks:sampref+samplerechts);
hhatref1 = hhatref(sampref-samplelinks:sampref+samplerechts);
hhatref2 = hhatref(sampref-samplelinks:sampref+samplerechts);
hhat11 = hhat11(sampref-samplelinks:sampref+samplerechts);
hhat12 = hhat12(sampref-samplelinks:sampref+samplerechts);
hhat21= hhat21(sampref-samplelinks:sampref+samplerechts);
hhat22= hhat22(sampref-samplelinks:sampref+samplerechts);

[maxref, sampref] = max(abs(hhatref));
[maxref1, sampref1] = max(abs(hhatref1));
[maxref2, sampref2] = max(abs(hhatref2));
[max11, samp11] = max(abs(hhat11));
[max12, samp12] = max(abs(hhat12));
[max21, samp21] = max(abs(hhat21));
[max22, samp22] = max(abs(hhat22));

diff1 = (sampref - sampref1) - (sampref - sampref2);
diff2 = samp11 - samp12;
diff3 = samp11 - samp21;
diff4 = samp22 - samp21;
diff5 = samp22 - samp12;

[rA12, lagg12]=xcorr(punt1,punt2);
[~,I12] = max(abs(rA12));
diff6 = lagg12(I12)

timeDiff1 = diff1/Fs;
timeDiff2 = diff2/Fs;
timeDiff3 = diff3/Fs;
timeDiff4 = diff4/Fs;
timeDiff5 = diff5/Fs;
timeDiff6 = diff6/Fs;

afstand1 = timeDiff1*speedsound
afstand2 = timeDiff2*speedsound
afstand3 = timeDiff3*speedsound;
afstand4 = timeDiff4*speedsound
afstand5 = timeDiff5*speedsound
afstand6 = timeDiff6*speedsound

afstand = (afstand1+ afstand2+afstand3+ afstand4+ afstand5+ afstand6)/6




end