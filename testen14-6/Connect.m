prompt='Which COMport?';
% c = input(prompt,'s');
c=0;
while (c<100)
comport = horzcat('\\.\COM',num2str(c));
result = EPOCommunications('open',comport);
if result == 1
    break;
end
c=c+1;
end