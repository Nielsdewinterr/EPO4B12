function poging3 = poging3(s1, s2, ref1, ref2)

speedsound=340;
Fs=48000;
samplelinks = 900
samplerechts = 900;

[C1]=conv(ref1,s1);
[C2]=conv(ref2,s2);
% plot(C)'

[~,sampref] = max(abs(C1));
C1 = C1(sampref-samplelinks:sampref+samplerechts);
C2 = C2(sampref-samplelinks:sampref+samplerechts);

plot(C1);
figure
plot(C2);


[~,I1] = max(abs(C1))
[~,I2] = max(abs(C2))

I=I2-I1
time = I/Fs;
poging3 = time*speedsound



end
