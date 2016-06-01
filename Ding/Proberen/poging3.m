function poging3 = poging3(s1, s2, ref1, ref2)

speedsound=340;
Fs=48000;
samplelinks = 800;
samplerechts = 800;


% plot(ref1)
%hold on
S1 = (fft(s1));
S2 = (fft(s2));

% tresh=0.5*max(abs(S1));%treshold
% ii = find(abs(S1)<tresh);
% tresh=0.5*max(abs(S2));%treshold
% ij = find(abs(S2)<tresh);
% S1(ii)=0;
% S2(ij)=0;
% s1=ifft(S1);
% s2=ifft(S2);
% % plot(ref1)
% figure
% plot(Fref1)
% figure
% plot(Fref2)
% figure


C1=conv(ref1,s1);
C2=conv(ref2,s2);

C1 = [zeros(1,samplelinks) C1];
C2 = [zeros(1,samplelinks) C2];
% figure
% plot(C1)
% title('C1');
% figure
% plot(C2)
% title('C2');
% 
[~,sampref] = max(abs(C1));
C1 = C1(sampref-samplelinks:sampref+samplerechts);
C2 = C2(sampref-samplelinks:sampref+samplerechts);
% figure
% plot(C1)
% title('C1');
% figure
% plot(C2)
% title('C2');

[m, s] = (max(abs(C2)));
% I1 = find(C1 > 0.4*max(abs(C1)), 1, 'first')
% I2 = find(C2 > 0.4*max(abs(abs(C2))), 1, 'first')

[~,I1] = max(abs(C1))
[~,I2] = max(abs(C2))
% prompt = ('continue?');
% input(prompt);
% I = finddelay(s1,s2,800)

I=I1-I2;
time = I/Fs;
poging3 = time*speedsound;



end
