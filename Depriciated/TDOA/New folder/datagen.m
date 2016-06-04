%Datagen:
% - initialisation signal 
% - sending signal
% - receive signal


function init
123
global c_f;     %carrier frequency max 30 kHz
global bit_f;   %bit frequency
global c;       %code
global r;       %rest time

c_f = 15000;     %max 30 kHz
bit_f = 5000;
c = '0xaa55aa55';
r = 2500;
send_audio;

%send_audio(50,150, '0xaa55aa55', 1, 500)

function send_audio
global c_f;
global bit_f;
global c;
global r;

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


function stop_audio
EPOCommunications('transmit', 'A0');
