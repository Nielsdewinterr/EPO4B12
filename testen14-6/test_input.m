prompt='Beginloacatie, xyrot?';
begin = input(prompt,'s');
a=strsplit(begin,',');
clear begin;
for i=1:3
    begin(i)=str2double(a(i))
    
end
