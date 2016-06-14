%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: EPO-4                                                        %
% Group: B11, Out, Klein, Kruijsse, De Winter                           %
% Name File:                                                            %
% Purpose:                                                              %
%                                                                       %
%                                                                       %
%                                                                       %
%                                                                       %
%                                                                       %
%                                                                       %
%                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c_f = 15000;        %carrier frequency max 30 kHz
bit_f = 5000;       %bit frequency
c = '0x0C4ECE877';   %code
ax = 1;
r = 700;           %rest time

% making strings from int
c_f = num2str(c_f);
bit_f = num2str(bit_f);
r = num2str(r);

% code for sending 
Ff_c = strcat('F',c_f);
Fbit_f = strcat('B', bit_f);
c = strcat('C', c);
r = strcat('R', r);

%sending signals

EPOCommunications('transmit', Ff_c);
%pause(0.25)
EPOCommunications('transmit', Fbit_f);
%pause(0.25)
EPOCommunications('transmit', c);
%pause(0.25)
EPOCommunications('transmit', r);
%pause(0.25)
EPOCommunications('transmit', 'S')