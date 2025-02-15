function inputbuffer = audio_recieve
    channels = 5;
    samplerate = 48000 ;     %Sample rate default = 41100 
    nsamples = 48000;   %the number of samples to record from each channel
    deviceid = 0; 
        %device ID default = 0
    EPOCommunications('transmit', 'A1');
    tic
    inputbuffer = pa_wavrecord(1,5,nsamples, [samplerate], [deviceid], ['asio']);
    toc
    342
    EPOCommunications('transmit', 'A0');
end
