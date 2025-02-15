classdef EPOfunctions
    properties
    end
methods(Static)
    
    function status = status(hObject, eventdata, handles)
        global fakedist;
        if fakedist<10
          fakedist=300;
        else
          fakedist=fakedist-10;
        end
        stat = EPOCommunications('transmit','S');
        %stat = horzcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. ',num2str((50).*rand(1)+150),' * Mot. ',num2str((50).*rand(1)+150),' ************************** * Sensors: * Dist. L ',num2str(fakedist),' R ',num2str(fakedist),' * V_batt ',num2str((10).*rand(1)+20),' V ********************');
        %stat = strcat('************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. xxx * Mot. xxx ************************** * Sensors: * Dist. L xxx R xxx * V_batt xx.x V ********************');
        getdata = strread(stat,'%s');
        l=length(getdata);
        i=1;
        while(i<l)
            switch char(getdata(i));
                case 'Beacon:'
                    audioBeacon = getdata(find(strcmp('Beacon:',getdata))+1);
                    set(handles.audioBeacon,'String',audioBeacon);
                case 'c:'
                    c = getdata(find(strcmp('c:',getdata))+1);
                    set(handles.c ,'String',c);
                case 'f_c:'
                    f_c = getdata(find(strcmp('f_c:',getdata))+1);
                    set(handles.f_c ,'String',f_c);
                case 'f_b:'
                    f_b = getdata(find(strcmp('f_b:',getdata))+1);
                    set(handles.f_b ,'String',f_b);
                case 'c_r:'
                    c_r = getdata(find(strcmp('c_r:',getdata))+1);
                    set(handles.c_r ,'String',c_r);
                case 'PWM:'
                    PWM = getdata(find(strcmp('PWM:',getdata))+1); %todo
                    set(handles.PWM ,'String',PWM);
                case 'Dir.'
                    Dir = getdata(find(strcmp('Dir.',getdata))+1);
                    set(handles.Dir ,'String',Dir);
                case 'Mot.'
                    Mot = getdata(find(strcmp('Mot.',getdata))+1);
                    set(handles.Mot ,'String',Mot);
                case 'Sensors:'
                    Sensors = getdata(find(strcmp('Sensors:',getdata))+1); %todo
                    set(handles.Sensors ,'String',Sensors);
                case 'L'
                    distL = getdata(find(strcmp('L',getdata))+1);
                    set(handles.distL ,'String',distL);
                case 'R'
                    distR = getdata(find(strcmp('R',getdata))+1);
                    set(handles.distR ,'String',distR);
                case 'V_batt'
                    vBatt = getdata(find(strcmp('V_batt',getdata))+1);
                    set(handles.V_batt ,'String',vBatt);
                otherwise
            end
            i=i+1;
        end
            status = [Dir,Mot,distL,distR, vBatt];   
            
    end
    
end
end