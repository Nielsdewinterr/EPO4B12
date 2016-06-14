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
%%%%%draai circle is 85cm ipv 1 m!!!!!!!!!!!!
%%
time=6.3
status = EPOCommunications('transmit','D100')
status = EPOCommunications('transmit','M158')
pause(time)

status = EPOCommunications('transmit','M140')
pause(0.3)
status = EPOCommunications('transmit','M150')
EPOCommunications('transmit','D150')
a=[0 10 30 52 90 125 160 180+25 220 245 180+105 180+135 335 360]
t=[0 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6 6.3]
%6s =335
%0.5=10
%1=30
%1.5=52
%2=90
%2.5=125
%3=160
%3.5=180+25
%4=220
%4.5=245
%5=180+105
%5.5=180+135
%6=335
%6.3=360

