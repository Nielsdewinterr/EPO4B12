prompt='Which COMport?';
c = input(prompt,'s');
comport = horzcat('\\.\COM',c);
result = EPOCommunications('open',comport);