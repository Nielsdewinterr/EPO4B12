function poging3 = poging3(s1, s2, ref1, ref2)
speedsound=300;
Fs=48000;
samplelinks = 8000;
samplerechts = 8000;

C1=conv(ref1,s1);
C2=conv(ref2,s2);

C1 = [zeros(1,samplelinks) C1 zeros(1,samplelinks)];
C2 = [zeros(1,samplelinks) C2 zeros(1,samplelinks)];

I1 = find(C1 == max(C1));
I2 = find(C2 == max(C2(I1-samplelinks:I1+samplerechts)));

I=I1-I2
time = I/Fs;
poging3 = time*speedsound;



end
