function drive(turntime,straighttime,lr)
if lr == -1 %turn left
    EPOCommunications('transmit', 'D100');
    EPOCommunications('transmit', 'M157');
    pause(turntime)
elseif lr == 1 %turn right
    EPOCommunications('transmit', 'D200');
    EPOCommunications('transmit', 'M157');  
    pause(turntime)
else %no turn
end

EPOCommunications('transmit', 'D150');
EPOCommunications('transmit', 'M157');
pause(straighttime)
EPOCommunications('transmit', 'M150');    

end
