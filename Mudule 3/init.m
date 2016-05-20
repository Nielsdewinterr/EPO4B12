123
global c_f;     %carrier frequency max 30 kHz
global bit_f;   %bit frequency
global c;       %code
global r;       %rest time

c_f = 15000;        %carrier frequency max 30 kHz
bit_f = 5000;       %bit frequency
c = '0x00000055';   %code
ax = 1;
r = 2500;           %rest time

% making strings from int
c_f = num2str(c_f)
bit_f = num2str(bit_f)
r = num2str(r)

% code for sending 
Ff_c = strcat('F',c_f)
Fbit_f = strcat('B', bit_f)
c = strcat('C', c)
r = strcat('R', r)

%sending signals
EPOCommunications('transmit', Ff_c);
EPOCommunications('transmit', Fbit_f);
EPOCommunications('transmit', c);
EPOCommunications('transmit', r);
EPOCommunications('transmit', 'S')