function inputbuffer = audio_recieve
    channels = 5;
    samplerate = 48000 ;     %Sample rate default = 41100 
    nsamples = 48000;   %the number of samples to record from each channel
    deviceid = 0; 
        %device ID default = 0
        2
    3
    inputbuffer = pa_wavrecord(1,5,nsamples, [samplerate], [deviceid], ['asio']);
    
    4
end
