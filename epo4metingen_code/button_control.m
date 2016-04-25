figure
while(1)
    
    waitforbuttonpress;
    p = get(gcf, 'CurrentCharacter');
    p = double(p);
    if(p == 119)
        status = EPOCommunications('transmit','M157')
        status = EPOCommunications('transmit','D150')       
    elseif(p == 115)        
        status = EPOCommunications('transmit','M142')
        status = EPOCommunications('transmit','D150')        
    elseif(p ==97)
        status = EPOCommunications('transmit','D200')        
    elseif(p == 100)
        status = EPOCommunications('transmit','D100')
    elseif(p == 32)
        status = EPOCommunications('transmit','M150')
        status = EPOCommunications('transmit','D150')
    elseif(p == 113)
        status = EPOCommunications('transmit','M157')
        status = EPOCommunications('transmit','D200')
    elseif(p == 101)
        status = EPOCommunications('transmit','D100')
        status = EPOCommunications('transmit','M157')
    end
    status = EPOCommunications('transmit','S')
end
