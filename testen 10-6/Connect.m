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
prompt='Which COMport?';
c = input(prompt,'s');
comport = horzcat('\\.\COM',c);
result = EPOCommunications('open',comport);