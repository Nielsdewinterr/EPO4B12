% making strings from int
c_f = num2str(c_f)
bit_f = num2str(bit_f)
%c = num2str(c)
ax = num2str(1)
r = num2str(r)

% code for sending 
Ff_c = strcat('F',c_f)
Fbit_f = strcat('B', bit_f)
ax = strcat('A', ax)
c = strcat('C', c)
r = strcat('R', r)

%sending signals
EPOCommunications('transmit', Ff_c);
EPOCommunications('transmit', Fbit_f);
EPOCommunications('transmit', c);
EPOCommunications('transmit', r);
EPOCommunications('transmit', ax);
EPOCommunications('transmit', 'S')
1