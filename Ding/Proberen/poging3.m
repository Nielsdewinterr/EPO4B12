function poging3 = poging3(s1, s2, ref)

speedsound=340;
Fs=48000;
zerosaddenlinks = 1000;
zerosaddenrechts = 1000;
samplelinks = 866;
samplerechts = 866;

s1 = ch3(ref, s1);
s2 = ch3(ref, s2);
s1 = [zeros(1,zerosaddenlinks) s1 zeros(1,zerosaddenrechts)];
s2 = [zeros(1,zerosaddenlinks) s2 zeros(1,zerosaddenrechts)];

[~,sampref]=max(abs(s1));
s1 = s1(sampref-samplelinks:sampref+samplerechts);
s2 = s2(sampref-samplelinks:sampref+samplerechts);
% subplot(311)
% plot(ref)
% subplot(312)
% plot(s1)
% subplot(313)
% plot(s2)
[C lag]=xcorr(s1,s2);
[~,I] = max(abs(C));
lagDiff = lag(I);
time = lagDiff/Fs;
poging3 = time*speedsound;
%plot(C)


end
