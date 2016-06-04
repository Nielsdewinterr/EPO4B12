function inputbuffer = audio_recieve
    channels = 5
    samplerate = 44100      %Sample rate default = 41100 
    nsamples = 3000   %the number of samples to record from each channel
    deviceid = 0           %device ID default = 0
    EPOCommunications('transmit', 'A1');
    inputbuffer = pa_wavrecord(channels, nsamples, [samplerate], [deviceid], ['asio']);
    pause(2);
    1
    EPOCommunications('transmit', 'A0');
end
