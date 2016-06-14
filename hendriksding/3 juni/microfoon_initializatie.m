function [devId,Fs,N,maxChannel] = microfoon_initializatie
%% Find device ID

if playrec('isInitialised')
    playrec('reset');
end
devs = playrec('getDevices');
for id=1:size(devs,2)
    if(strcmp('ASIO4ALL v2',devs(id).name))
        break;
    end
end
devId=devs(id).deviceID;

%% initialization
Fs = 48000;
N = 9600; % # samples (records 100ms)
maxChannel = 5;% # mics

playrec('init', Fs, -1, devId);

if ~playrec('isInitialised')
    error ('Failed to initialise device at any sample rate');
end