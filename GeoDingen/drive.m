function drive(turntime,straighttime,lr)
if lr == -1
 EPOCommunications('transmit', 'D100');
 EPOCommunications('transmit', 'M157');
 pause(turntime)
 
elseif lr == 1
 EPOCommunications('transmit', 'D200');
 EPOCommunications('transmit', 'M157');  
pause(turntime)
end

 EPOCommunications('transmit', 'D150');
 pause(straighttime)
 EPOCommunications('transmit', 'M150');    

end