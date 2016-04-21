classdef EPOfunctions
    properties
    end
methods(Static)
    
    function status = status(hObject, eventdata, handles)
        %stat = EPOCommunications('transmit','S');
        stat = '************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. xxx * Mot. xxx ************************** * Sensors: * Dist. L xxx R xxx * V_batt xx.x V ********************';
        getdata = strread(stat,'%s');
        l=length(getdata);
        i=1;
        while(i<l)
            switch char(getdata(i))
                case 'Beacon:'
                    audioBeacon = getdata(find(strcmp('Beacon:',getdata))+1);
                case 'c:'
                    c = getdata(find(strcmp('c:',getdata))+1);
                case 'f_c:'
                    f_c = getdata(find(strcmp('f_c:',getdata))+1);
                case 'f_b:'
                    f_b = getdata(find(strcmp('f_b:',getdata))+1);
                case 'c_r:'
                    c_r = getdata(find(strcmp('c_r:',getdata))+1);
                case 'PWM:'
                    PMW = getdata(find(strcmp('PWM:',getdata))+1); %todo
                case 'Dir.'
                    Dir = getdata(find(strcmp('Dir.',getdata))+1);
                case 'Mot.'
                    Mot = getdata(find(strcmp('Mot.',getdata))+1);
                case 'Sensors:'
                    Sensors = getdata(find(strcmp('Sensors:',getdata))+1); %todo
                case 'L'
                    distL = getdata(find(strcmp('L',getdata))+1);
                case 'R'
                    distR = getdata(find(strcmp('R',getdata))+1);
                case 'V_batt'
                    vBatt = getdata(find(strcmp('V_batt',getdata))+1);
                otherwise
            end
            i=i+1;
        end
        
    end
    
end
end