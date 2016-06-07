
%achteruittest
%vaccu=16
%d 0.5seconde= 8
%D 1seconde = 39
%d 1.5seconde= 81
%d 2seconden= 127
%d 3seconden= 239



%vaccu=18.9
%d 0.5seconde=12
%D 1seconde = 61
%d 1.5seconde= 118
%d 2seconden= 188
%d 3seconden= 335





time=3



status = EPOCommunications('transmit','M140')
pause(time)

status = EPOCommunications('transmit','M157')
pause(0.3)
status = EPOCommunications('transmit','M150')

