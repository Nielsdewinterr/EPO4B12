function r12 =TDOA2(s1,s2,ref1,ref2)

speedsound=340.29;
Fs=48000;
delta=500;
m = 1000;
n=800;

C1=conv(ref1,s1);
C2=conv(ref2,s2);

C1 = [zeros(1,m) C1 zeros(1,m)];
C2 = [zeros(1,m) C2 zeros(1,m)];

[~,samp]=max(abs(C1));
C1 = C1(samp-n:samp+n);
C2 = C2(samp-n:samp+n);

figure

plot(C1)
title('C1')
figure

plot(C2)
title('C2')

[~,samp1]=max(abs(C1));
[~,samp2]=max(abs(C2));

samp1 = find(abs(C1)>0.5*max(abs(C1)),10,'first')
samp2 = find(abs(C2)>0.5*max(abs(C2)),10,'first')

time=(samp2-samp1)/Fs;
r12=time*speedsound;




end