function poging3 = poging3(s1, s2, ref)

speedsound=340;
Fs=48000;


[C]=conv(ref,s1);
[C2]=conv(ref,s2);
plot(C)
hold on 
plot(C2)
[~,I1] = max(abs(C));
[~,I2] = max(abs(C2));
I=I2-I1;
plot(C)
figure
% lagDiff = lag(I);
% lagDiff2 = lag(I2)
time3 = I/Fs;
% time = lagDiff/Fs;
% time2 = lagDiff2/Fs;
% time=time-time2;
poging3 = time3*speedsound;



end
