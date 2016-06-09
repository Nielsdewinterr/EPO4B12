function y = audio_recieve_new(N,maxChannel)
EPOCommunications('transmit', 'A1');

while (1)
    page=playrec('rec',N, 1 : maxChannel); % start recording in 
                                           % a new buffer page
    while(~playrec('isFinished')) % Wait till recording is done 
                             %(can also be done by turning on the block option)
    end
    y = double(playrec('getRec',page)); % get the data

    playrec('delPage'); % delete the page (can be done every few cycle)
    % end of the recording main loop

    % Here comes the localization and control code
    % We just plot the data here ...
%     
%     figure(1)
%     plot(y)
%     drawnow;
    in=input('','s');
    if (in=='q')
        break;
    end
    
    % to  be removed, for the final challenge
end
    
    EPOCommunications('transmit', 'A0');
end
