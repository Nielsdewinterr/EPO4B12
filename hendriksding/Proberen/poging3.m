function poging3 = poging3(s1, s2, ref1, ref2)

speedsound=340;
Fs=48000;
samplelinks = 800;
samplerechts = 800;

[C1]=conv(ref1,s1);
[C2]=conv(ref2,s2);
% plot(C)'
C1 = [zeros(1,samplelinks) C1];
C2 = [zeros(1,samplelinks) C2];

[~,sampref] = max(abs(C1));


C1 = C1(sampref-samplelinks:sampref+samplerechts);
C2 = C2(sampref-samplelinks:sampref+samplerechts);

plot(C1)
figure
plot(C2)
I1 = find(C1 > 0.6*max(abs(C1)), 1, 'first')
I2 = find(C2 > 0.5*max(abs(C2)), 1, 'first')
% [~,I1] = max(abs(C1))
% [~,I2] = max(abs(C2))
% prompt = ('continue?');
% input(prompt);
I=I2-I1;
time = I/Fs;
poging3 = time*speedsound;



end
