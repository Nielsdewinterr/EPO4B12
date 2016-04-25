status = EPOCommunications('transmit','M157')
status = EPOCommunications('transmit','D150')
while(1)
  
    status = EPOCommunications('transmit','Sd');
    dl=status(4:6);
    x=str2num(dl);
    if(x <150)
       status = EPOCommunications('transmit','M135')
       pause(0.3);
       status = EPOCommunications('transmit','M150')
       break
   
    end
end
