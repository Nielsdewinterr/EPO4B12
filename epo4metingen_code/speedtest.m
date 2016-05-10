
status = EPOCommunications('transmit','D150')
while(1)
status = EPOCommunications('transmit','M160')
wait(3)
status = EPOCommunications('transmit','m140') 
wait(3)
end

