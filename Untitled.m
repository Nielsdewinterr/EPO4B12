
audiodevinfo
ID = findInDevID('FrontMic')
pulse=[1 zeros(1,50)]
Fs_TX = 34029;
Fs_RX = 34029; % sample rate of the microphone
recObj = audiorecorder(Fs_RX,16,1,ID); % create audio object, 16 bits resolution
record(recObj); % do a 2 second recording
soundsc(pulse,Fs_TX)
pause(2);
stop(recObj);


% Store data in double-precision vector
y = getaudiodata(recObj);


% Plot the samples.
L=length(y)
t=[0:1/Fs_RX:(L-1)/Fs_RX]
plot(t,y);
set(zoom(gcf),'Motion','horizontal','Enable','on');
title('Audio channel impulse response 100 cm NLOS')
xlabel('time (s)')
ylabel('amplitude')
