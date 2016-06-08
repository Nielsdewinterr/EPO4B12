
%vooruittest
%vaccu=16
%d 1 seconde=30
%d 1.5 seconde=59
%d 2 seconde=90
% d 3 seconde=163

%vaccu=17.9
%d 0.5 seconde =  20
%d 1 secondde = 52
%d 1.5 seconde = 91
%d 2 seconde = 139
%d 2.5 seconde = 203
%d 3 seconde = 266

%vaccu=18.9
%d 0.5 s  = 23
%d 1 seconde=39
%d 1.5 seconde=101
%d 2 seconde=169
% d 3 seconde=285

time=3


status = EPOCommunications('transmit','M158')
pause(time)

status = EPOCommunications('transmit','M140')
pause(0.18)
status = EPOCommunications('transmit','M150')

